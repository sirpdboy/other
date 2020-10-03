#/bin/sh
device_name='SIRPDLEDE'
wifi_name="SirpdboyWIFI"
lan_ip='192.168.1.1'
utc_name='Asia\/Shanghai'
default_theme='opentopd'
rm -rf ./package/lean/luci-app-kodexplorer 
rm -rf ./package/lean/luci-lib-docker 
rm -rf ./package/lean/luci-app-dockerman 
rm -rf ./package/lean/luci-theme-argon 
rm -rf ./package/lean/luci-theme-opentomcat 
rm -rf ./package/lean/trojan 
rm -rf ./package/lean/luci-app-netdata 
rm -rf ./package/lean/autocore 
rm -rf ./package/lean/luci-app-vsftpd 
rm -rf ./package/lean/default-settings 
rm -rf ./package/lean/v2ray 
rm -rf ./package/lean/v2ray-plugin 
rm -rf ./feeds/packages/admin/netdata 
rm -rf ./feeds/packages/net/miniupnpd 
rm -rf ./feeds/packages/net/mwan3 
rm -rf ./feeds/packages/net/https-dns-proxy 
rm -rf ./feeds/packages/net/smartdns 
rm -rf ./feeds/packages/net/kcptun 
rm -rf ./feeds/luci/applications/luci-app-sqm
rm -rf ./feeds/luci/applications/luci-app-nlbwmon 

# sed -i "s/OpenWrt/$device_name/g" package/base-files/files/bin/config_generate
#sed -i "s/OpenWrt/$wifi_name/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i "s/192.168.1.1/$lan_ip/g" package/base-files/files/bin/config_generate
#sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='$utc_name'/g" package/base-files/files/bin/config_generate
sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/bootstrap/$default_theme/g' feeds/luci/collections/luci/Makefile
sed -i '/filter_/d' package/network/services/dnsmasq/files/dhcp.conf
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
#curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/default-settings/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings
echo "DISTRIB_REVISION='S$(date +%Y.%m.%d) Sirpdboy'" > package/base-files/files/etc/openwrt_release1
./scripts/feeds update -i
