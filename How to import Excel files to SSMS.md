To run the SQL code you need to download:

https://www.microsoft.com/en-gb/sql-server/sql-server-downloads?rtc=1

https://www.microsoft.com/en-us/download/details.aspx?id=50402

From Microsoft SQL Server Management Studio - SSMS
Click Connect to connect your local server
![image](https://user-images.githubusercontent.com/48614949/231570597-4fdf3b66-9812-42f1-a965-e535902c1b1b.png)

Click right on your local database name - Tasks - Import Data ...
![image](https://user-images.githubusercontent.com/48614949/231572197-62965201-46c7-4411-ac8c-3d1465aefa69.png)

From Data Source - Excel

![image](https://user-images.githubusercontent.com/48614949/231572717-d90326ef-b6f2-4b00-968f-e368031daa97.png)

Choose Excel Version

![image](https://user-images.githubusercontent.com/48614949/231573372-dea3ba0e-3837-44bb-b566-fd80aa99882e.png)

If you get this error while uploading the Excel file to SSMS
**External table is not in the expected format. (Microsoft JET Database Engine)**

![image](https://user-images.githubusercontent.com/48614949/231574228-17a94acf-c522-40e6-8393-4f4b07873edd.png)

Way 1:

From your excel file, if it is under Excel 2016 or other new version of Excel (*xlsx), go to Export save it as Excel 97-2003 (*xls)

![image](https://user-images.githubusercontent.com/48614949/231574830-54f7bad3-e437-4b27-a287-dbf984fb1033.png)

Way 2:

If you get this error **Protected view**, which caused difficult when SSMS try to open your excel files.

![image](https://user-images.githubusercontent.com/48614949/231577402-dee5ef91-2ecc-447b-96a5-d404190d22a0.png)

Excel - Files - Options - Trust Center - Trust Center Setting - External Content - Enable all data connections 

![image](https://user-images.githubusercontent.com/48614949/231577610-cdbc5fbf-43fa-4203-b576-7c6b777bd9b4.png)

