

**************
Pre-signed-url
**************
    - By default, all S3 objects are private.
    -  Only the object owner has permission to access them. 
    - However, the object owner can optionally share objects with others by creating a presigned URL, using their 
      own security credentials, to grant time-limited permission to download the objects.
    - When you create a presigned URL for your object, you must provide your security credentials and then specify 
      a bucket name, an object key, an HTTP method (GET to download the object), and an expiration date and time. 
    - The presigned URLs are valid only for the specified duration. 
    - If you created a presigned URL using a temporary token, then the URL expires when the token expires, even if 
      the URL was created with a later expiration time.
    - Default time is 3600 secods or 1 hour