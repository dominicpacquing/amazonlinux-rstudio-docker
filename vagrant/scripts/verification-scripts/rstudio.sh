sudo useradd ppacquing
echo "vagrant" | sudo passwd --stdin ppacquing

# Sys.getenv(c("SPARK_HOME", "R_HOME", "R_PAPERSIZE"))
# library(sparklyr)
# sc <- spark_connect(master = "local")

spark-shell
import org.apache.spark.sql.SparkSession
val spark_new = SparkSession.builder.enableHiveSupport().getOrCreate