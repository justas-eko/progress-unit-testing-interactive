block-level on error undo, throw.

{src/ttCustomerInfo.i}

function canShipToCountry return logical (pcCountry as character) forward.
function getOrderCount return integer (piCustNum as integer) forward.

message "Start report".

run collectCustomerInfo(output table ttCustomerInfo).
run printReport("myReport.csv", table ttCustomerInfo).

message "Printing report into 'myReport.csv'".

message "Finish report".

procedure collectCustomerInfo:
    define output parameter table for ttCustomerInfo.

    message "Start collecting customer info".

    empty temp-table ttCustomerInfo.

    for each Customer no-lock:
        create ttCustomerInfo.
        ttCustomerInfo.name                 = Customer.name.
        ttCustomerInfo.custNum              = Customer.custNum.
        ttCustomerInfo.orderCount           = getOrderCount(Customer.custNum).
        ttCustomerInfo.country              = Customer.country.
        ttCustomerInfo.canShipToCountry     = canShipToCountry(Customer.Country).
    end.

    message "Finish collecting customer info".
end procedure.

procedure printReport:
    define input parameter pcReportName as character no-undo.
    define input parameter table for ttCustomerInfo.

    output to value(pcReportName).
    export delimiter ";" "Customer name" "Customer number" "Order count" "Country" "Can ShipTo to country".

    for each ttCustomerInfo:
        export delimiter ";" ttCustomerInfo.
    end.
    output close.

    message "Printing done".
end procedure.

function canShipToCountry return logical (pcCountry as character):
    define variable cAllowedCountryList as character no-undo init "USA,ITALIA".

    return lookup(pcCountry, cAllowedCountryList) = 0.
end function.

function getOrderCount return integer (piCustNum as integer):
    define variable iOrderCount as integer no-undo.

    for each Order no-lock where
             Order.CustNum = piCustNum:
        iOrderCount = iOrderCount + 1.
    end.

    return iOrderCount.
end function.
