FROM        centos:6.6

ADD         2.1.3/etcd /bin/etcd

ADD         2.1.3/etcdctl     /bin/etcdctl

VOLUME ["/data"]

EXPOSE 4001 7001

ENTRYPOINT ["/bin/etcd"]

CMD ["-data-dir=/data"]
