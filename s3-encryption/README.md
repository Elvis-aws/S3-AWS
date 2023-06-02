

- Navigate to folder s3-encryption
- Upload a test file from the AWS CLI

# Testing Bucket 1 (SSE-S3)
# Upload
$ touch test1.txt
$ aws s3 cp ./test1.txt s3://encryption-app-sse-ae256-bucket
$ aws s3 ls s3://encryption-app-sse-ae256-bucket
# Thus, no special operation is required when uploading objects to a bucket with SSE-S3 enabled.
# Download
$ aws s3 cp s3://encryption-app-sse-ae256-bucket/test1.txt ./Download/test1-download.txt
# Thus, no special operations are required when downloading objects from a bucket with SSE-S3 enabled.

# Testing Bucket 2 (SSE-KMS: AWS Managed Key)
# Upload
$ touch test2.txt
$ aws s3 cp ./test2.txt s3://encryption-app-sse-kms-bucket
$ aws s3 ls s3://encryption-app-sse-kms-bucket
# Thus, no special operations are required to upload an object to a bucket with SSE-KMS enabled using AWS Managed Keys
# Download
$ aws s3 cp s3://encryption-app-sse-kms-bucket/test2.txt ./Download/test2-download.txt
# Thus, no special operations are required to download an object from an SSE-S3 enabled bucket using an AWS managed key

# Testing Bucket 3 (SSE-KMS: CMK)
# Thus, no special operation is required to upload an object to a bucket with SSE-KMS enabled using CMK.
# Thus, no special operations are required to download objects from a CMK-enabled SSE-S3 bucket.

# Testing Bucket 4 (SSE-C) Using server-side encryption with customer-provided keys (SSE-C) 

- Delete folder
aws s3 rm s3://encryption-app-sse-ae256-bucket/folder-to-delete --recursive
- Delete file 
aws s3 rm s3://encryption-app-sse-ae256-bucket --recursive
aws s3 rm s3://encryption-app-sse-ae256-bucket --recursive --exclude "*.jpg"