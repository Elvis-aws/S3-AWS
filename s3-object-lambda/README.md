
#################
# How it works #
#################
# When a request is made to the S3 Object Lambda Access Point, the Lambda function is invoked. Within the Lambda function 
# code, the getObjectContext property contains the following useful information:
- inputS3Url: a presigned URL that the function can use to download the original object from the supporting Access Point. 
              In this way, the Lambda function does not need to have S3 read permissions to retrieve the original object 
              and can only access the object processed by each invocation.
- outputRoute, outputToken: used to send back the modified object using the WriteGetObjectResponse API.
# The function uses the provided presigned URL to retrieve the requested image from S3. In this example, we can get the
# csv file by using s3api directly on the bucket, using s3 object lambda and we can request a parquet format which does 
# not exist in the bucket and is created on the fly and returned to us.

# Testing #
- Copy csv file to S3
  aws s3 cp data/weather.csv s3://object-lambda-app-object-lambda-bucket
  aws s3 ls s3://object-lambda-app-object-lambda-bucket
# Then, use the AWS SDK (here, we use boto3) to test retrieval of Parquet and CSV data. The following three invocations 
# of get_object will all provide the same data but one request, for weather.parquet, refers to a missing key that will 
# be generated and return on the fly!

# Read CSV directly using the bucket
aws s3api get-object --bucket object-lambda-app-object-lambda-bucket --key weather.csv download/results.csv
# Read CSV using the Lambda Access Point
aws s3api get-object --bucket 'arn:aws:s3-object-lambda:eu-west-2:934433842270:accesspoint/object-lambda-app-lambda-access-point' --key weather.csv download/results.csv
# Read *Parquet* using the Lambda Access Point - dynamically generated!
aws s3 cp s3://object-lambda-app-object-lambda-bucket/weather.csv.parquet download/results.parquet




# Delete folder #
aws s3 rm s3://encryption-app-sse-ae256-bucket/folder-to-delete --recursive
- Delete file 
aws s3 rm s3://object-lambda-app-object-lambda-bucket --recursive
aws s3 rm s3://encryption-app-sse-ae256-bucket --recursive --exclude "*.jpg"
############################################################################