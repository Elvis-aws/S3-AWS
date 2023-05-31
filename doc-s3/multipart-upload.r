
*****************
Multi-Part upload
*****************
    - Multipart upload allows you to upload a single object as a set of parts. Each part is a contiguous portion 
      of the objects data. 
    - You can upload these object parts independently and in any order. If transmission of any part fails, you can 
      retransmit that part without affecting other parts. After all parts of your object are uploaded, Amazon S3 
      assembles these parts and creates the object. 
    - In general, when your object size reaches 100 MB, you should consider using multipart uploads instead of 
      uploading the object in a single
    ****************
    unfinished parts
    ****************
        - We recommend you configure a lifecycle rule using the AbortIncompleteMultipartUpload action to minimize 
          your storage costs. 
        - Amazon S3 supports a bucket lifecycle rule that you can use to direct Amazon S3 to stop multipart uploads 
          that dont complete within a specified number of days after being initiated. 
        - When a multipart upload is not completed within the time frame, it becomes eligible for an abort operation 
          and Amazon S3 stops the multipart upload (and deletes the parts associated with the multipart upload).
    ***************************
    Aborting a multipart upload
    ***************************
        - After you initiate a multipart upload, you begin uploading parts. Amazon S3 stores these parts, but it 
          creates the object from the parts only after you upload all of them and send a successful request to 
          complete the multipart upload. 
        - Upon receiving the complete multipart upload request, Amazon S3 assembles the parts and creates an object. 
          If you dont send the complete multipart upload request successfully, Amazon S3 does not assemble the parts 
          and does not create any object.