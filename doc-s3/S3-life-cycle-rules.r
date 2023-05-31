
************
S3 Lifecycle
************
    - To manage your objects so that they are stored cost effectively throughout their lifecycle, configure their 
      Amazon S3 Lifecycle. 
    - An S3 Lifecycle configuration is a set of rules that define actions that Amazon S3 applies to a group of 
      objects. There are two types of actions:
        ******************
        Transition actions
        ******************
            These actions define when objects transition to another storage class. For example, 
            you might choose to transition objects to the S3 Standard-IA storage class 30 days after creating them, 
            or archive objects to the S3 Glacier Flexible Retrieval storage class one year after creating them. 
            There are costs associated with lifecycle transition requests.
        ******************
        Expiration actions
        ******************
            These actions define when objects expire. Amazon S3 deletes expired objects on your behalf.
            Lifecycle expiration costs depend on when you choose to expire objects.