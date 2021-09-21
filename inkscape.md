# Inkscape

## 一些例子

![image-20210921101221864](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211012927.png)

![image-20210921101412294](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211014329.png)

![image-20210921101431973](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211014012.png)

![image-20210921101448301](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211014344.png)
## 什么是Inkscape
一种矢量图编辑器，适用各平台，算是Adobe Illustrtor的免费简化版，
可以用来设计，也可以用来绘制数学图像。

## 为什么选Inkscape
最常用的LaTeX绘图工具是TikZ,PSTricks和Asymptote。
他们有个共同点：写代码来画图
比如要画出这样的图

![image-20210921102315500](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211023524.png)
需要写这么多代码：

```latex
\begin{tikzpicture}
    \coordinate (A) at (1, 3);
    \draw[thick, ->] (0, 0) -- (A);
    \node[above right] at (A) {$A = (1, 2)$};
\end{tikzpicture}
```
这样做的好处是，画图就像编程一样：你可以使用变量，计算，`for`循环等等.
而且所有的文本样式都被LaTeX定义好了，你无需费力去设计图像样式，而且比如
你改动自动，整个图像会自动的变化而无需重新绘制。
然后这些有点是以牺牲速度且绘图时没有视觉直观反馈为代价的。尤其绘制复杂图像将
耗费大量时间，你不可能通过用鼠标拖拽图像来移动它。

## 在LaTex文档中包含Inkscape图像
用Inkscape绘图可以同时生成pdf格式图像和LaTeX代码

## 快速画图并放进LaTeX里
尤其在记笔记时，需要快速画图且保证不打断工作流。
而且不需要费时间打开Inkscape，寻找恰当的路径，敲代码来把画好的图放进LaTeX。
为达成上述目标，我在vim中增加了一些shortcut。
比如，当我输入我想画的图的名称，并且按下`Ctrl+F`，将会发生下列事情:
1. 根据LaTeX根文件找到图像路径
2. 查找是否存在同名图像，若存在，那么script什么也不做
3. 若不存在，把我的图像模板拷贝到图像路径
4. 包含图像名的当前行被替换为LaTeX代码来引入图像
5. 在Inkscape里打开新图像
6. 设置一个file watcher，使得当图像因按下`Ctrl+s`被保存为svg文件的同时，它也会被保存为
   pdf+LaTeX。这意味着不会弹出烦人的pdf保存会话。

看看效果：

![Adding a figure](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211105500.gif)
当我想要编辑一个图像时，我可以在normal mode按下`Ctrl+F`来打开一个选择会话框来搜索当前文档中的图像。选中一个后我将可以在Inkscape中修改它，保存图像后，图像的引入代码会复制到剪切板中。

![Editing a figure](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211110562.gif)
脚本的安装参见 https://github.com/gillescastel/inkscape-figures
貌似只能在linux和macos上使用

先到这里吧

