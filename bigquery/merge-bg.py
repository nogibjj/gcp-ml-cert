# @title Setup
from google.colab import auth
from google.cloud import bigquery
from google.colab import data_table

project = 'platinum-lead-379722' # Project ID inserted based on the query results selected to explore
location = 'US' # Location inserted based on the query results selected to explore
client = bigquery.Client(project=project, location=location)
data_table.enable_dataframe_formatter()
auth.authenticate_user()

job = client.get_job('bquxjob_3f8ffc04_18795d1ee67') # Job ID inserted based on the query results selected to explore
print(job.query)

results = job.to_dataframe()

# group by title and sum the views
results = results.groupby("title").sum().reset_index()

# sort by views in descending order
results = results.sort_values(by="views", ascending=False)

# print the result
print(results.head(10))

#now visualize
import seaborn as sns
import matplotlib.pyplot as plt

# Visualize
# select top 25 pages by views
top25 = results.head(25)

# create a bar plot using seaborn
sns.set(style="whitegrid")
plt.figure(figsize=(12, 8))
ax = sns.barplot(x="views", y="title", data=top25)
ax.set_title("Top 25 Most Viewed Wikipedia Pages on 2023-04-18")
ax.set_xlabel("Number of Views")
ax.set_ylabel("Title")
plt.show()