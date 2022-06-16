Token 过期后的一系列的问题



git push 时候  说

Failed to connect to 127.0.0.1 port 多少:Connection refused



这种情况一般是代理造成的



先执行git config --global -l 命令 查看git代理设置

继续在终端执行git config --global -e 进入编辑状态，然后删掉端口有关的那条设置



然后保存重新执行就好了。







LibreSSL SSL_connect: Operation timed out in connection to github.com:443 

这个问题也是因为代理



怎么解决：

一种方法：

1 先设置代理（不是直接取消，先设置再取消）

```
git config --global http.proxy 'http://localhost:1080'
```

执行出现

```
Proxy CONNECT aborted
```

2 取消代理

```
git config --global --unset http.proxy
```

到此，大部分问题都能解决。







---



然后呢 你git push 就会出现 因为token过期导致的问题

remote: Invalid username or password.

fatal: Authentication failed for 'https://github.com/lunnche/Full_Stack_Engineer/'



怎么解决



