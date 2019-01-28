# JupyterSparkGraphFrames Docker Image
Available on DockerHub: https://hub.docker.com/r/tomerlevi/jupyter-spark-graphframes

This image includes Jupyter notebook server including Spark and GraphFrames lib. The image is based on the official jupyter/all-spark-notebook

### Running:
```docker run -p 8888:8888 -p 4040:4040 -v ~:/home/jovyan/workspace --name jupyter tomerlevi/jupyter-spark-graphframes```

### Running providing custom Spark options:
```docker run -p 8888:8888 -p 4040:4040 -v ~:/home/jovyan/workspace -e SPARK_OPTS='--spark.executor.memory=1.5g --spark.driver.memory=0.5g' --name jupyter tomerlevi/jupyter-spark-graphframs```

Follow my blogpost for more details: https://medium.com/fundbox-engineering/overview-d3759e83969c

### Example code (python):
```
from pyspark.sql import SQLContext
from pyspark import SparkContext
from pyspark.sql import SparkSession
from graphframe import *

spark = SparkSession.builder.master("local").appName("Spark-GraphFrames").getOrCreate()
spark.sparkContext.setCheckpointDir('/tmp/graphframes_cps') 

# Create DataFrames manually for testing purposes
from pyspark.sql import Row

v = spark.createDataFrame([
    Row(id='1',label='fedex'), 
    Row(id='2',label='mcDonalds'), 
    Row(id='3',label='verizon'), 
    Row(id='4',label='facebook'), 
    Row(id='5',label='googleAds'),
])

e = spark.createDataFrame([ 
    ('1', '2', 'friend'), 
    ('3', '2', 'friend'),
    ('4', '5', 'friend')
],['src', 'dst', 'type'])

# Now lets construct the graph
g = GraphFrame(v,e)

connected = g.connectedComponents()
connected.show()
```
