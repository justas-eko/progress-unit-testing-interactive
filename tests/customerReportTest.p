block-level on error undo, throw.

using OpenEdge.Core.Assert.

{src/ttCustomerInfo.i}

define variable hProcHandle as handle no-undo.

function canShipToCountry return logical (pcCountry as character) in hProcHandle.
function getOrderCount return integer (piCustNum as integer) in hProcHandle.

@Setup.
procedure setup:
    run src/customerReport.p persistent set hProcHandle.
end procedure.

@TearDown.
procedure tearDown:
    if valid-handle(hProcHandle) then delete object hProcHandle.
end procedure.

@Test.
procedure testCollectCustomerInfoIsCollected:
    empty temp-table ttCustomerInfo.

    run collectCustomerInfo in hProcHandle (output table ttCustomerInfo).

    Assert:IsTrue(can-find(first ttCustomerInfo)).
end procedure.

@Test.
procedure testPrintReportIsCreated:
    define variable cReportName as character no-undo init "myReportTest.csv".

    empty temp-table ttCustomerInfo.

    run printReport in hProcHandle (cReportName, table ttCustomerInfo).

    file-info:file-name = cReportName.
    Assert:IsTrue(file-info:full-pathname <> ?).
end procedure.

@Test.
procedure testCanShipToCountryPositive:
    Assert:IsTrue(canShipToCountry("LATVIA")).
end.

@Test.
procedure testCanShipToCountryNegative:
    Assert:IsFalse(canShipToCountry("USA")).
end.

@Test.
procedure testGetOrderCountExistant:
    Assert:Equals(1, getOrderCount(1)).
end procedure.
