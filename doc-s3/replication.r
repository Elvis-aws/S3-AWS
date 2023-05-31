

**************
S3 Replication
**************
    - Versioning must be enabled in source and destination buckets 
    - Replication enables automatic, asynchronous copying of objects across Amazon S3 buckets. 
    - Buckets that are configured for object replication can be owned by the same AWS account or by different 
      accounts.
    - You can replicate objects to a single destination bucket or to multiple destination buckets. 
    - The destination buckets can be in different AWS Regions or within the same Region as the source bucket.
    - To automatically replicate new objects as they are written to the bucket use live replication, such as 
      Same-Region Replication (SRR e.g for logging) or Cross-Region Replication (CRR e.g for low latency). 
    - To replicate existing objects to a different bucket on demand, use S3 Batch Replication.
    - To replicate delete marker, delete marker replication must be enabled
    - IAM permission must be given 