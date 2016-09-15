FROM centos
ARG HBASE_URL=http://www.webhostingreviewjam.com/mirror/apache/hbase/1.1.5/hbase-1.1.5-bin.tar.gz
ARG HBASE_VER=hbase-1.1.5
ARG PHOENIX_URL=http://www.webhostingreviewjam.com/mirror/apache/phoenix/phoenix-4.7.0-HBase-1.1/bin/phoenix-4.7.0-HBase-1.1-bin.tar.gz
ARG PHOENIX_VER=4.7.0-HBase-1.1

RUN yum install -y java-1.8.0-openjdk-devel net-tools wget unzip
RUN wget -nv ${HBASE_URL} -O /hbase.tgz
RUN tar -xzvf /hbase.tgz
RUN mv /${HBASE_VER} /hbase
RUN wget -nv ${PHOENIX_URL} -O /phoenix.tgz
RUN tar -xzvf /phoenix.tgz
RUN mv /phoenix-${PHOENIX_VER}-bin /phoenix
RUN cp /phoenix/phoenix-${PHOENIX_VER}-server.jar /hbase/lib
RUN echo "export JAVA_HOME=/usr/lib/jvm/java" >> /root/.bashrc
ADD conf /hbase/conf
ADD scripts /scripts
CMD sh /scripts/start.sh
