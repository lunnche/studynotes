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

1 猜测一个含有未知参数的函数 （待定系数法） 这个猜测是来源于对问题本质上得了解（domain knowledge）
    y=b+wx1       y是要预测的未来的点阅量    x是已知的点阅量
    b和w是未知的参数，要从数据中学习得来
带有未知参数的function就叫做model

x1是已知的youtube后台的资讯，叫做feature,w叫做weight，b叫做bias

2 Define Loss from Training Data

Loss is a function of parameters  L(b,w)
Loss : how good a set of values is .

真实值，正确的数值叫label   怎么计算Loss？给定一组（b,w），根据训练数据，计算所有预测值和真实值得偏差得总和求平均

$$
Loss:L=\frac{1}{N}\sum_{n}{e_n}
$$





 
