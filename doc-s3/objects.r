
*******
Objects
******* 
    - All S3 objects have a Key
    - The Key is the object full path starting from the bucket name
    - The Key is made up of two things: The prefix and the object name
    - The object name is the name of the file
    - The prefix is any folder structure before the file
    - https://my-buckets-elvis/pay-slips/Payslip_20210917_month_6.pdf
    - Prefix: pay-slips, object name: Payslip_20210917_month_6.pdf
    - https://my-buckets-elvis.s3.eu-west-2.amazonaws.com/Payslip_20210917_month_6.pdf
    - s3://my-buckets-elvis/Payslip_20210917_month_6.pdf
    - 5TB/5000GB is object size limit
    - You can not upload more than 5GB at a time, you need to use multi-part upload