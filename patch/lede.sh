#=================================================
# Description: Build OpenWrt using GitHub Actions
# Author: sirpdboy
# https://github.com/sirpdboy/OnkeyOpenwrt
#!/bin/bash
red='\e[91m'
green='\e[92m'
yellow='\e[93m'
echo -e "--------------------------------------------"
echo -e "---------------更新必备插件库---------------"
echo -e "--------------------------------------------"
git clone https://github.com/siropboy/mypackages package/mypackages
git clone https://github.com/siropboy/mysmall package/mysmall
#优化feeds luci
rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/lean/luci-theme-rosy
rm -rf ./package/lean/luci-theme-opentomcat
sed -i 's/= "unreachable"/= "default"/g' feeds/luci/applications/luci-app-mwan3/luasrc/model/cbi/mwan/policyconfig.lua
sed -i 's/带宽监控/监控/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
wget -P  ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm
wget -P  ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua
wget -P package/lean/default-settings/files  https://raw.githubusercontent.com/siropboy/other/master/patch/default-settings/zzz-default-settings
sed -i 's/实时流量监测/监测/g' package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po
sed -i 's/网络存储/存储/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
sed -i '/filter_aaaa/d' package/network/services/dnsmasq/files/dhcp.conf
sed -i 's/$(VERSION_DIST_SANITIZED)/$(shell date +%Y%m%d-%H%M%S)-$(VERSION_DIST_SANITIZED)/g' include/image.mk
wget -P package/lean/autocore/files  https://raw.githubusercontent.com/siropboy/other/master/patch/autocore/files/index.htm
wget -P package/lean/autocore/files https://raw.githubusercontent.com/siropboy/other/master/patch/autocore/files/sbin/cpuinfo
##获取额外package
echo -e "--------------------------------------------------"
echo -e "---------------同步更新最新额外插件---------------"
echo -e "--------------------------------------------------"
rm -rf ./package/new
##beardropper
git clone https://github.com/NateLol/luci-app-beardropper package/new/luci-app-beardropper
sed -i 's/"luci.fs"/"luci.sys".net/g' package/new/luci-app-beardropper/luasrc/model/cbi/beardropper/setting.lua
sed -i '/firewall/d' package/new/luci-app-beardropper/root/etc/uci-defaults/luci-beardropper
mv package/new/luci-app-beardropper/po/zh_Hans   package/new/luci-app-beardropper/po/zh-cn
##SSRP
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/new/luci-app-ssr-plus
##simple-obfs
#git clone -b master --single-branch https://github.com/aa65535/openwrt-simple-obfs package/new/simple-obfs
##SeverChan
git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan package/new/luci-app-serverchan
##SmartDNS
svn co https://github.com/kenzok8/openwrt-packages/trunk/smartdns package/new/smartdns 
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns package/new/luci-app-smartdns
##上网APP过滤
git clone -b master --single-branch https://github.com/destan19/OpenAppFilter package/new/OpenAppFilter
##AdGuardHome
svn co https://github.com/kenzok8/openwrt-packages/trunk/AdGuardHome package/new/AdGuardHome
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome package/new/luci-app-adguardhome
##OpenClash
svn co https://github.com/vernesong/OpenClash/branches/master/luci-app-openclash package/new/luci-app-openclash
##clash
git clone -b master --single-branch https://github.com/frainzy1477/luci-app-clash package/new/luci-app-clash
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-clash package/new/luci-app-clash
sed -i 's/), 5)/), 48)/g' package/new/luci-app-clash/luasrc/controller/clash.lua
##passwall
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall package/new/luci-app-passwall
##luci-app-vssr
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/ package/new/luci-app-vssr
#授予权限
chmod -R 755 ./
exit 0
