
*************
Amazon Athena
*************
    - Athena is an interactive query service that makes it easy to analyze data directly from Amazon S3 using 
      standard SQL. 
    - You dont even need to load your data into Athena, or have complex ETL processes.  
    - Athena works directly with data stored in S3.
    - Athena uses Presto, a distributed SQL engine to run queries. 
    - It also uses Apache Hive to create, drop, and alter tables and partitions. 
    - Athena uses an approach known as schema-on-read, which allows you to project your schema on to your data 
      at the time you execute a query. This eliminates the need for any data loading or ETL.