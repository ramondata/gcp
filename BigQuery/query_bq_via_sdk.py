from google.cloud import bigquery


def conn_big_query(project_name):
        bq_client = bigquery.Client(project=project_name);
        return


code = """ query """


def run_job(self):
        conn_big_query("your-project-name")
        query_job = bq_client.query(code)
        result = query_job.result()
        self.results = []

        for row in result:
            self.results.append(row)
