
*************
S3 Encryption
*************
    - Data protection refers to protecting data while in-transit and at rest 
    - You can protect data in transit using (SSL/TLS) or client-side encryption. 
    - During encryption, the bucket policy takes president before the default bucket policy
        **********************
        Server-Side Encryption
        **********************
                Request Amazon S3 to encrypt your object before saving it on disks in its data 
            centers and then decrypt it when you download the objects.
                SSE-S3: Encryption where by keys are handled and managed by AWS. 
                    Keys are managed by S3 service
                    Object is encrypted server side
                    AES-256 Encryption type
                    Must set header "X-amz-serverside-encryption":"AES256"
                    Use HTTPS or HTTP

                SSE-KMS: This uses AWS Key Management Service
                    Advantages are user control and audit trail
                    Object is encrypted server side
                    Must set header "X-amz-serverside-encryption":"aws:kms"
                    Use HTTPS or HTTP

                SSE-C: The customer manages their own Keys
                    User provides their own Key in header
                    Encryption in transit is a must(HTTPS)
        **********************
        Client-Side Encryption
        **********************
                Encrypt data client-side and upload the encrypted data to Amazon S3. In this case, you manage the 
            encryption process, the encryption keys, and related tools. All data must be encrypted before sending 
            to S3. Customer manages encryption cycle. S3 encryption SDK can be used.
