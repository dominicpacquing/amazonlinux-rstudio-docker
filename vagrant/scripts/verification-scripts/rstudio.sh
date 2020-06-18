sudo useradd ppacquing
echo "vagrant" | sudo passwd --stdin ppacquing

# Sys.getenv(c("SPARK_HOME", "R_HOME", "R_PAPERSIZE"))
# library(sparklyr)
# sc <- spark_connect(master = "local")