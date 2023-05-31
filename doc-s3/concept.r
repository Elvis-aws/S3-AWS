
**
S3
**
    - Backup and storage 
    - Disaster recovery 
    - Archive 
    - Hybrid Cloud storage 
    - Application hosting 
    - Media hosting 
    - Data lakes and big data analytics 
    - Software delivery 
    - Static website 
    ******
    Object
    ******
        - Objects or files have a key 
        - The key is the full path plus the bucket name 
        - There is no concept of directories 
        - Max object size is 5000GB 
        - You must use multi-part upload for file size > 5GB 
    *******
    Buckets
    *******
        - Files are stored in buckets 
        - Globally unique name 
        - Defined at regional level 
        - Buckets are created in regions 
        - Naming convention 
            - No uppercase 
            - No underscore 
            - Max 3-63 characters 
            - Must start with lowercase letter or number 
            - Must not start with the prefix xn-- 
            - Must not end with the suffix -s3alias 