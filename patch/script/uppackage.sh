#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions
# Author: sirpdboy
# https://github.com/sirpdboy/Openwrt
rm -rf ./package/lean/v2ray-plugin
rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/lean/trojan
rm -rf ./package/lean/v2ray
rm -rf ./package/lean/luci-app-netdata
rm -rf ./package/lean/autocore
rm -rf ./package/lean/luci-app-vsftpd
rm -rf ./package/lean/default-settings
rm -rf ./package/lean/luci-theme-opentomcat
rm -rf ./feeds/packages/admin/netdata
rm -rf ./feeds/packages/net/miniupnpd
rm -rf ./feeds/packages/net/mwan3
rm -rf ./feeds/luci/applications/luci-app-nlbwmon
rm -rf ./feeds/packages/net/https-dns-proxy
rm -rf ./feeds/packages/net/smartdns
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
sed -i 's/家庭云//g' package/lean/luci-app-familycloud/luasrc/controller/familycloud.lua
sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf
sed -i "s/bootstrap/opentopd/g" feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/bootstrap/opentopd/g' feeds/luci/collections/luci/Makefile
sed -i 's/$(VERSION_DIST_SANITIZED)/$(shell date +%Y%m%d)-ipv6-/g' include/image.mk
echo "DISTRIB_REVISION='S$(date +%Y.%m.%d) Sirpdboy'" > ./package/base-files/files/etc/openwrt_release1
svn co https://github.com/jerrykuku/luci-app-jd-dailybonus/trunk/ ./package/new/luci-app-jd-dailybonus
git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan ./package/new/luci-app-serverchan
git clone -b master --single-branch https://github.com/destan19/OpenAppFilter ./package/new/OpenAppFilter
svn co  https://github.com/vernesong/OpenClash/trunk/luci-app-openclash ./package/new/luci-app-openclash
git clone -b master --single-branch https://github.com/frainzy1477/luci-app-clash ./package/new/luci-app-clash
sed -i 's/), 5)/), 49)/g' package/new/luci-app-clash/luasrc/controller/clash.lua
sed -i 's/), 1)/), 49)/g' package/new/luci-app-clash/luasrc/controller/clash.lua
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  ./package/new/luci-app-vssr
svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall ./package/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-package/trunk/package ./package/lienol
./scripts/feeds update -i
