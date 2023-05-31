
**********
Versioning
**********
    - If versioning is enabled re-uploading a file adds a new version
    - All files will have a null version if versioning is enabled after the files were uploaded
    - Versioning helps in accidental deletes by creating a delete marker
    - Deleting the specified objects adds delete markers to them
    - If you need to undo the delete action, you can delete the delete markers.