
********
Security
********
    - By default, all Amazon S3 resources—buckets, objects, and related subresources are private. 
    - Only the resource owner, the AWS account that created it, can access the resource (Using pre-signed URL)
    - The resource owner can optionally grant access permissions to others by writing an access policy (
      resource-based).
    - You can also attach access policies to users in your account. These are called user policies. 
    - You can also use access control lists (ACLs) to grant basic read and write permissions to other AWS 
      accounts.
    - When another AWS account uploads an object to your S3 bucket, that account (the object writer) owns the 
      object, has access to it, and can grant other users access to it through ACLs. 
    - You can use Object Ownership to change this default behavior so that ACLs are disabled.
    - You can use S3 Encryption
    - Make bucket public from bucket settings in console 
    Bucket policy 
        - We can use a bucket policy to grant cross account access
        - To force objects to be encrypted during upload 
        - Grant public access to bucket 
    
    