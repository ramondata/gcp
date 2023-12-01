from google.cloud import storage


def conn_storage(self, bucket_name) -> None:
        self.storage_client = storage.Client();
        self.bucket = self.storage_client.bucket(bucket_name);
        return

#one or another

    def conn_get_storage(self, bucket_name) -> str:
        self.storage_client = storage.Client();
        self.bucket = self.storage_client.get_bucket(bucket_name);
        return "connected in %s" % bucket_name


def saving_file_compressed_within_bucket(self) -> None:
        self.conn_storage(self.bucket_name)
        blob = self.bucket.blob("%s%s%s" %(self.sub_dir_in_bucket, self.path_source_bucket, self.compressed_file_name))
        blob.upload_from_filename("/tmp/%s" % self.compressed_file_name)
