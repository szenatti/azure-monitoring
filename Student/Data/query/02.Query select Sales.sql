select *

from SalesLT.SalesOrderHeader

INNER JOIN SalesLT.SalesOrderDetail
    on SalesLT.SalesOrderDetail.SalesOrderID = SalesLT.SalesOrderHeader.SalesOrderID

INNER JOIN SalesLT.Customer
    on SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID

INNER JOIN SalesLT.Product
    on SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID
