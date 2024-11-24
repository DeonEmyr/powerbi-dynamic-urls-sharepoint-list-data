let GetData= (site as text) =>
let
    Source = OData.Feed(site&"/_api/web/lists/GetByTitle('[INSERT LISTS NAME]')/items", null, [Implementation="2.0"])
in
    Source
in GetData