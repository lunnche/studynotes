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
不能只到这里，windows无法用script，但可以用inkscape
## 画图
默认r 启动矩形画图工具
默认e 画ellipses
默认p 铅笔         改成w
默认b Bézier tool  改成f
自定z undo
自定shift+z delete
默认% toggle snapping 改成x

## Key chords to apply commonly used styles
Styling objects很常用：
* Shapes e.g. rec­tan­gles or cir­cles are most­ly black, light gray, white or trans­par­ent and op­tion­al­ly have a stroke.
* Lines (in­clud­ing strokes) are most­ly solid, dot­ted or dashed. They can be (very) thick or have a nor­mal width and op­tion­al­ly have an arrow on ei­ther side.

These op­tions com­bined give the fol­low­ing table of com­mon­ly used styles:

![Table of common styles](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211146056.png)

As ap­ply­ing these styles is some­thing I do very fre­quent­ly, I want it to be fast, but using the de­fault short­cuts in Inkscape takes too long. For ex­am­ple, sup­pose you’d like to change the style of some ob­jects as fol­lows:

![image-20210921114746654](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211147683.png)

You’d press `Ctrl+Shift+F` to open the styles panel, and up­date the style of each ob­ject by click­ing be­cause you can’t do this using key­board short­cuts in Inkscape. This is tire­some. Ide­al­ly, it should only take a frac­tion of a sec­ond.

![Using Inkscape's default shortcuts](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211148743.gif)

This is where *key chords* come into play. A key chord is a key­board short­cut which con­sists of two or more si­mul­ta­ne­ous key­strokes. For ex­am­ple, when I press `s` and `f `si­mul­ta­ne­ous­ly, my short­cut man­ag­er will apply a solid stroke and a grey fill to the cur­rent se­lec­tion. When I want the stroke to be thick, I press `s+f+g` to­geth­er, where `g` stands for thick (as the `t` key is hard to reach).

This way, every styling prop­er­ty cor­re­sponds to a key: `s` stands for nor­mal stroke, `f` for gray fill, `g` for thick, `a` for arrow, `d` for dot­ted, `e` for dashed, etc. Here’s the full table of pos­si­ble op­tions:

![Table of common styles with keyboard shortcuts added](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211149870.png)

Some styles in this table core­spond to only one key, e.g. the style in the top left cor­ner: filled in gray with­out a stroke. This could present a prob­lem, as only press­ing `f` gets you the Bézier tool. The so­lu­tion is to press `Space` + `f` where `Space` acts like a place­hold­er.

Using these key chords, the pre­vi­ous prob­lem can be solved in a few key­strokes:

- `f+s` makes the rectangle gray and gives it solid border.
- `f+h+e` stands for 'filled and very thickly dashed'.
- `a+g+d` adds an arrow and makes the line thickly dotted.

![Fast styling using custom shortcuts](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211212088.gif)

### Adding text

An­oth­er im­por­tant part of mak­ing fig­ures is adding text. As fig­ures often in­clude math­e­mat­i­cal for­mu­las, I want to be able to use [my snip­pets](https://castel.dev/post/lecture-notes-1) in Vim. To en­sure this, I can press `t` which opens a small Vim win­dow where I can type LaTeX. When I quit, a text node is in­sert­ed in Inkscape:

![LaTeX as text](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211223853.gif)

As I cov­ered be­fore, this text will be ren­dered by LaTeX when I in­sert the fig­ure in a doc­u­ment. How­ev­er, some­times I want to ren­der some LaTeX im­me­di­ate­ly, which I can do with `Shift+T`:

![LaTeX as svg](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211225504.gif)

Both these op­tions have their ad­van­tages and dis­ad­van­tages. I main­ly use the first method be­cause the text is ren­dered by the LaTeX doc­u­ment. This means the font will al­ways match and that you can use macros de­fined in the pre­am­ble of your doc­u­ment. A dis­ad­van­tage how­ev­er is that po­si­tion­ing of text is some­times a bit dif­fi­cult. As you don’t see the final re­sult in Inkscape, it some­times re­quires some hop­ping from Inkscape to my pdf view­er and back to fine-tune the re­sults.

### Saving and using less commonly used styles

While the key chord styles suf­fice 90% of the time, I some­times want to use a cus­tom style. For ex­am­ple, to draw op­tics di­a­grams it’s use­ful to have a glass and a ray style. To achieve this, I first have to cre­ate the style in Inkscape using the de­fault short­cuts:

![Creating the style with default shortcuts](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211227460.png)

To save these styles, I se­lect one of these ob­jects and press `Shift + s`. Then I type the name of the new style, in this case, ‘glass’ and press enter to con­firm. Now this style is saved and I can use it later on.

Now, when I se­lect an ob­ject, press `s` and type ‘glass’, the cor­re­spond­ing style will be ap­plied to the ob­ject. How­ev­er, it’s not nec­es­sary to type the full name be­cause style gets ap­plied im­me­di­ate­ly when there an unique style match­ing the typed char­ac­ters so far. For ex­am­ple, if I’d have only one style start­ing with ‘g’, typ­ing ‘g’ would be enough to apply the style. If you’d have mul­ti­ple styles, ‘gl’ or maybe even ‘gla’ would be nec­es­sary.

The an­noy­ing thing about this is that when­ev­er you type too many char­ac­ters — i.e. sup­pose typ­ing ‘gl’ would apply the style, but you’ve typed ‘gla’ — the re­main­ing keys, in this case `a` would be in­ter­pret­ed as an­oth­er com­mand, which would give un­in­tend­ed re­sults. There­fore, the short­cut man­ag­er waits 500 ms be­fore it goes back to the de­fault mode. This is enough time for a human to see that the style has been ap­plied and to stop typ­ing.

![Applying custom styles](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211230421.gif)

### Adding and saving objects

The final el­e­ment of my setup is adding and sav­ing ob­jects. I can add them with `a` and save them with `Shift+a`. For ex­am­ple, press­ing `a` and typ­ing ‘ec’ adds an el­lip­tic curve:

![Elliptic curve](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211233298.png)

As an­oth­er ex­am­ple, press­ing `a` and typ­ing `dg` adds a ‘key­hole’ (‘dg’ is the mir­ror image of ‘kh’ on the key­board). I can use `Ctrl+-` to sub­tract it from a given shape:

![Keyhole](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211234275.gif)

Some other ex­am­ples are blobs and 2D, 3D axis, which I’ve used quite fre­quent­ly in com­plex analy­sis and dif­fer­en­tial geom­e­try.

![A blob and 2D, 3D axis](https://raw.githubusercontent.com/lunnche/picgo-image/main/202109211235529.png)

## Code

If you want to try this out for your­self, you can find both my [script for man­ag­ing fig­ures in Vim](https://github.com/gillescastel/inkscape-figures) and my [Inkscape short­cut man­ag­er](https://github.com/gillescastel/inkscape-shortcut-manager) on Github. The first script should work out of the box on both Mac and Linux-based sys­tems; the sec­ond only works on Linux (it uses Xlib) and is a bit hard­er to set up.

