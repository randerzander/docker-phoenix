FROM base
ARG HBASE_URL=https://archive.apache.org/dist/hbase/1.2.4/hbase-1.2.4-bin.tar.gz
ARG PHOENIX_URL=https://archive.apache.org/dist/phoenix/apache-phoenix-4.9.0-HBase-1.2/bin/apache-phoenix-4.9.0-HBase-1.2-bin.tar.gz

ARG HBASE_VER=hbase-1.2.4
ARG PHOENIX_VER=4.9.0-HBase-1.2

# Setup HBase binaries
RUN wget -nv ${HBASE_URL} -O /hbase.tgz
RUN tar -xzvf /hbase.tgz
RUN mv /${HBASE_VER} /hbase

# Setup Phoenix binaries
RUN wget -nv ${PHOENIX_URL} -O /phoenix.tgz
RUN tar -xzvf /phoenix.tgz
RUN mv /apache-phoenix-${PHOENIX_VER}-bin /phoenix
RUN cp /phoenix/phoenix-${PHOENIX_VER}-server.jar /hbase/lib

ADD conf /hbase/conf
CMD source /root/.bashrc; sh /hbase/bin/start-hbase.sh; sleep 10; /phoenix/bin/queryserver.py
