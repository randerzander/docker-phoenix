The intent of this project is to:

1. Provide a light, single-container [Apache Phoenix](http://phoenix.apache.org/) service for dev/testing
2. Expose both thick and [thin-client](http://phoenix.apache.org/server.html) Phoenix service endpoints

The container also runs [Apache HBase](http://hbase.apache.org/), configured for local storage instead of HDFS.

Build:
```
docker build -t phoenix .
```

Run
```
docker run -d -p8765:8765 -p 2181:2181 -p 16010:16010 -p 16020:16020 -p 16030:16030 phoenix
```
