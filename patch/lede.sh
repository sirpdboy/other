#!/bin/bash
pwd
ls

mv package/lean/luci-theme-argon  ../bak
mv feeds/luci/applications/luci-app-mwan3/luasrc/model/cbi/mwan/policyconfig.lua  ../bak
mv feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm  ../bak
mv feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua   ../bak
mv feeds/luci/applications/luci-app-mwan3/luasrc/model/cbi/mwan/policyconfig.lua  ../bak
mv package/lean/default-settings/files/zzz-default-settings   ../bak
mv package/lean/autocore/files/index.htm  ../bak
mv package/lean/autocore/files/cpuinfo  ../bak
sed -i 's/= "unreachable"/= "default"/g' feeds/luci/applications/luci-app-mwan3/luasrc/model/cbi/mwan/policyconfig.lua
sed -i 's/带宽监控/监控/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
wget -P  feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm
wget -P  feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua
wget -P package/lean/default-settings/files  https://raw.githubusercontent.com/siropboy/other/master/patch/default-settings/zzz-default-settings
sed -i 's/实时流量监测/监测/g' package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po
sed -i 's/网络存储/存储/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
sed -i '/filter_aaaa/d' package/network/services/dnsmasq/files/dhcp.conf
sed -i 's/$(VERSION_DIST_SANITIZED)/$(shell date +%Y%m%d-%H%M%S)-$(VERSION_DIST_SANITIZED)/g' include/image.mk
wget -P package/lean/autocore/files  https://raw.githubusercontent.com/siropboy/other/master/patch/autocore/files/index.htm
wget -P package/lean/autocore/files https://raw.githubusercontent.com/siropboy/other/master/patch/autocore/files/sbin/cpuinfo
pwd
ls
cd package/new
pwd
ls
##beardropper
git clone https://github.com/NateLol/luci-app-beardropper.git
sed -i 's/"luci.fs"/"luci.sys".net/g' luci-app-beardropper/luasrc/model/cbi/beardropper/setting.lua
sed -i '/firewall/d' luci-app-beardropper/root/etc/uci-defaults/luci-beardropper
mv luci-app-beardropper/po/zh_Hans   luci-app-beardropper/po/zh-cn
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus
git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan.git
svn co https://github.com/kenzok8/openwrt-packages/trunk/smartdnssmartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns
git clone -b master --single-branch https://github.com/destan19/OpenAppFilter.git
svn co https://github.com/kenzok8/openwrt-packages/trunk/AdGuardHome AdGuardHome
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome
svn co https://github.com/vernesong/OpenClash/branches/master/luci-app-openclash
git clone -b master --single-branch https://github.com/frainzy1477/luci-app-clash.git
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-clash package/new/luci-app-clash
sed -i 's/), 5)/), 48)/g' luci-app-clash/luasrc/controller/clash.lua
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/
chmod -R 755 ./
pwd
ls
exit 0
