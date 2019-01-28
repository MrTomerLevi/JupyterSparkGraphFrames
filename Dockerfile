FROM jupyter/all-spark-notebook
# todo: FROM jupyter/all-spark-notebook:8ccdfc1da8d5
LABEL maintainer="Tomer Levi <mr.tomerlevi@gmail.com>"

USER root

ENV GRAPH_JAR graphframes-0.6.0-spark2.3-s_2.11.jar
ENV GRAPH_DDL 0.6.0-spark2.3-s_2.11/$GRAPH_JAR 
ENV GRAPH_LIB /usr/local

# Spark GraphFrames download
RUN cd $GRAPH_LIB && \
    wget http://dl.bintray.com/spark-packages/maven/graphframes/graphframes/$GRAPH_DDL && \
    unzip $GRAPH_JAR && \
    mv $GRAPH_JAR $SPARK_HOME/jars/

# Scala logging - required for GraphFrames
RUN cd $GRAPH_LIB && \
    wget http://central.maven.org/maven2/com/typesafe/scala-logging/scala-logging-api_2.11/2.1.2/scala-logging-api_2.11-2.1.2.jar && \
    wget http://central.maven.org/maven2/com/typesafe/scala-logging/scala-logging-slf4j_2.11/2.1.1/scala-logging-slf4j_2.11-2.1.1.jar && \
    mv scala-logging-api_2.11-2.1.2.jar $SPARK_HOME/jars/ && \
    mv scala-logging-slf4j_2.11-2.1.1.jar $SPARK_HOME/jars/

ENV PYTHONPATH $PYTHONPATH:$GRAPH_LIB/graphframes