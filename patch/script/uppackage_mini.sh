#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions
# Author: sirpdboy
# https://github.com/sirpdboy/Openwrt
sed -i 's/$(VERSION_DIST_SANITIZED)/$(shell date +%Y%m%d)-ipv6-mini-/g' ./include/image.mk
# svn co https://github.com/jerrykuku/luci-app-jd-dailybonus/trunk/ ./package/new/luci-app-jd-dailybonus
#git clone -b master --single-branch https://github.com/vernesong/OpenClash/luci-app-openclash ./package/new/luci-app-openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash ./package/new/luci-app-openclash
# svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  ./package/new/luci-app-vssr
svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall ./package/new/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-package/trunk/package ./package/package
# git clone -b master --single-branch https://github.com/frainzy1477/luci-app-clash ./package/new/luci-app-clash
# sed -i 's/), 5)/), 49)/g' ./package/new/luci-app-clash/luasrc/controller/clash.lua
# sed -i 's/), 1)/), 49)/g' ./package/new/luci-app-clash/luasrc/controller/clash.lua
# git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan ./package/new/luci-app-serverchan
# git clone -b master --single-branch https://github.com/destan19/OpenAppFilter ./package/new/OpenAppFilter
git clone -b master --single-branch https://github.com/siropboy/siropboy-package.git ./package/oppackpage
