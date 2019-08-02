---
layout: post
title: "ORACLE删除表空间中的所有表"
description: ""
category: "database"
tags: [sql]
---

* 如果是非sysdbA连接用如下sql语句

 

>     declare 
>     vsql varchar2(200);
>     cursor c1 is 
>       select 'drop table '||table_name||' cascade constraints' v_name 
>        from user_tables;
>     
>       BEGIN
>       for i in c1 loop
>       vsql:=i.v_name;
>       execute immediate vsql;
>     end loop;
>     end;
>     /

 

* 如果是sysdba连接的加上表空间名称


>     declare 
>     vsql varchar2(200);
>     cursor c1 is 
>       select 'drop table '||table_name||' cascade constraints' v_name 
>        from user_tables where tablespace_name='table_space_name';
>     
>       BEGIN
>       for i in c1 loop
>       vsql:=i.v_name;
>       execute immediate vsql;
>     end loop;
>     end;
>     /

