# Amazon S3 with S3 Object Lambda - Returns image thumbnail from S3

The SAM template deploys a Lambda function, an S3 bucket, an S3 Access Point, and an S3 Object Lambda Access Point. 
This application uses S3 Object Lambda to return a thumbnail version of an image in S3.

## Deployment Instructions

1. Change directory to the pattern directory:
    ```
    cd s3-object-lambda
    ```
2. From the command line, use AWS SAM to build and deploy the AWS resources for the pattern as specified in the 
   template.yml file:
    ```
    sam build
    sam deploy --guided
    ```
3. During the prompts:
    * Enter a stack name
    * Enter the desired AWS Region
    * Allow SAM CLI to create IAM roles with the required permissions.


## How it works

When a request is made to the S3 Object Lambda Access Point, the Lambda function is invoked. Within the Lambda function 
code, the getObjectContext property contains the following useful information:

1. inputS3Url: a [presigned URL](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ShareObjectPreSignedURL.html) 
   that the function can use to download the original object from the supporting Access Point. In this way, the Lambda 
   function does not need to have S3 read permissions to retrieve the original object and can only access the object 
   processed by each invocation.
2. outputRoute, outputToken: used to send back the modified object using the 
   [WriteGetObjectResponse](https://docs.aws.amazon.com/AmazonS3/latest/API/API_WriteGetObjectResponse.html) API.

The function uses the provided presigned URL to retrieve the requested image from S3 using 
[axios](https://www.npmjs.com/package/axios). The function resizes the image using 
[sharp](https://www.npmjs.com/package/sharp). Then the function returns a thumbnail version of the image 
back to S3 Object Lambda.

## Testing

Run the following S3 CLI command to upload two example images to the S3 bucket (example1.jpg, example2.jpg). 
Note, you must edit the {S3BucketName} placeholder with the name of the S3 Bucket. This is provided in the stack outputs.

```bash
aws s3 cp './images/' s3://{S3BucketName} --recursive
```

Run the following S3 CLI commands to download a thumbnail version of an example image. Note, you must edit the 
{S3ObjectLambdaAccessPoint} placeholder with the ARN of the S3 Object Lambda Access Point 
(eg: arn:aws:s3-object-lambda:us-east-2:111111111111:accesspoint/resize-olap). This is provided in the stack outputs.

```bash
aws s3api get-object --bucket '{S3ObjectLambdaAccessPoint}' --key example1.jpg './images/example1-thumbnail.jpg'
```

```bash
aws s3api get-object --bucket '{S3ObjectLambdaAccessPoint}' --key example2.jpg './images/example2-thumbnail.jpg'
```

NOTE: Upgrade to the latest AWS CLI version if you receive the following error when using the get-object command: 
`Parameter validation failed: Invalid bucket name: Bucket name must match the regex`



## Cleanup
 
1. From the AWS Management Console, empty the S3 bucket that contains the example images.
2. Delete the stack
    ```bash
    aws cloudformation delete-stack --stack-name STACK_NAME
    ```
3. Confirm the stack has been deleted
    ```bash
    aws cloudformation list-stacks --query "StackSummaries[?contains(StackName,'STACK_NAME')].StackStatus"
    ```
----
Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.

SPDX-License-Identifier: MIT-0
