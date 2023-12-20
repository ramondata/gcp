from google.cloud import pubsub_v1


def conn_pub_sub(self):
        self.subscriber = pubsub_v1.SubscriberClient()
  

def message_received_file_name(self):
        project_id = "cerc2-gestop-stg"
        subscription_id = "%s-%s" % (self.dir, self.tr)

        self.conn_pub_sub()

        subscription_path = self.subscriber.subscription_path(project_id, subscription_id)

        response = self.subscriber.pull(
               request={"subscription": subscription_path, "max_messages": 18})
        self.msg = [msg.message.data for msg in response.received_messages]

        count = len(self.msg)
        self.log.info("Total message pub/sub: %s" % count)
        
        if count == 0:
            self.log.error("Subscriber pull error")
            exit(1)        
        else:
            for item in self.msg:
                item = item.decode('utf-8')
                if self.tr.upper() in item:
                    self.zip_var = item
                else:
                    pass
            self.log.info("File received: %s" % self.zip_var)

        def callback(message):
            self.log.info("Received message: %s" % message.data)
            global data
            data = message.data
            message.ack()

        data = None
        self.subscriber.subscribe(subscription_path, callback=callback)

        if data == None:
            pass
        else:
            self.zip_var = data
            
        self.log.info("Double check file name: %s" % self.zip_var)
