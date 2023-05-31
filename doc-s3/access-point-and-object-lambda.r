
************
Access Point
************
    - Amazon S3 access points simplify data access for any AWS service or customer application that stores data 
      in S3. 
    - Access points are named network endpoints that are attached to buckets that you can use to perform S3 
      object operations, such as GetObject and PutObject. 
    - Each access point enforces a customized access point policy that works in conjunction with the bucket policy. 
    - You can only use access points to perform operations on objects.
*************
Object Lambda
*************
    - You can add your own code to S3 GET, HEAD, and LIST requests to modify and process data as it is returned 
      to an application. 
    - You can use custom code to modify the data returned by S3 GET requests to filter rows, dynamically resize 
      images, redact confidential data.