

*********************
S3 Event Notification
*********************
    - Receive notifications when certain events happen in your S3 bucket. To enable notifications, add a notification 
      configuration that identifies the events that you want Amazon S3 to publish. 
    - Make sure that it also identifies the destinations where you want Amazon S3 to send the notifications. 
    ****************************
    Supported event destinations
    ****************************
       *****************
        Amazon SNS topic
        *****************
            - use this service to push messages to mobile devices or distributed services. 
            - With SNS, you can publish a message once, and deliver it one or more times. 
            - You can use the Amazon SNS console to create an Amazon SNS topic that your notifications can be sent to.
              The topic must be in the same AWS Region as your Amazon S3 bucket
        ****************
        Amazon SQS queue
        **************** 
            - Use Amazon SQS to transmit any volume of data without requiring other services to be always available. 
            - Use the Amazon SQS console to create an Amazon SQS queue that your notifications can be sent to.
            - The Amazon SQS queue must be in the same AWS Region as your Amazon S3 bucket.
        ***************
        Lambda function
        ***************
            - Use AWS Lambda to extend other AWS services with custom logic, or create your own backend that 
              operates at AWS scale, performance, and security. 
            - With Lambda, you can create discrete, event-driven applications that run only when needed. You can also 
              use it to scale these applications automatically from a few requests a day to thousands a second.
        ******************
        Amazon EventBridge
        ******************
            - Set up rules to match events and deliver them to targets, such as an AWS service or an HTTP endpoint. 
            - Unlike other destinations, you can either enable or disable events to be delivered to EventBridge for 
              a bucket. 
            - If you enable delivery, all events are sent to EventBridge. Moreover, you can use EventBridge 
              rules to route events to additional targets.