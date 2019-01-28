# JupyterSparkGraphFrames
Available on DockerHub: https://hub.docker.com/r/tomerlevi/jupyter-spark-graphframes

This image includes Jupyter notebook server including Spark and GraphFrames lib. The image is based on the official jupyter/all-spark-notebook

### Running:
```docker run -p 8888:8888 -p 4040:4040 -v ~:/home/jovyan/workspace --name jupyter tomerlevi/jupyter-spark-graphframes```

### Running providing custom Spark options:
```docker run -p 8888:8888 -p 4040:4040 -v ~:/home/jovyan/workspace -e SPARK_OPTS='--spark.executor.memory=1.5g --spark.driver.memory=0.5g' --name jupyter tomerlevi/jupyter-spark-graphframs```

Follow my blogpost for more details: https://medium.com/fundbox-engineering/overview-d3759e83969c
