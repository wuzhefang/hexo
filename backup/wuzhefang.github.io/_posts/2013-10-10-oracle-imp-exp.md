---
layout: post
title: "oracle中exp,imp的使用详解"
description: ""
category: "database"
tags: [oracle]
---

基本语法和实例： 

* EXP: 

>       有三种主要的方式（完全、用户、表） 
>     
>       1、完全： 
>     
>       EXP SYSTEM/MANAGER BUFFER=64000 FILE=C:\FULL.DMP FULL=Y 
>     
>       如果要执行完全导出，必须具有特殊的权限 
>     
>       2、用户模式： 
>     
>       EXP SONIC/SONICBUFFER=64000 FILE=C:\SONIC.DMP OWNER=SONIC 
>     
>       这样用户SONIC的所有对象被输出到文件中。 
>     
>       3、表模式：
>     
>       EXP SONIC/SONICBUFFER=64000 FILE=C:\SONIC.DMP OWNER=SONIC TABLES=(SONIC) 
>     
>       这样用户SONIC的表SONIC就被导出 

* IMP: 

>       具有三种模式（完全、用户、表） 
>     
>       1、完全： 
>     
>       IMP SYSTEM/MANAGER BUFFER=64000 FILE=C:\FULL.DMP FULL=Y 
>     
>       2、用户模式： 
>     
>       IMP SONIC/SONICBUFFER=64000 FILE=C:\SONIC.DMP FROMUSER=SONIC TOUSER=SONIC 
>     
>       这样用户SONIC的所有对象被导入到文件中。必须指定FROMUSER、TOUSER参数，这样才能导入数据。 
>     
>       3、表模式： 
>     
>       EXP SONIC/SONICBUFFER=64000 FILE=C:\SONIC.DMP OWNER=SONIC TABLES=(SONIC) 
>     
>       这样用户SONIC的表SONIC就被导入。



#ORACLE数据库有两类备份方法：

* 第一类为物理备份，该方法实现数据库的完整恢复，但数据库必须运行在归挡模式下（业务数据库在非归挡模式下运行），且需要极大的外部存储设备，例如磁带库；

* 第二类备份方式为逻辑备份，业务数据库采用此种方式，此方法不需要数据库运行在归挡模式下，不但备份简单，而且可以不需要外部存储设备。

	数据库逻辑备份方法
　　

　　ORACLE数据库的逻辑备份分为三种模式：`表备份`、`用户备份`和`完全备份`。

　　
  **表模式**

　　
　　备份某个用户模式下指定的对象（表）。业务数据库通常采用这种备份方式。

　　
　　若备份到本地文件，使用如下命令：
　　
>     　　exp icdmain/icd rows=y indexes=n compress=n buffer=65536
>     　　feedback=100000 volsize=0
>     　　file=exp_icdmain_csd_yyyymmdd.dmp
>     　　log=exp_icdmain_csd_yyyymmdd.log
>     　　tables=icdmain.commoninformation,icdmain.serviceinfo,icdmain.dealinfo
　　
   若直接备份到磁带设备，使用如下命令：

>     　　exp icdmain/icd rows=y indexes=n compress=n buffer=65536
>     　　feedback=100000 volsize=0
>     　　file=/dev/rmt0
>     　　log=exp_icdmain_csd_yyyymmdd.log
>     　　tables=icdmain.commoninformation,icdmain.serviceinfo,icdmain.dealinfo
　　
　　注：在磁盘空间允许的情况下，应先备份到本地服务器，然后再拷贝到磁带。出于速度方面的考虑，尽量不要直接备份到磁带设备。

　　**用户模式**

　　备份某个用户模式下的所有对象。业务数据库通常采用这种备份方式。

　　若备份到本地文件，使用如下命令：

>     　　exp icdmain/icd owner=icdmain rows=y indexes=n compress=n buffer=65536
>     　　feedback=100000 volsize=0
>     　　file=exp_icdmain_yyyymmdd.dmp
>     　　log=exp_icdmain_yyyymmdd.log

　　若直接备份到磁带设备，使用如下命令：

>     　　exp icdmain/icd owner=icdmain rows=y indexes=n compress=n buffer=65536
>     　　feedback=100000 volsize=0
>     　　file=/dev/rmt0
>     　　log=exp_icdmain_yyyymmdd.log

　　注：如果磁盘有空间，建议备份到磁盘，然后再拷贝到磁带。如果数据库数据量较小，可采用这种办法备份。

 

　　以下为详细的导入导出实例：

　　一、数据导出：

 

　　1、 将数据库TEST完全导出，用户名system 密码manager 导出到D：\daochu.dmp中

 

　　exp system/manager@TEST file=d：\daochu.dmp full=y

 

　　2、 将数据库中system用户与sys用户的表导出

 

　　exp system/manager@TEST file=d：\daochu.dmp owner=（system，sys）

 

　　3、 将数据库中的表table1 、table2导出

 

　　exp system/manager@TEST file=d：\daochu.dmp tables=（table1，table2）

 

　　4、 将数据库中的表table1中的字段filed1以"00"打头的数据导出

 

　　exp system/manager@TEST file=d：\daochu.dmp tables=（table1） query=\" where filed1 like '00%'\"

 

　　上面是常用的导出，对于压缩我不太在意，用winzip把dmp文件可以很好的压缩。

 

　　不过在上面命令后面 加上 compress=y  就可以了

 

　　二、数据的导入

 

 　 1、将D：\daochu.dmp 中的数据导入 TEST数据库中。

 

　　imp system/manager@TEST  file=d：\daochu.dmp

 

　　上面可能有点问题，因为有的表已经存在，然后它就报错，对该表就不进行导入。

 

　　在后面加上 ignore=y 就可以了。

 

　　2 将d：\daochu.dmp中的表table1 导入

 

　　imp system/manager@TEST  file=d：\daochu.dmp  tables=（table1）

 

　　基本上上面的导入导出够用了。不少情况我是将表彻底删除，然后导入。

 

　　注意：

 

　　你要有足够的权限，权限不够它会提示你。

 

　　数据库时可以连上的。可以用tnsping TEST 来获得数据库TEST能否连上。
