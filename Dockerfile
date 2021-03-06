FROM        centos:6.6

ADD         2.1.3.tar.gz /var/

RUN         mv /var/2.1.3 /var/etcd

RUN         cp /var/etcd/etcd /bin/etcd

RUN         cp /var/etcd/etcdctl  /bin/etcdctl

VOLUME ["/data"]

EXPOSE 4001 7001

ENTRYPOINT ["/bin/etcd"]

CMD ["-data-dir=/data"]
