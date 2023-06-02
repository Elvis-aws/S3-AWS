import base64
import boto3
import hashlib
import os

bucket_name = os.environ['BUCKET_NAME']
object_key = os.environ['OBJECT_KEY']
secret_arn = os.environ['SECRET_ARN']

secretmanager_client = boto3.client('secretsmanager')
s3_client = boto3.client('s3')

object_body = 'awstut!'
char_code = 'utf-8'
content_type = 'text/plain'


def lambda_handler1(event, context):
    response = secretmanager_client.get_secret_value(
        SecretId=secret_arn
    )
    key = response['SecretString']
    key_base64 = base64.b64encode(key.encode()).decode()

    key_hash = hashlib.md5(key.encode()).digest()
    key_hash_base64 = base64.b64encode(key_hash).decode()

    response = s3_client.put_object(
        Bucket=bucket_name,
        Key=object_key,
        Body=object_body.encode(char_code),
        ContentEncoding=char_code,
        ContentType=content_type,
        SSECustomerAlgorithm='AES256',
        SSECustomerKey=key_base64,
        SSECustomerKeyMD5=key_hash_base64
    )
    return response


# After creating a client object for Secrets Manager, access the secret and obtain the key for encryption.
# Calculate the Base64-encoded value of the key and the MD5-calculated hash value of the key, both encoded in Base64.
# After creating the client object for S3, execute the put_object method.
# The point is the argument of the put_object method.
# When encrypting an object in SSE-C, three request headers must be used.


# x-amz-server-side-encryption-customer-algorithm
# x-amz-server-side-encryption-customer-key
# x-amz-server-side-encryption-customer-key-MD5


def lambda_handler2(event, context):
    response = secretmanager_client.get_secret_value(
        SecretId=secret_arn
    )
    key = response['SecretString']
    key_base64 = base64.b64encode(key.encode()).decode()

    key_hash = hashlib.md5(key.encode()).digest()
    key_hash_base64 = base64.b64encode(key_hash).decode()

    response = s3_client.get_object(
        Bucket=bucket_name,
        Key=object_key,
        SSECustomerAlgorithm='AES256',
        SSECustomerKey=key_base64,
        SSECustomerKeyMD5=key_hash_base64
    )
    body = response['Body'].read()
    return body.decode(char_code)

# Execute the get_object method of the client object for S3 to download the uploaded object.
# Three parameters for SSE-C are specified here as well.
