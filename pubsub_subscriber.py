from google.cloud import pubsub_v1


def conn_pub_sub(self):
        self.subscriber = pubsub_v1.SubscriberClient()
  

def message_received_file_name(self):
        project_id = "cerc2-gestop-stg"
        subscription_id = "file-name-conc-received-sub"

        self.conn_pub_sub()

        subscription_path = self.subscriber.subscription_path(project_id, subscription_id)

        response = self.subscriber.pull(
               request={"subscription": subscription_path, "max_messages": 2})
        self.zip_var = [msg.message.data for msg in response.received_messages]
        
        count = len(self.zip_var)
        print("count pub sub message ", count)
        
        if count == 0:
            return "pull does not work"
        else:
            self.zip_var = self.zip_var[-1].decode('utf-8')
            print("zip_var ", self.zip_var)

        def callback(message):
            print(f"Received message: {message.data}")
            global data
            data = message.data
            message.ack()

        data = None
        self.subscriber.subscribe(subscription_path, callback=callback)
        
        if data == None:
            pass
        else:
            self.zip_var = data
            
        print("new_self_zip_var", self.zip_var)
