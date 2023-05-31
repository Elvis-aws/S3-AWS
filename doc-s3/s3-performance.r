
***********
Performance
***********
    ***********************
    S3 Baseline Performance
    ***********************
        - Your applications can easily achieve thousands of transactions per second in request performance when 
          uploading and retrieving storage from Amazon S3. 
        - Amazon S3 automatically scales to high request rates. For example, your application can achieve at 
          least 3,500 PUT/COPY/POST/DELETE or 5,500 GET/HEAD requests per second per partitioned prefix. 
        - There are no limits to the number of prefixes in a bucket. You can increase your read or write 
          performance by using parallelization. For example, if you create 10 prefixes in an Amazon S3 bucket to 
          parallelize reads, you could scale your read performance to 55,000 read requests per second. 
        - Similarly, you can scale write operations by writing to multiple prefixes.
    *****************
    S3 KMS Limitation
    *****************
        - If you use SSE-KMS, you may be impacted by the KMS limit
        - When ever you upload a file you call the GenerateDataKey KMS API
        - When ever you download a file, you call the Decrypt KMS API
        - All these two requests will reduce your S3 request quata
        - Use the Service Quata Console to increase request quata to avoid throttling
    *****************
    Multi-Part Upload
    *****************
        - Use this for files above 5GB
        - Files are uploaded in parrallel into S3
        - This files are then combined into the original file after upload
    ************************
    S3 Transfer Acceleration
    ************************
        - Increase transfer speed by transfering files to an AWS edge location, this will then forward the 
          data to the S3 bucket in the target region.
        - Compartible with multi-part upload
        - This uses the fast AWS private network