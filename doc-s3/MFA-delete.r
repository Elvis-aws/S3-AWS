

**********
MFA delete
**********
    - When working with S3 Versioning in Amazon S3 buckets, you can optionally add another layer of security by 
      configuring a bucket to enable MFA (multi-factor authentication) delete. 
    - When you do this, the bucket owner must include two forms of authentication in any request to delete a 
      version or change the versioning state of the bucket.
    - MFA delete requires additional authentication for either of the following operations:
        Changing the versioning state of your bucket
        Permanently deleting an object version
    - You will need MFA delete to do the following
        Permanently delete an object version
        Suspend versioning on a bucket
    - Only the bucket owner can enable/disable MFA-Delete
    - To enable MFA delete, you can only use the CLI, its disabled on the UI