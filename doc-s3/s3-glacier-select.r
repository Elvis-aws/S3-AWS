

*********************
S3 Select and Glacier
*********************
    *********
    S3 Select
    *********
        - Enables applications to retrieve only a subset of data from an object by using simple SQL expressions. 
        - By using S3 Select to retrieve only the data needed by your application, you can achieve drastic performance 
          increases

    import boto3
    s3 = boto3.client('s3')

    r = s3.select_object_content(
                Bucket='jbarr-us-west-2',
                Key='sample-data/airportCodes.csv',
                ExpressionType='SQL',
                Expression="select * from s3object s where s.\"Country (Name)\" like '%United States%'",
                InputSerialization = {'CSV': {"FileHeaderInfo": "Use"}},
                OutputSerialization = {'CSV': {}},
        )

    for event in r['Payload']:
            if 'Records' in event:
                records = event['Records']['Payload'].decode('utf-8')
                print(records)
            elif 'Stats' in event:
                statsDetails = event['Stats']['Details']
                print("Stats details bytesScanned: ")
                print(statsDetails['BytesScanned'])
                print("Stats details bytesProcessed: ")
                print(statsDetails['BytesProcessed'])
    **************
    Glacier Select
    **************
        - Glacier Select allows you to to perform filtering directly against a Glacier object using standard SQL 
          statements. Glacier Select works just like any other retrieval job except it has an additional set of 
          parameters you can pass in initiate job request.

    import boto3
    glacier = boto3.client("glacier")

    jobParameters = {
        "Type": "select", "ArchiveId": "ID",
        "Tier": "Expedited",
        "SelectParameters": {
            "InputSerialization": {"csv": {}},
            "ExpressionType": "SQL",
            "Expression": "SELECT * FROM archive WHERE _5='498960'",
            "OutputSerialization": {
                "csv": {}
            }
        },
        "OutputLocation": {
            "S3": {"BucketName": "glacier-select-output", "Prefix": "1"}
        }
    }

    glacier.initiate_job(vaultName="reInventSecrets", jobParameters=jobParameters)

        