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

若
$$
w^*=0.97,b^*=0.1k\\
L(w^*,b^*)=0.48k
$$
说明啥：
取w为0.97，b为0.1k 效果最好，即其实x1和y是接近的，所以当weight取接近1，bias取小值时，效果较好，L表明预测和实际点阅量的平均偏差在500人左右。

总结：
Machine Learning is so simple:
* Step1: function with unkown
* Step2: define loss from training data
* Step3: optimization

然后，上例的结果是最令人满意的结果吗：
$y=0.1k+0.97x_1$ achieves the smallest loss $L=0.48k$ on data of 2017-2020(training data)

也许不是，因为上述三部统称为训练(training)，即在已知的资料上去计算loss，其实只是在自high而已,即假装自己不知道隔天的点阅量，拿求出的函数y来预测，能得到0.48k的Loss，但我们真正在意的不是过去已经知道的东西，而是未来未知的观看次数

How about data of 2021 (unseen during training)?
$$
L'=0.58k
$$

 ![Screen Shot 2021-12-29 at 3.37.40 PM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-29%20at%203.37.40%20PM.png)

可是化后如上图所示：
发现每到周五、周六就没人学机器学习，可以理解，出去浪，
为什么周日大家都学机器学习，也许和youtube的推荐机制有关，一到周五、六就不推荐给大家机器学习的视频，搞不懂
总之，发现了这种周期性的规律后，就可以改进模型。

对模型的改进往往来自于你对这个问题的理解。即domain knowledge

一开始我们对问题完全不理解的时候，就胡乱写个$y=b+wx_1$，接下来我们观察真实数据后，得到一个结论：每隔七天有个循环，所以应该把前七天的观看人次都列入考虑。写出如下模型：
$$
y=b+\sum_{j=1}^{7}{w_jx_j}
$$

上面考虑了前7天，如果考虑更多会怎样呢？
$$
y=b+\sum_{j=1}^{28}{w_jx_j}
$$

![Screen Shot 2021-12-29 at 3.49.12 PM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-29%20at%203.49.12%20PM.png)

上图为考虑不断增加天数，对Loss的影响，可以看到考虑越多的天，Loss越小，但从28天增加到56天，对于预测未来已无提高，$L'$保持为0.46k  

上述的模型都是feature乘上weight加上bias，这类模型都叫做linear models  

linear models are too simple... we need more sophisticated models.  
也许x1和y之间有复杂的关系，但linear models永远只能表征一条直线，随着x1越来越高，y就理应越来越大，改变w和b只能调整斜率和y周截距，不管你怎么摆弄w和b，永远也造不出类似红色线这种体现物极必反规律的曲线  
Linear models have severe limitation   <b> Model Bias </b>

![Screen Shot 2021-12-29 at 4.00.13 PM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-29%20at%204.00.13%20PM.png)

We need a more flexible model!  

怎么做出红色线这样的model呢

观察发现：
<font color='red'>red curve</font>= constant + sum of a set of ![Screen Shot 2021-12-29 at 4.05.06 PM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-29%20at%204.05.06%20PM.png)


红色曲线可视做常量+一群蓝色图像的结果，蓝色图像的特点是：
当x轴的值小于某一个threshhold的时候，它是一个定值，大于另一个threshhold的时候，又是另一个定值，中间有一个斜坡，

常数项constant取决于图像和y轴的交点

怎么往上加蓝色图像呢，和红线同起点，斜坡的终点设在第一个转角处，保持蓝色图像和红线的斜率一样，0线+1线可得红线在第一个转折点之前的部分  

接下来再加蓝色线2，0线+1线+2线可得红线第二个转折点之前的部分。  

同理加线3 ![Screen Shot 2021-12-29 at 4.20.31 PM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-29%20at%204.20.31%20PM.png)



![Screen Shot 2021-12-29 at 4.23.16 PM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-29%20at%204.23.16%20PM.png)

即使x和y的关系，不是Piecewise Linear的Curves，可以先在曲线上取一些点，再把这些点连起来，变成一个piecewise linear 的curves，点取得越多，取的未知越合适，就越能逼近原来的曲线。

![Screen Shot 2021-12-29 at 4.29.40 PM](https://raw.githubusercontent.com/lunnche/picgo-image/main/Screen%20Shot%202021-12-29%20at%204.29.40%20PM.png)

p3 08:14
