opkg update

opkg install libnghttp214 git git-http node node-npm openssh-client openssh-keygen python3

cd /etc/init.d

wget https://raw.githubusercontent.com/sirpdboy/other/master/jd/jd_openwrt_script -O jd_openwrt_script && chmod +x jd_openwrt_script

/etc/init.d/jd_openwrt_script start
