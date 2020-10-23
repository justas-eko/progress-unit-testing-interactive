block-level on error undo, throw.

define variable iOrderCount as integer no-undo.

message "Printing report into 'myReport.csv'".

output to value("myReport1.csv").
export delimiter ";" "Customer name" "Customer number" "Order count" "Country" "Can ShipTo to country".

for each Customer no-lock:
    iOrderCount = 0.

    for each Order no-lock where
             Order.CustNum = Customer.CustNum:
        iOrderCount = iOrderCount + 1.
    end.

    export delimiter ";" Customer.name Customer.CustNum iOrderCount Customer.Country lookup(Customer.country, "USA,ITALIA") = 0.
end.
output close.

message "Printing done".
