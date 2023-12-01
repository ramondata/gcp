from google.cloud import pubsub_v1


def conn_pub_sub(self) -> None:
        self.publisher = pubsub_v1.PublisherClient()
        return


def message_contains_file_name(self):
        project_id = "cerc2-gestop-stg"
        topic_name = "file-name-conc-received"
        message_data = self.zip_var

        self.conn_pub_sub()
        topic_path = self.publisher.topic_path(project_id, topic_name)

        message = message_data.encode("utf-8")

        future = self.publisher.publish(topic_path, data=message)
        print(f"Published message ID: {future.result()}")
