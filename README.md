# hw_week2

- 訂便當系統
- 建資料庫

# o0o
##### user
> - uNo (int)
> - uId (int)
> - userName (varchar(20))
> - password(varchar(20))
> - nickName  (varchar(10))
> - phone (varchar(11))
> - joinDate (date)
> - status (int)

##### userStatus
> - usId (int)
> - usDesc (varchar(30))

##### restuarants
> - rId (int)
> - rName (varchar(20))
> - tel (varchar(11))
> - address (varchar(30))
> - openTime (time)
> - closeTime (time)
> - rCategory (int)
> - rDesc (varchar(50))
> - orderCondition (varchar(50))

##### restuarantCategory
> - rcId (int)
> - rcName (varchar(10))

##### products
> - pId (int)
> - rId (int)
> - pName (varchar(20))
> - pCategory (int)
> - unitPrice (int)

##### orders
> - oId (int)
> - startTime (time)
> - closeTime (time)
> - destination ()
> - adminId
> - freight

##### orderdetails
> - odId
> - oId
> - uId
> - productId
> - amount
> - Desc
> - PayYet
> - totalPrice
