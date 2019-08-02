---
layout: post
title: "oracle kill session 解锁被锁定的表"
description: ""
category: "database"
tags: [oracle]
---
有时会因为执行某些sql未提交导致某些表被锁定。
 
出现这种问题后查V$LOCKED_OBJECT,要么等事务结束后再做，要么杀掉持有锁的会话（如果不是关键会话）：
1.通过上句查找出已被锁定的数据库表及相关的sid、serial#及spid

	select object_name as 对象名称,s.sid,s.serial#,p.spid as 系统进程号
	from v$locked_object l , dba_objects o , v$session s , v$process p
	where l.object_id=o.object_id and l.session_id=s.sid and s.paddr=p.addr;

2.在数据库中灭掉相关session
	alter system kill session 'sid,serial#';--sid及serial#为第一步查出来的数据。
