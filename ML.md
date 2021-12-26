## Machine Learning

machine learning ≈ looking for function

* Speech Recognition

![Screen Shot 2021-12-20 at 2.11.16 PM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-20%20at%202.11.16%20PM.png)

* Image Recognition

![Screen Shot 2021-12-20 at 2.11.42 PM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-20%20at%202.11.42%20PM.png)

* Playing Go

![Screen Shot 2021-12-20 at 2.12.08 PM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-20%20at%202.12.08%20PM.png)

### Different types of Functions
Regression:The function outputs a scalar 用于连续值   

Classification:Given options(classes),the function outputs the correct one 用于离散值  

alphaGo其实也是分类问题 输入棋局，输出从19×19个分类（位置）中选一个

除了regression和classification，还有strctured learning,即机器学习除了分类，输出一个数值之外，还可以创造一个有结构的物件。
例如 画图，写文章 这种让机器产生有结构的东西的问题就叫structured learning
,即让机器学会创造。

一个例子 youtube过去的数据，预测明天的点阅总人数  

分三个步骤：

## 1
猜测一个含有未知参数的函数 （待定系数法） 这个猜测是来源于对问题本质上的了解（domain knowledge）  
$$
    y=b+wx_1
$$

y是要预测的未来的点阅量    x是已知的点阅量
    b和w是未知的参数，要从数据中学习得来
带有未知参数的function就叫做model

$x_1$是已知的youtube后台的资讯，叫做feature,w叫做weight，b叫做bias

## 2 
Define Loss from Training Data

Loss is a function of parameters  L(b,w)
Loss : how good a set of values is .

真实值，正确的数值叫label   怎么计算Loss？给定一组（b,w），根据训练数据，计算所有预测值和真实值的偏差的总和求平均

$$
Loss:L=\frac{1}{N}\sum_{n}{e_n}
$$
L越大，代表这一组参数越不好，e就是计算估算值和实测值之间的差距:  

***

$$
e=\left|y-\widehat{y}\right|        
$$
<center>L is mean absolute error (MAE)</center>  

***

$$
e=(y-\widehat{y})^2
$$
<center>L is mean square error (MSE)</center>
***

MSE和MAE有微妙的差别，具体选哪个应根据具体问题分析，这里选MAE
MSE也可以，作业里用MSE


有一些任务：
if y and $\widehat{y}$ are both probability distributions 概率分布
此时可能会选择Cross-entropy

![Screen Shot 2021-12-24 at 9.10.01 AM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-24%20at%209.10.01%20AM.png)
<center>上图为Loss函数图像，横坐标w，纵坐标b</center>
这种等高线图叫error surface

## 3
Optimization  

$$
w^*,b^* = \mathop{\arg\min}\limits_{w,b} L
$$

这个最优化问题可表述为：找一个最优的w,b值组，可以让L值最小，这个具体的w,b值，记为$w^*$,$b^*$
要怎么找出这个$w^*$,$b^*$值呢，用Gradient Descent方法 梯度下降

这个Gradient Descent方法具体怎么做呢，为表述方便，先假设只有一个未知参数w：
$$
w^*=\mathop{\arg\min}\limits_{w}L
$$

![Screen Shot 2021-12-26 at 6.03.42 PM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-26%20at%206.03.42%20PM.png)
这条曲线就是error surface的二维版


怎么找到这个让L值最小的w呢，即Gradient Descent的步骤：

**1 (Randomly)Pick an initial value**  
   $w^0$（有一些方法可以给我们一个比较好的初始值，但这里先整个随机的）

**2 compute**
   $\frac{\partial{L}}{\partial{w}}|_{w=w^0}$   

   计算w=$w^0$时，w这个参数对Loss的微分,即计算在$w_0$这一点，error surface切线的斜率，若切线的斜率是负的，即左边高右边低，那就把w值变大，就可以让Loss变小。
    反之减小w。
    增加或减小w，步幅多大呢，取决于两件事，1 斜率 2 $\eta$
    $$
    w^1\leftarrow w^0-\eta\frac{\partial{L}}{\partial{w}}|_{w=w^0}
    $$

$\eta$: learning rate
learning rate是自己设定的，像learning rate这种在机器学习中需要自己设定的东西叫做hyperparameters

之前说做机器学习第一步中包含未知参数，这些参数是机器自己找出来的  

为什么Loss可以是负的，Loss是估测的值和正确的值之差的绝对值，按理不可能是负，但是Loss这个function是你自己决定的，比如我定义一个Loss=绝对值-100，上图的Loss只是随便瞎画的，没有任何实际意义，若按一般问题中Loss为绝对值的定义，则不可能出现负值  

**3 Update w iteratively** 什么时候停下来呢 两种情况 1 你失去耐心 设定参数更新多少次后停下，这个多少次也是个hyperparameter，2 微分那一项算出来是0

因此，gradient descent方法有一个巨大的问题，那就是我们没有找到那个最好的解，梯度下降找到的是局部最优(local minima)，而非全局最优(global minima)

![Screen Shot 2021-12-26 at 6.24.01 PM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-26%20at%206.24.01%20PM.png)

所以有人说gradient descent不是个好方法，这个方法有local minima的问题，没有办法真的找到global minima。但这其实只是幻觉而已，假设你有做过深度学习相关的事情，假设你有自己训练network，自己做过Gradient Descent经验的话，其实local minima是一个假问题，我们在做Gradient Descent的时候，真正面对的难题不是local minima，到底是什么，之后会讲。

## 有两个参数的情况

$$
w^*,b^* = \mathop{\arg\min}_{w,b} L
$$

* (Randomly)Pick initial values $w^0,b^0$  
* Compute  
$$
\frac{\partial{L}}{\partial{w}}|_{w=w^0,b=b^0}
$$
$$
\frac{\partial{L}}{\partial{b}}|_{w=w^0,b=b^0}
$$

分别计算w对Loss的微分，b对Loss的微分  

$$
w^1 \leftarrow w^0 - \eta \frac{\partial{L}}{\partial{w}}|_{w=w^0,b=b^0}
$$
$$
b^1 \leftarrow b^0 - \eta \frac{\partial{L}}{\partial{b}}|_{w=w^0,b=b^0}
$$

如上，$w^0$ 减去 learning rate 乘上 微分的结果 得到 $w^1$  

那么这个微分要怎么算呢，其实 Can be done in one line in most deep learning frameworks

* Update w and b interatively  

为什么在这个方向前面要加上负号？  
因为如果算出来的微分是负的，说明右侧的L小，因此w要增大（往右移动），加上负号位移就为正了。

![Screen Shot 2021-12-26 at 8.10.37 PM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-26%20at%208.10.37%20PM.png)

p2 39:52
