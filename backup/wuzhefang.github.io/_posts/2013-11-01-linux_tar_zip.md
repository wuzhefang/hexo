---
layout: post
title: "linux常用压缩命令简要说明+实例"
description: ""
category: "linux"
tags: [tar]
---
##linux zip命令

	zip -r myfile.zip ./*

将当前目录下的所有文件和文件夹全部压缩成myfile.zip文件,－r表示递归压缩子目录下所有文件.

	unzip

unzip -o -d /home/sunny myfile.zip
把myfile.zip文件解压到 /home/sunny/

-o:不提示的情况下覆盖文件;

-d:-d /home/sunny 指明将文件解压缩到/home/sunny目录下；

	zip -d myfile.zip smart.txt

删除压缩文件中smart.txt文件

	zip -m myfile.zip ./rpm_info.txt

向压缩文件中myfile.zip中添加rpm_info.txt文件

要使用 zip 来压缩文件，在 shell 提示下键入下面的命令：

	zip -r filename.zip filesdir

在这个例子里，filename.zip 代表你创建的文件，filesdir 代表你想放置新 zip 文件的目录。

-r 选项指定你想递归地（recursively）包括所有包括在 filesdir 目录中的文件。

要抽取 zip 文件的内容，键入以下命令：

	unzip filename.zip
 
你可以使用 zip 命令同时处理多个文件和目录，方法是将它们逐一列出，并用空格间隔：

	zip -r filename.zip file1 file2 file3 /usr/work/school 
 

上面的命令把 file1、file2、 file3、以及 /usr/work/school 目录的内容（假设这个目录存在）压缩起来，然后放入 filename.zip 文件中。

 

##linux tar 命令

　　-c: 建立压缩档案 	//create

　　-x：解压 			//extract

　　-t：查看内容 		//list

　　-r：向压缩归档文件末尾追加文件 //append 注：此字母r不易记忆，因为和原单词不沾边

　　-u：更新原压缩包中的文件//update

　　这五个是独立的命令，压缩解压都要用到其中一个，可以和别的命令连用但只能用其中一个。
下面的参数是根据需要在压缩或解压档案时可选的。

　　下面的参数-f是必须的

　　**-f: 使用档案名字，切记，这个参数是最后一个参数，后面只能接档案名。**

	# tar -cf all.tar *.jpg

　　这条命令是将所有.jpg的文件打成一个名为all.tar的包。-c是表示产生新的包，-f指定包的文件名。

	# tar -rf all.tar *.gif

　　这条命令是将所有.gif的文件增加到all.tar的包里面去。-r是表示增加文件的意思。

	# tar -uf all.tar logo.gif

　　这条命令是更新原来tar包all.tar中logo.gif文件，-u是表示更新文件的意思。

	# tar -tf all.tar

　　这条命令是列出all.tar包中所有文件，-t是列出文件的意思

	# tar -xf all.tar

　　这条命令是解出all.tar包中所有文件，-t是解开的意思

#####压缩

	tar –cvf jpg.tar *.jpg 
//将目录里所有jpg文件打包成jpg.tar

//-v verbose 冗长信息显示

	tar –czf jpg.tar.gz *.jpg 
//将目录里所有jpg文件打包成jpg.tar后，并且将其用gzip压缩，生成一个gzip压缩过的包，命名为jpg.tar.gz

//-z, --gzip, --gunzip, --ungzip   filter the archive through gzip

	tar –cjf jpg.tar.bz2 *.jpg 
//将目录里所有jpg文件打包成jpg.tar后，并且将其用bzip2压缩，生成一个bzip2压缩过的包，命名为jpg.tar.bz2

//-j, --bzip2                filter the archive through bzip2

	tar –cZf jpg.tar.Z *.jpg 
//将目录里所有jpg文件打包成jpg.tar后，并且将其用compress压缩，生成一个umcompress压缩过的包，命名为jpg.tar.Z

//-Z, --compress, --uncompress   filter the archive through compress

	rar a jpg.rar *.jpg 

//rar格式的压缩，需要先下载rar for linux


#####解压

**参考压缩参数说明**

　　tar –xvf file.tar //解压 tar包

　　tar -xzvf file.tar.gz //解压tar.gz

　　tar -xjvf file.tar.bz2 //解压 tar.bz2

　　tar –xZvf file.tar.Z //解压tar.Z

　　unrar e file.rar //解压rar

　　总结

	*.tar    	用tar –xvf 解压

	*.tar.bz2	用tar –xjf 解压

	*.tar.gz
	*.tgz 		用tar –xzf 解压

	*.tar.Z 	用tar –xZf 解压

	*.gz 		用gzip -d或者gunzip 解压

	*.bz2 		用bzip2 -d或者用bunzip2 解压

	*.Z 		用 uncompress 解压

	*.rar 		用 unrar e解压


　　到此为至，我们已经介绍过linux下的tar、gzip、gunzip、bzip2、bunzip2、compress、uncompress、 zip、unzip、rar、unrar等程式，你应该已经能够使用它们对.tar、.gz、.tar.gz、.tgz、.bz2、.tar.bz2、. Z、.tar.Z、.zip、.rar这10种压缩文件进行解压了，以后应该不需要为下载了一个软件而不知道如何在Linux下解开而烦恼了。而且以上方 法对于Unix也基本有效。
