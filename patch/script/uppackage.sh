#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions
# Author: sirpdboy
# https://github.com/sirpdboy/Openwrt
sed -i 's/$(VERSION_DIST_SANITIZED)/$(shell date +%Y%m%d)-ipv6-/g' include/image.mk
svn co https://github.com/siropboy/mypackages/trunk/smartdns package/new/smartdns
svn co https://github.com/siropboy/mypackages/trunk/luci-app-smartdns package/new/luci-app-smartdns
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns package/new/luci-app-smartdns
svn co https://github.com/siropboy/mypackages/trunk/luci-app-koolproxyR package/new/luci-app-koolproxyR
svn co https://github.com/siropboy/mypackages/trunk/luci-app-eqos package/new/luci-app-eqos
svn co https://github.com/siropboy/mypackages/trunk/luci-app-koolddns package/new/luci-app-koolddns
svn co https://github.com/siropboy/mypackages/trunk/luci-app-autopoweroff package/new/luci-app-autopoweroff
svn co https://github.com/siropboy/mypackages/trunk/luci-app-advanced package/new/luci-app-advanced
svn co https://github.com/siropboy/mypackages/trunk/luci-app-cpulimit package/new/luci-app-cpulimit
svn co https://github.com/siropboy/mypackages/trunk/adguardhome package/new/adguardhome
svn co https://github.com/siropboy/mypackages/trunk/luci-app-adguardhome package/new/luci-app-adguardhome
svn co https://github.com/siropboy/mypackages/trunk/luci-app-control-webrestriction package/new/luci-app-control-webrestriction
svn co https://github.com/siropboy/mypackages/trunk/luci-app-control-weburl package/new/luci-app-control-weburl
svn co https://github.com/siropboy/mypackages/trunk/luci-app-pptp-vpnserver-manyusers package/new/luci-app-pptp-vpnserver-manyusers
svn co https://github.com/siropboy/mypackages/trunk/luci-theme-opentomcat  package/new/luci-theme-opentomcat
svn co https://github.com/siropboy/mypackages/trunk/luci-theme-btmod  package/new/luci-theme-btmod
svn co https://github.com/siropboy/mypackages/trunk/luci-theme-argon_new package/new/luci-theme-argon_new
svn co https://github.com/siropboy/mypackages/trunk/node-request package/new/node-request
svn co https://github.com/jerrykuku/luci-app-jd-dailybonus/trunk/ package/new/luci-app-jd-dailybonus
git clone -b master --single-branch https://github.com/vernesong/OpenClash/luci-app-openclash package/new/luci-app-openclash
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  package/new/luci-app-vssr
svn co https://github.com/siropboy/mypackages/trunk/lua-maxminddb package/new/lua-maxminddb
svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/new/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-package/trunk/package package/package
git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan package/new/luci-app-serverchan
chmod -R 755 ./
