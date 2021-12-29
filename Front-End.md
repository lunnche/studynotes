## Front-End
调出浏览器调试工具 F12（chrome 火狐 IE都是）
mac 用 opt+command+j
调试工具很重要的应用就是帮你找bug
编辑器：hBuilder、sublime、dreamwever
photoshop

语言
html
CSS
JavaScript

## HTML
超文本标记语言

dreamweaver firwork flash 网页三剑客
hyper text 超文本 啥意思流媒体 图片声音 视频 之类的 不仅仅是文本的东西

html创建的文件扩展名是.html或者.htm
html是谁制定的？
w3c：世界万维网联盟 制定了HTML/XML/http/https等规范，每个浏览器生产厂家都会遵守规范
html规范目前最高的版本是HTML5.0，简称H5 
对jave程序员来说 重要的除了www还有apache

为了方便中国web前端程序员的开发，提供大量的帮助文档，
w3school
w3cschool
有人说第一个好用，第二个坑

html文件开头加上`<!doctype html>`表示是html5,否则为html4

`<!--这是HTML的注释-->`
支持多行注释
```
<!--
    1 jfskjfl
    2 lskjfklj
-->
```
标签不区分大小写
html语法松散不严格，删掉</html>也没事

## html基本标签 

### 段落标记  
```
<p></p>
```
### 标题字  
```
标题字是HTML预留格式，和word中的标题字相同
<h1></h1>  一直到 <h6></h6>  没有h7
```
### 换行  
```
<br>  br标签是一个独目标记
```
### 水平线  
```
<hr> 横线，独目标记

<hr color="red" width="50%"> 单引号也可 没有引号啥都没有也可 语法松散到这种程度
```
### 预留格式  
```
<pre></pre> 啥意思  不管你怎么分段，输出结果都是一行，加上pre可保留原有分段方式
```
### 粗体字  
```
<b></b>
```
### 斜体字  
```
<i></i>
```
### 插入字   
```
<ins></ins>
```
### 删除字   
```
<del></del>
```
### 右上角加字   
```
<sup></sup>
```
### 右下角加字  
```
<sub></sub>
```
### font标签  
```
<font color="red" size="50"></font>
```

## 实体符号
```
为啥单独设置这些破玩意，因为标签用了大于小于
如：b<a>c  b小于a大于c  但<a>标签本身表示超链接  引发歧义
所有实体符以&开始，以;结束

空格 &nbsp; 

大于号 &gt;

小于号 &lt;
```

## 表格  
```
为啥这个重要，把数据库的增删改查显示到网页上需要表格  

表格 <table> 

行 <tr>

格子<td>  

比如 一个3×3的表格  

border="1px" 设置表格的边框为1像素宽度。
width="300px" 表格整体宽度  除了像素形式，还可百分比 如30%
height="150px" 高度
align 对齐方式 

<table border="1px" width="300px" height="150px">
    <tr align="center">
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
</table>
```

## 单元格合并  
```

注意：
1. row合并的时候，删除“下面的”单元格
2. column合并的时候，删除谁没要求，因为它俩在一个<tr>里
3. 迭代合并暂不支持 

假设要合并 上下两个格子 删掉下面格子（若删掉上面格子会导致问题） 把上面格子<td>改下  
<td rowspan="2">内容</td>

列合并
<td colspan="2">内容</td>
```

## th 标签
```
th标签也是单元格，比td多的是居中、加粗，经常用于表头。
```

## thead、tbody、tfoot标签
```
表格头、体、脚  
不是必须，只是便于后期javascript代码的编写。

要注意的是：如前所述 rowspan 若被 tbody tfoot 等标签拆成两部分 会导致显示问题
```

hbuilder 不愿意用 ，用idea也可 

## 背景颜色和背景图片  
```
<meta charset="utf-8">
啥意思 告诉浏览器采用哪种字符集打开当前页面，并不是设置当前页面的字符编码方式
注意：如果用editplus以GBK编码方式编辑html，然后在<head>下加上<meta charset="utf-8">，用浏览器打开就会出乱码，改成<meta charset="GBK">即可
若用HBuilderX，用<meta charset="utf-8"可以正常显示，因为其本身就是用utf-8编码的。
IDEA也是用utf-8编码
```

```
背景色设置
<body bgcolor="red" background="img/bd_logo1.png">

这的图片平铺了，怎么避免平铺，1 把图片搞大点 2 css样式
```

## 图片img
```
<img src="img/bd_logo1.png" width="100px" height="200px" title="我是百度图片哦" alt="图片找不到哦" />   

注意
1 最后有个"/"
2 宽度、高度设置任一个即可,两个同时设置可能失真 【杠】或者其一设置为100%
3 title设置鼠标悬停时显示的信息
4 alt设置图片加载失败时显示的提示信息。
5 <img />   或者    <img></img>  都行，前提是<img></img>中间没东西

```

## 超链接或热链接
```
<a href="http://www.baidu.com">百度</a>

href: hot references 热引用

chrome opt+command+i 打开开发者模式 左上角小箭头（查看器） 可用来确定网页元素大小等信息

图片超链接
<a href="https://www.hao123.com/">
    <img src="img/hao123.png" width="120px" />
</a>

target属性 
_blank 在新窗口打开 
_self 当前窗口（默认）
_top 顶级窗口
_parent 父窗口

<a href="https://www.hao123.com/" target=" "

```

p14 看完



