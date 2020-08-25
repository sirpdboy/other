#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions
# Author: sirpdboy
# https://github.com/sirpdboy/Openwrt
rm -rf ./package/new
rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/lean/trojan
rm -rf ./package/lean/luci-lib-docker
rm -rf ./package/lean/luci-theme-opentomcat
rm -rf ./package/lean/luci-app-netdata
rm -rf ./feeds/packages/admin/netdata
sed -i 's/= "unreachable"/= "default"/g' feeds/luci/applications/luci-app-mwan3/luasrc/model/cbi/mwan/policyconfig.lua
#sed -i 's/带宽监控/监控/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/default-settings/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings
#sed -i 's/实时流量监测/监测/g' package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po
#sed -i 's/网络存储/存储/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
#sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
#sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
#sed -i 's/家庭云//g' package/lean/luci-app-familycloud/luasrc/controller/familycloud.lua
sed -i '/filter_aaaa/d' package/network/services/dnsmasq/files/dhcp.conf
sed -i 's/$(VERSION_DIST_SANITIZED)/$(shell date +%Y%m%d)-$(VERSION_DIST_SANITIZED)/g' include/image.mk
curl -fsSL https://raw.githubusercontent.com/siropboy/other/master/patch/autocore/files/index.htm > package/lean/autocore/files/index.htm
echo "DISTRIB_REVISION='S$(date +%Y.%m.%d) Sirpdboy'" > ./package/base-files/files/etc/openwrt_release1
svn co https://github.com/siropboy/other/trunk/patch/netdata feeds/packages/admin/netdata
svn co https://github.com/siropboy/other/trunk/patch/luci-app-netdata ./package/lean/luci-app-netdata
svn co https://github.com/siropboy/mypackages/trunk/luci-theme-argon ./package/lean/luci-theme-argon
svn co https://github.com/siropboy/mypackages/trunk/luci-theme-opentomcat ./package/lean/luci-theme-opentomcat
wget https://github.com/pymumu/openwrt-smartdns/archive/master.zip -O ./package/new/master.zip
unzip package/new/smartdns/master.zip -d ./package/new
mv package/new/openwrt-smartdns-master ./package/new/smartdns
rm ./package/new/master.zip
wget https://github.com/pymumu/luci-app-smartdns/archive/lede.zip -O ./package/new/lede.zip
unzip package/new/lede.zip -d package/new
mv package/new/luci-app-smartdns-lede package/new/luci-app-smartdns
rm ./package/new/lede.zip
#svn co https://github.com/kenzok8/openwrt-packages/trunk/smartdns package/new/smartdns
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns package/new/luci-app-smartdns
#git clone -b master --single-branch https://github.com/destan19/OpenAppFilter package/new/OpenAppFilter
svn co https://github.com/kenzok8/openwrt-packages/trunk/adguardhome package/new/AdGuardHome
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome package/new/luci-app-adguardhome
git clone -b master --single-branch https://github.com/vernesong/OpenClash package/new/openclash
git clone -b master --single-branch https://github.com/frainzy1477/luci-app-clash package/new/luci-app-clash
sed -i 's/), 5)/), 48)/g' package/new/luci-app-clash/luasrc/controller/clash.lua
sed -i 's/), 1)/), 48)/g' package/new/luci-app-clash/luasrc/controller/clash.lua
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  package/new/luci-app-vssr
svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/new/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-go package/new/trojan-go
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-plus package/new/trojan-plus
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan ./package/lean/trojan
