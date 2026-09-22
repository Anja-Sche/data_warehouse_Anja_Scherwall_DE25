import dlt
import requests
import json
from pathlib import Path
import os


def _get_parking(url_for_wednesdays):
    headers = {"accept": "application/json"}
    response = requests.get(url_for_wednesdays, headers=headers)
    response.raise_for_status()
    return json.loads(response.content.decode("utf8"))


@dlt.resource(write_disposition="replace")
def parking_resource(api_key: str = dlt.secrets.value):

    url = "https://openparking.stockholm.se/LTF-Tolken/v1/"
    url_for_wednesdays = f"{url}servicedagar/weekday/onsdag?outputFormat=json&apiKey={api_key}&maxFeatures=100"

    for street in _get_parking(url_for_wednesdays):
        yield street

def run_pipeline(table_name):
    pipeline = dlt.pipeline(
        pipeline_name="parking_wednesdays",
        destination="snowflake",
        dataset_name="staging"
    )


    load_info = pipeline.run(parking_resource(), table_name=table_name)
    print(load_info)


if __name__ == "__main__":
    working_directory = Path(__file__).parent
    os.chdir(working_directory)

    table_name = "parking_forbidden_wednesdays"

    run_pipeline(table_name)