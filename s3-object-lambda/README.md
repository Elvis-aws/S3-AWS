

# Testing #
- Copy csv file to S3
  aws s3 cp data/weather.csv s3://${BUCKET_NAME}/
# Then, use the AWS SDK (here, we use boto3) to test retrieval of Parquet and CSV data. The following three invocations 
# of get_object will all provide the same data but one request, for weather.parquet, refers to a missing key that will 
# be generated and return on the fly!

from io import BytesIO
import boto3
import pandas as pd

# Read CSV directly using the bucket
pd.read_csv(s3_client.get_object(
    Bucket=os.environ['BUCKET_NAME'],
    Key='weather.csv'
)['Body'])

# Read CSV using the Lambda Access Point
pd.read_csv(s3_client.get_object(
    Bucket=os.environ['LAP_ARN'],
    Key='weather.csv'
)['Body'])

# Read *Parquet* using the Lambda Access Point - dynamically generated!
pd.read_parquet(BytesIO(s3_client.get_object(
    Bucket=os.environ['LAP_ARN'],
    Key='weather.parquet'
)['Body'].read()))