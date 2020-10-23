block-level on error undo, throw.

{src/ttCustomerInfo.i}

define variable iOrderCount as integer no-undo.
define variable lCanShipToCountry as logical no-undo.

message "Start report".

message "Start collecting customer info".

empty temp-table ttCustomerInfo.

for each Customer no-lock:
    iOrderCount = 0.

    for each Order no-lock where
             Order.CustNum = Customer.CustNum:
        iOrderCount = iOrderCount + 1.
    end.

    create ttCustomerInfo.
    ttCustomerInfo.name                 = Customer.name.
    ttCustomerInfo.custNum              = Customer.custNum.
    ttCustomerInfo.orderCount           = iOrderCount.
    ttCustomerInfo.country              = Customer.country.
    ttCustomerInfo.canShipToCountry     = lookup(Customer.country, "USA,ITALIA") = 0.
end.

message "Finish collecting customer info".

message "Printing report into 'myReport.csv'".

output to value("myReport2.csv").
export delimiter ";" "Customer name" "Customer number" "Order count" "Country" "Can ShipTo to country".

for each ttCustomerInfo:
    export delimiter ";" ttCustomerInfo.
end.
output close.

message "Printing done".
message "Finish report".
