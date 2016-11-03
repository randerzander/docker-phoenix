FROM centos
ARG HBASE_URL=http://www.webhostingreviewjam.com/mirror/apache/hbase/1.1.7/hbase-1.1.7-bin.tar.gz
ARG HBASE_VER=hbase-1.1.7
ARG PHOENIX_URL=http://apache.osuosl.org/phoenix/apache-phoenix-4.8.1-HBase-1.1/bin/apache-phoenix-4.8.1-HBase-1.1-bin.tar.gz
#ARG PHOENIX_URL=http://www.webhostingreviewjam.com/mirror/apache/phoenix/phoenix-4.7.0-HBase-1.1/bin/phoenix-4.7.0-HBase-1.1-bin.tar.gz
ARG PHOENIX_VER=4.8.1-HBase-1.1

RUN yum install -y java-1.8.0-openjdk-devel net-tools wget unzip
RUN wget -nv ${HBASE_URL} -O /hbase.tgz
RUN tar -xzvf /hbase.tgz
RUN mv /${HBASE_VER} /hbase
RUN wget -nv ${PHOENIX_URL} -O /phoenix.tgz
RUN tar -xzvf /phoenix.tgz
RUN mv /apache-phoenix-${PHOENIX_VER}-bin /phoenix
RUN cp /phoenix/phoenix-${PHOENIX_VER}-server.jar /hbase/lib
RUN echo "export JAVA_HOME=/usr/lib/jvm/java" >> /root/.bashrc
ADD conf /hbase/conf
ADD scripts /scripts
CMD sh /scripts/start.sh
