let
    Source = OData.Feed("https://[INSERT BASE SITE].sharepoint.com/sites/[INSERT DIRECTORY]/_api/[INSERT DIRECTORY]", null, [Implementation="2.0"]),
    All_Lists_table = Source{[Name="Projects",Signature="table"]}[Data],
    #"Removed Other Columns" = Table.SelectColumns(All_Lists_table,{ "ProjectName"}),
    #"Filtered Rows" = Table.SelectRows(#"Removed Other Columns", each ([ProjectType] = 0) ),
    #"Invoked Custom Function" = Table.AddColumn(#"Filtered Rows", "GetData", each GetData([WorkspaceInternalUrl]))
in
    #"Invoked Custom Function"