#docker-etcd

制作docker etcd服务端的镜像,后期我会及时更新etcd的版本

```
docker build -t rfyiamcool/etcd --file `pwd`/Dockerfile  `pwd`

Sending build context to Docker daemon 27.23 MB
Sending build context to Docker daemon
Step 0 : FROM centos:6.6
 ---> 8b44529354f3
Step 1 : ADD 2.1.3/etcd /bin/etcd
 ---> 4a07d17fbfad
Removing intermediate container b262dff48468
Step 2 : ADD 2.1.3/etcdctl /bin/etcdctl
 ---> 7098cd7e908f
Removing intermediate container e0e8be99f4bc
Step 3 : VOLUME /data
 ---> Running in ce1d36f467ff
 ---> 4bcbd7af2112
Removing intermediate container ce1d36f467ff
Step 4 : EXPOSE 4001 7001
 ---> Running in bc5df6926cb9
 ---> 1c3b1f898e1a
Removing intermediate container bc5df6926cb9
Step 5 : ENTRYPOINT /bin/etcd
 ---> Running in 3635abb21eb6
 ---> 2ac746a9054c
Removing intermediate container 3635abb21eb6
Step 6 : CMD -data-dir=/data
 ---> Running in c7f2decd92a0
 ---> 53bd9e8c879e
Removing intermediate container c7f2decd92a0
Successfully built 53bd9e8c879e
```

启动含有etcd server的容器
```
docker run --rm -it -p 4001:4001 -p 7001:7001 -v /var/etcd/:/data rfyiamcool/etcd:latest -addr 0.0.0.0:4001
```

我们再来创建etcdctl客户端的docker镜像.

```
docker build -t rfyiamcool/etcdctl --file `pwd`/Dockerfile_etcdctl  `pwd`
```

启动含有etcd客户端的容器.
```
ocker run --rm -it rfyiamcool/etcdctl:latest set blog xiaorui.cc
```


END.
