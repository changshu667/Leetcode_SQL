# Leetcode_SQL

#### 262. Trips and Users
Failed: Two way left join, "ON Trips.Client_Id = Users.User_Id OR Trips_Driver_Id = Users.User_Id", in this way, each original records will generate two records 


Reasons: if we need the Client_id and Driver_Id satisfy the same selection criteria, there is no way to garantee filter both of them at the same time


Solution: Three-way join to make Client_Id and Driven_Id both match but only generate one row, so we can filter them out together
