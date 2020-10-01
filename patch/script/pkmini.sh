#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions
# Author: sirpdboy
# https://github.com/sirpdboy/Openwrt
rm -rf ./feeds/packages/admin/netdata
# rm -rf ./feeds/diy/smartdns
rm -rf ./feeds/packages/net/smartdns
# rm -rf ./feeds/diy/adguardhome
# sed -i 's/= "unreachable"/= "default"/g' feeds/luci/applications/luci-app-mwan3/luasrc/model/cbi/mwan/policyconfig.lua
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/default-settings/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings
sed -i 's/网络存储/存储/g' ./package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/带宽监控/监控/g' ./feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
# sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
# sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
# sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
# sed -i 's/家庭云//g' package/lean/luci-app-familycloud/luasrc/controller/familycloud.lua
sed -i '/filter_aaaa/d' ./package/network/services/dnsmasq/files/dhcp.conf
curl -fsSL https://raw.githubusercontent.com/siropboy/other/master/patch/autocore/files/index.htm > package/lean/autocore/files/index.htm
curl -fsSL https://raw.githubusercontent.com/siropboy/other/master/patch/luci-app-accesscontrol/luasrc/controller/mia.lua > ./package/lean/luci-app-accesscontrol/luasrc/controller/mia.lua
curl -fsSL https://raw.githubusercontent.com/siropboy/other/master/patch/luci-app-accesscontrol/po/zh-cn/mia.po > ./package/lean/luci-app-accesscontrol/po/zh-cn/mia.po
curl -fsSL https://raw.githubusercontent.com/siropboy/other/master/patch/luci-app-accesscontrol/luasrc/view/mia/mia_status.htm > ./package/lean/luci-app-accesscontrol/luasrc/view/mia/mia_status.htm
curl -fsSL  https://raw.githubusercontent.com/Lienol/openwrt-packages/dev-19.07/net/https-dns-proxy/files/https-dns-proxy.config > ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.config
curl -fsSL  https://raw.githubusercontent.com/Lienol/openwrt-packages/dev-19.07/net/https-dns-proxy/files/https-dns-proxy.init > ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.init
echo "DISTRIB_REVISION='S$(date +%Y.%m.%d) Sirpdboy'" > ./package/base-files/files/etc/openwrt_release1
svn co https://github.com/siropboy/other/trunk/patch/netdata ./feeds/packages/admin/netdata
svn co https://github.com/siropboy/mypackages/trunk/luci-theme-opentopd ./package/new/luci-theme-opentopd
sed -i 's/$(VERSION_DIST_SANITIZED)/$(shell date +%Y%m%d)-ipv6-mini-/g' ./include/image.mk
svn co https://github.com/siropboy/mypackages/trunk/smartdns ./package/new/smartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns package/new/luci-app-smartdns
svn co https://github.com/siropboy/mypackages/trunk/luci-app-koolproxyR ./package/new/luci-app-koolproxyR
svn co https://github.com/siropboy/mypackages/trunk/luci-app-koolddns ./package/new/luci-app-koolddns
svn co https://github.com/siropboy/mypackages/trunk/luci-app-autopoweroff ./package/new/luci-app-autopoweroff
svn co https://github.com/siropboy/mypackages/trunk/luci-app-advanced ./package/new/luci-app-advanced
svn co https://github.com/siropboy/mypackages/trunk//luci-app-adguardhome ./package/new//luci-app-adguardhome
svn co https://github.com/siropboy/mypackages/trunk/adguardhome ./package/new/adguardhome
git clone -b master --single-branch https://github.com/vernesong/OpenClash/luci-app-openclash ./package/new/luci-app-openclash
# chmod 775 ./package/new/luci-app-autopoweroff/root/etc/init.d/a*
# chmod 775 ./package/new/luci-app-koolddns/root/etc/init.d/k*
# chmod 775  ./package/new/luci-app-koolddns/root/usr/share/koolddns/a*
# chmod 775  ./package/new/luci-app-koolddns/root/usr/share/koolddns/d*
