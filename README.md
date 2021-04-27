一键脚本正确食用方式：

wget -q https://raw.githubusercontent.com/sirpdboy/other/master/jd/jdup.sh -O jdup.sh && chmod +x jdup.sh && ./jdup.sh

1.不保留配置升级，执行一键后到/usr/share/jd_openwrt_script/script_config文件夹下设置cookie和推送秘钥即可；
2.保留配置升级，执行一键脚本后正常情况下即可恢复安装运行，无需其他设置，如果报错可以再执行一次，或者进行重启后再试；
3.如果安装失败可以用以下命令控制插件重新安装,安装完重启

    /etc/init.d/jd_openwrt_script stop
    /etc/init.d/jd_openwrt_script start
