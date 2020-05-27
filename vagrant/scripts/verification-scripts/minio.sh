
sudo su - root
sudo /minio server /minio-data

export AWS_ACCESS_KEY_ID=minioadmin
export AWS_SECRET_ACCESS_KEY=minioadmin
/opt/hadoop/bin/hadoop fs -D fs.s3a.endpoint=http://localhost:9000 -ls s3a://vagrant-bucket/

# Spark
/opt/spark/bin/pyspark --conf spark.hadoop.fs.s3a.endpoint=http://localhost:9000
# spark.read.csv("s3a://vagrant-bucket/addresses.csv", inferSchema=True, header=False)
