
***************
General purpose
***************
    ********************************
    Amazon S3 Standard (S3 Standard)
    ********************************
        - S3 Standard offers high durability, availability, and performance object storage for frequently accessed 
          data. 
        - Because it delivers low latency and high throughput, S3 Standard is appropriate for a wide variety of use 
          cases, including cloud applications, dynamic websites, content distribution, mobile and gaming applications,
          and big data analytics. 
        - S3 Storage Classes can be configured at the object level and a single bucket can contain objects stored 
          across S3 Standard, S3 Intelligent-Tiering, S3 Standard-IA, and S3 One Zone-IA. 
        - You can also use S3 Lifecycle policies to automatically transition objects between storage classes without 
          any application changes.
        - Supports SSL for data in transit and encryption of data at rest
*****************
Infrequent access
*****************
    *****************************************************
    Amazon S3 Standard-Infrequent Access (S3 Standard-IA)
    *****************************************************
        - S3 Standard-IA is for data that is accessed less frequently, but requires rapid access when needed. S3 
          Standard-IA offers the high durability, high throughput, and low latency of S3 Standard.
        - This combination of low cost and high performance makes S3 Standard-IA ideal for long-term storage backups, 
          and as a data store for disaster recovery files. 
        - Supports SSL for data in transit and encryption of data at rest
        - High availability
    *****************************************************
    Amazon S3 One Zone-Infrequent Access (S3 One Zone-IA)
    *****************************************************
        - S3 One Zone-IA is for data that is accessed less frequently, but requires rapid access when needed. 
        - S3 One Zone-IA stores data in a single AZ and costs 20% less than S3 Standard-IA. 
        - S3 One Zone-IA is ideal for customers who want a lower-cost option for infrequently accessed data but 
          do not require the availability and resilience of S3 Standard or S3 
        - Backed with the Amazon S3 Service Level Agreement for availability
        - Supports SSL for data in transit and encryption of data at rest
        - S3 Lifecycle management for automatic migration of objects to other S3 Storage Classes
*******
Archive
*******
    The Amazon S3 Glacier storage classes are purpose-built for data archiving. To move objects from Glacia back 
    to Standard tier, we have to restore them or copy them before we can move them. 
        ***********************************  
        Amazon S3 Glacier Instant Retrieval
        ***********************************
            - Delivers the lowest-cost storage for long-lived data that is rarely accessed and requires retrieval 
              in milliseconds. 
            - When your data is accessed once per quarter. S3 Glacier Instant Retrieval delivers the fastest access 
              to archive storage.
            - S3 Glacier Instant Retrieval is ideal for archive data that needs immediate access, such as medical 
              images, news media assets, or user-generated content archives. 
            - You can upload objects directly to S3 Glacier Instant Retrieval, or use S3 Lifecycle policies to transfer 
              data from the S3 storage classes. S3 PUT API for direct uploads to S3 Glacier Instant Retrieval, and S3 
              Lifecycle management
            - 90 days minimum storage duration
        **********************************************************
        Amazon S3 Glacier Flexible Retrieval (Formerly S3 Glacier)
        **********************************************************
            - Delivers low-cost storage, up to 10% lower cost (than S3 Glacier Instant Retrieval).
            - For archive data that is accessed 1—2 times per year and is retrieved asynchronously. 
            - For archive data that does not require immediate access but needs the flexibility to retrieve large 
              sets of data at no cost, such as backup or disaster recovery use cases.
            - Configurable retrieval times, from minutes to hours, with free bulk retrievals
            - S3 PUT API for direct uploads to S3 Glacier Flexible Retrieval, and S3 Lifecycle management 
            - 90 days minimum storage duration
            - Expedited (1-5 mins), Standard (3-5 hours) and Bulk (5-12 hours)
        ******************************
        Amazon S3 Glacier Deep Archive
        ******************************
            - S3s lowest-cost storage class and supports long-term retention and digital preservation for data that 
              may be accessed once or twice in a year. 
            - Designed for customers—particularly those in highly-regulated industries, such as financial services, 
              healthcare, and public sectors—that retain data sets for 7—10 years or longer to meet regulatory 
              compliance requirements. 
            - Used for backup and disaster recovery use cases.
            - All objects stored in S3 Glacier Deep Archive are replicated and stored across at least three 
              geographically-dispersed Availability Zones, protected by 99.999999999% of durability, and can be 
              restored within 12 hours.
            - S3 PUT API for direct uploads to S3 Glacier Deep Archive, and S3 Lifecycle management for automatic 
              migration of objects
            - 180 days minimum storage duration
            - Standard (12 hours) and Bulk (48 hours)
**************************
Unknown or changing access
**************************
    ******************************************************
    Amazon S3 Intelligent-Tiering (S3 Intelligent-Tiering)
    ******************************************************
        - This is the first cloud storage that automatically reduces your storage costs on a granular object level 
          by automatically moving data to the most cost-effective access tier based on access frequency.
        - Automatically stores objects in three access tiers: one tier that is optimized for frequent access, a 40% 
          lower-cost tier that is optimized for infrequent access, and a 68% lower-cost tier optimized for rarely 
          accessed data. 
        - Moves objects that have not been accessed for 30 consecutive days to the Infrequent Access tier and after 
          90 days of no access to the Archive Instant Access tier. 
        - For data that does not require immediate retrieval, you can set up S3 Intelligent-Tiering to monitor and 
          automatically move objects that arent accessed for 180 days or more to the Deep Archive Access tier to 
          realize up to 95% in storage cost savings. 
        - There are no retrieval charges in S3 Intelligent-Tiering.