# SQL assignments

**Goal**: Develop and execute SQL queries to retrieve information from large datasets. <br>
**Context**: Computer Science course issued by VDAB.

**Key skills**: SQL, MySQL, data selection, data management, database manipulation.

**Contents**:
- *video.sql*: contains the instructions to create the database<br>
- *DataSelection.sql*: contains basic data selection queries [`SELECT`, `WHERE`, `AND`, `OR`, `ORDER BY`, `COUNT`, `AVG`, `SUM`, `HAVING`, `GROUP BY`]<br>
- *AdditionalFeatures.sql*: contains more advanced selection queries and joining tables [`INNER JOIN`, `OUTER JOIN`, `SELF JOIN`]<br>
- *DataEditing&Management.sql*: contains database editing and management queries [`INSERT`, `UPDATE`, `DELETE`, `CREATE/DROP TABLE`, `CREATE/DROP FIELD`, `CONSTRAINT` (`UNIQUE`, `PRIMARY KEY`, `FOREIGN KEY`)]

**Database description**:
This database contains the data of a video rental store: customer information, details about the movies, and the companies. It also records who has rented which movie.

To run this project locally:
- clone the repository and enter the folder <br>
`git clone (https link)` <br>
`cd (repository name)`
- download MySQL at the following link <br>
[Download link](https://dev.mysql.com/downloads/mysql/) (choose `mysql-installer-web-community`)
- import the file `video.sql` and execute it by pressing on the bolt icon: this will create the database
- import all the other `.sql` files and execute them to see the results of each query
