一键脚本正确食用方式：

wget -q https://raw.githubusercontent.com/sirpdboy/other/master/jd/jdup.sh -O jdup.sh && chmod +x jdup.sh && ./jdup.sh

1.不保留配置升级，执行一键后到/usr/share/jd_openwrt_script/script_config文件夹下设置cookie和推送秘钥即可；
2.保留配置升级，执行一键脚本后正常情况下即可恢复安装运行，无需其他设置，如果报错可以再执行一次，或者进行重启后再试；
3.如果安装失败可以用以下命令控制插件重新安装,安装完重启

    /etc/init.d/jd_openwrt_script stop
    /etc/init.d/jd_openwrt_script start


1.文件说明

  /usr/share/jd_openwrt_script/script_config/jdCookie.js  在此脚本内填写JD Cookie 脚本内有说明
  /usr/share/jd_openwrt_script/script_config/sendNotify.js  在此脚本内填写推送服务的KEY，可以不填
  /usr/share/jd_openwrt_script/script_config/USER_AGENTS.js  京东UA文件可以自定义也可以默认
  /usr/share/jd_openwrt_script/script_config/JS_USER_AGENTS.js  京东极速版UA文件可以自定义也可以默认
  /usr/share/jd_openwrt_script/script_config/config/Script_blacklist.txt  脚本黑名单，用法去看这个文件

 JS脚本活动列表： /usr/share/jd_openwrt_script/JD_Script/git_clone/lxk0301/README.md 
 浏览器获取京东cookie教程： /usr/share/jd_openwrt_script/JD_Script/git_clone/lxk0301/backUp/GetJdCookie.md 
 脚本获取京东cookie： node /usr/share/jd_openwrt_script/JD_Script/js/getJDCookie.js 

 注意：请停掉你之前运行的其他jd脚本，然后把 JS脚本活动列表的活动全部手动点开一次，不知活动入口的，/usr/share/jd_openwrt_script/JD_Script/js/你要的js脚本里有写

 2.jd.sh脚本命令

  sh $jd run_0  run_07      #运行全部脚本(除个别脚本不运行)

个别脚本有以下：

  sh $jd npm_install         #安装 npm 模块

  sh $jd jx          #查询京喜商品生产使用时间

  sh $jd jd_sharecode        #查询京东所有助力码

  sh $jd joy         #运行疯狂的JOY(两个号需要1G以上，sh $jd kill_joy 杀掉进程，彻底关闭需要先杀进程再禁用定时任务的代码)

  sh $jd checklog         #检测log日志是否有错误并推送

  sh $jd that_day         #检测JD_script仓库今天更新了什么

  sh $jd script_name         #显示所有JS脚本名称与作用

  sh $jd backnas         #备份脚本到NAS存档

  sh $jd stop_script         #删除定时任务停用所用脚本

 如果不喜欢这样，你也可以直接 cd $jd_file/js,然后用 node 脚本名字.js 

 3.检测定时任务: 定时任务与设定一致
   定时任务路径:/etc/crontabs/root

 4.如何排错或者你想要的互助码:

  答1：如何排错有种东西叫更新，如sh $jd update_script 和sh $jd update
  答2：如何排错有种东西叫查日志，如/tmp/里面的jd开头.log结果的日志文件
  答3：你想要的互助码 sh $jd jd_sharecode

  看不懂代码又想白嫖，你还是洗洗睡吧，梦里啥都有，当然你可以用钞能力解决多数问题（你可以忽略这句，继续做梦）

 5.检测脚本是否最新: 最新 

 6.个性化配置：  jd_config最新 /usr/share/jd_openwrt_script/script_config/jd_openwrt_script_config.txt
