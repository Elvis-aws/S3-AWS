

- Navigate to folder s3-encryption
- Upload a test file from the AWS CLI

# Testing Bucket 1 (SSE-S3)
# Upload
  touch test1.txt
  aws s3 cp ./test1.txt s3://encryption-app-sse-ae256-bucket
  aws s3 ls s3://encryption-app-sse-ae256-bucket
# Thus, no special operation is required when uploading objects to a bucket with SSE-S3 enabled.
# Download
  aws s3 cp s3://encryption-app-sse-ae256-bucket/test1.txt ./Download/test1-download.txt
# Thus, no special operations are required when downloading objects from a bucket with SSE-S3 enabled.

# Testing Bucket 2 (SSE-KMS: AWS Managed Key)
# Upload
  touch test2.txt
  aws s3 cp ./test2.txt s3://encryption-app-sse-kms-bucket
  aws s3 ls s3://encryption-app-sse-kms-bucket
# Thus, no special operations are required to upload an object to a bucket with SSE-KMS enabled using AWS Managed Keys
# Download
  aws s3 cp s3://encryption-app-sse-kms-bucket/test2.txt ./Download/test2-download.txt
# Thus, no special operations are required to download an object from an SSE-S3 enabled bucket using an AWS managed key

# Testing Bucket 3 (SSE-KMS: CMK)
# Thus, no special operation is required to upload an object to a bucket with SSE-KMS enabled using CMK.
# Thus, no special operations are required to download objects from a CMK-enabled SSE-S3 bucket.

# Testing Bucket 4 (SSE-C) Using server-side encryption with customer-provided keys (SSE-C)
- Obtains a string corresponding to a customer key stored in Secrets Manager.
  key=$(aws secretsmanager get-secret-value --secret-id fa-125 | jq -r .SecretString)
  echo $key
- Get the Base64-encoded value of the customer key.
  key_encoded=$(echo -n $key | base64)      
  key_encoded
- Similarly, the MD5 hash value of the customer key is also obtained, encoded in Base64.
  hash=$(echo -n $key | openssl md5 -binary | base64)
  echo $hash
- First, try uploading a test file without specifying a customer key or other information
# First, try uploading a test file without specifying a customer key or other information
  touch test4-1-1.txt
  aws s3api put-object --bucket encryption-app-sse-c-bucket --key test4-1-1.txt --body ./test4-1-1.txt
# An error occurred (AccessDenied) when calling the PutObject operation: Access Denied
# Upload the test file while specifying the customer key and hash value again.
   aws s3api put-object \
  --bucket encryption-app-sse-c-bucket \
  --key test4-1-1.txt \
  --body ./test4-1-1.txt \
  --sse-customer-algorithm AES256 \
  --sse-customer-key $key_encoded \
  --sse-customer-key-md5 $hash
# Download your file
  aws s3api get-object test4-1-1-download.txt \
  --bucket encryption-app-sse-c-bucket \
  --key test4-1-1.txt \
  --sse-customer-algorithm AES256 \
  --sse-customer-key $key_encoded \
  --sse-customer-key-md5 $hash
# Show file
  aws s3 ls s3://encryption-app-sse-c-bucket
# Delete file
  aws s3 rm s3://encryption-app-sse-c-bucket --recursive

# Deploy template and test PUT and GET functions
PUT
 {
    "message": "I love lambda"
 }
GET
You will get the message

- Delete folder
aws s3 rm s3://encryption-app-sse-ae256-bucket/folder-to-delete --recursive
- Delete file 
aws s3 rm s3://encryption-app-sse-ae256-bucket --recursive
aws s3 rm s3://encryption-app-sse-ae256-bucket --recursive --exclude "*.jpg"