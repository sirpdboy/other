#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions
# Author: sirpdboy
# https://github.com/sirpdboy/Openwrt
#rm -rf ./package/new
# rm -rf ./package/lean/luci-theme-argon
#rm -rf ./package/lean/trojan
#rm -rf ./package/lean/v2ray
rm -rf ./package/lean/luci-app-netdata
rm -rf ./package/lean/luci-theme-opentomcat
rm -rf ./feeds/packages/net/miniupnpd
rm -rf ./feeds/packages/net/mwan3
rm -rf ./feeds/diy/adguardhome
rm -rf ./feeds/diy/smartdns
rm -rf ./feeds/packages/admin/netdata
rm -rf ./feeds/packages/net/smartdns
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/default-settings/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings
sed -i 's/网络存储/存储/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/带宽监控/监控/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
sed -i 's/家庭云//g' package/lean/luci-app-familycloud/luasrc/controller/familycloud.lua
sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/bootstrap/$default_theme/g' feeds/luci/collections/luci/Makefile
# sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-ipv6-/g' include/image.mk
sed -i 's/$(VERSION_DIST_SANITIZED)/$(shell date +%Y%m%d)-ipv6-/g' include/image.mk
curl -fsSL https://raw.githubusercontent.com/siropboy/other/master/patch/autocore/files/index.htm > ./package/lean/autocore/files/index.htm
curl -fsSL https://raw.githubusercontent.com/siropboy/other/master/patch/luci-app-accesscontrol/luasrc/controller/mia.lua > ./package/lean/luci-app-accesscontrol/luasrc/controller/mia.lua
curl -fsSL https://raw.githubusercontent.com/siropboy/other/master/patch/luci-app-accesscontrol/po/zh-cn/mia.po > ./package/lean/luci-app-accesscontrol/po/zh-cn/mia.po
curl -fsSL https://raw.githubusercontent.com/siropboy/other/master/patch/luci-app-accesscontrol/luasrc/view/mia/mia_status.htm > ./package/lean/luci-app-accesscontrol/luasrc/view/mia/mia_status.htm
curl -fsSL  https://raw.githubusercontent.com/Lienol/openwrt-packages/dev-19.07/net/https-dns-proxy/files/https-dns-proxy.config > ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.config
curl -fsSL  https://raw.githubusercontent.com/Lienol/openwrt-packages/dev-19.07/net/https-dns-proxy/files/https-dns-proxy.init > ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.init
echo "DISTRIB_REVISION='S$(date +%Y.%m.%d) Sirpdboy'" > ./package/base-files/files/etc/openwrt_release1
svn co https://github.com/siropboy/siropboy-package/trunk/netdata/ ./feeds/packages/admin/netdata
svn co https://github.com/siropboy/siropboy-package/trunk/luci-app-netdata/ ./package/lean/luci-app-netdata
svn co https://github.com/siropboy/siropboy-package/trunk/miniupnpd/ ./feeds/packages/net/miniupnpd
svn co https://github.com/siropboy/siropboy-package/trunk/mwan3/ ./feeds/packages/net/mwan3
svn co https://github.com/siropboy/siropboy-package/trunk/smartdns ./package/new/smartdns
svn co https://github.com/siropboy/siropboy-package/trunk/adguardhome ./package/new/adguardhome

# svn co https://github.com/jerrykuku/luci-app-jd-dailybonus/trunk/ ./package/new/luci-app-jd-dailybonus
# git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan ./package/new/luci-app-serverchan
# svn co https://github.com/kenzok8/openwrt-packages/trunk/smartdns ./package/new/smartdns
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns ./package/new/luci-app-smartdns
# git clone -b master --single-branch https://github.com/destan19/OpenAppFilter ./package/new/OpenAppFilter
# svn co https://github.com/kenzok8/openwrt-packages/trunk/adguardhome ./package/new/AdGuardHome
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome ./package/new/luci-app-adguardhome
git clone -b master --single-branch https://github.com/vernesong/OpenClash ./package/new/openclash
# git clone -b master --single-branch https://github.com/frainzy1477/luci-app-clash ./package/new/luci-app-clash
# sed -i 's/), 5)/), 49)/g' ./package/new/luci-app-clash/luasrc/controller/clash.lua
# sed -i 's/), 1)/), 49)/g' ./package/new/luci-app-clash/luasrc/controller/clash.lua
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  ./package/new/luci-app-vssr
svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall ./package/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-package/trunk/package ./package/lienol
./scripts/feeds update -i
