from google.cloud import bigquery


def conn_big_query(self, project_name):
        self.bq_client = bigquery.Client(project=project_name);
        return

self.code = """ query """


def run_job(self):
        self.conn_big_query("your-project-name")
        query_job = self.bq_client.query(self.code)
        result = query_job.result()
        self.results = []

        for row in result:
            self.results.append(row)
