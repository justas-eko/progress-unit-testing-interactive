define temp-table ttCustomerInfo
    field name as character
    field custNum as integer
    field orderCount as integer
    field country as character
    field canShipToCountry as logical
    index custNum custNum
    .