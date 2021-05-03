## MongoDB Project:
Created a simple database name e-commerce and it has three collections namely, product, cart and order.
Product contains all details about manufacturer,  shipping these are all physical information about the product and which make sense because these are unique feature of the product and it give a strong data locality to a larger product documents. Hence I wrote a validator for this collection as its primary collection for database the data needs to validate. 
Category contains details about Parent and child category of a specific product and Order contains details about the customer who order it, order status, tracking info etc. 

### Why Mongodb?
First it lets you organize the data in BSON, which very simple then writing in PostgreSQL. Secondly, rather than stuck yourself in complexity of tables, primary key, foreign key MongoDB is lets you stay in your space and query and update the documents easily for you.
Modifying data is simple. Writing validator compare to PostgreSQL is far better and easy. 

As MongoDB makes it possible to model many different applications this data model (i.e. "schema design,") is useful for developing applications around any restricted resource system, not just e-commerce system.

