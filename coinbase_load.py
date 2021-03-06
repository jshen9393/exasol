#
# Use this API link https://api.coindesk.com/v1/bpi/historical/close.json?start=2013-09-01&end=2013-09-05
# Create a arg to pass in arguments to indicate if its a one time load or a daily load
# Create a function that writes in a 6 month load using dynamic days. use bulk load to load all the data
# Create a function thad loads the data on a daily level.
#

import requests
from datetime import date
from datetime import timedelta
import json

today = date.today()
six_months = today - timedelta(days=180)
url = f"https://api.coindesk.com/v1/bpi/historical/close.json?start={six_months}&end={today}"
r = requests.get(url)
results = json.loads(r.text)
print(results["bpi"])



