# powerbi-dynamic-urls-sharepoint-list-data
PowerBI - Ingest from multiple SharePoints using Dynamic URLs - PowerQueryM 


Welcome to the PowerBI Import Data from Dynamic URLs wiki!

* Imagine if you had to import SharePoint list data from multiple SharePoint lists from a single SharePoint site. 
* The SharePoint List structure is the same across the site and you need a query to cycle through all the lists to pull out all the data for reporting. 
* This can be done manually by connecting to each SharePoint list, however you want to make it dynamic so that any new list that gets added or removed will add or remove the data in the table accordingly.
* Furthermore you want this to be able to be refreshed in PowerBI / Fabric workspace.

Uploaded are two files which can help accomplish this for you. NOTE THAT THE UPLOADED FILE IS JUST AN EXAMPLE. YOU WILL NEED TO ADAPT THE CODE FOR YOUR OWN USE CASES AND REQUIREMENTS.

**ImportSharePointLists**
This initial query imports SharePoint lists within your site into a table, then invokes a custom function to cycle through all the lists. This normally would not work in the PowerBI / Fabric Online Workspace  unless you construct the PowerQuery M using  Web.Contents().

The issue arises because, during a dataset refresh, Power BI performs a static analysis of the code to identify the dataset's data sources and verify the provided credentials. Unfortunately, this analysis sometimes fails, such as when the definition of a data source depends on parameters from a custom M function. As a result, the dataset fails to refresh.

In cases like this where the data source involves a call to Web.Contents(), Power BI's static analysis only checks the base URL provided in the first parameter.

**URLFunction**
This custom function will construct the URL to retrieve the list data using Web.Contents().

You will then be able to expand out the column to retrieve the specific list data.


Taking inspiration from Chris at CrossJoin below:

https://blog.crossjoin.co.uk/2016/08/16/using-the-relativepath-and-query-options-with-web-contents-in-power-query-and-power-bi-m-code/

https://blog.crossjoin.co.uk/2016/08/23/web-contents-m-functions-and-dataset-refresh-errors-in-power-bi/


