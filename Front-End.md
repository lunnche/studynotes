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

<table>
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
    <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
</table>
```


到 p8 01:59
