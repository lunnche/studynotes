## 查看自己的VPN代理的socks端口
我的是端口4781

## 根据socks端口配置git代理
```
git config --global http.proxy socks5://127.0.0.1:端口

git config --global http.https://github.com.proxy socks5://127.0.0.1:端口
```

## 建议再配置以下两个，不然后续安装会报错（这是需要安装啥也不清楚。。。

```
git config --global http.version HTTP/1.1

git config --global http.postBuffer 524288000
```

## 查看配置是否成功
```
git config --global --list
```

## 如需要的话，如何重置回去？
```
git config --global --unset http.proxy

git config --global --unset http.https://github.com.proxy
```

