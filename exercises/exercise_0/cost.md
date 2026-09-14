# 1. How much does it cost?

For these exercises, look up the credit cost for your snowflake edition, cloud provider and region for your snowflake account.

## a) You have a simple workload that runs daily in Snowflake. The workload uses 0.5 credits per day. Calculate the total credit usage and cost for a 30-day month.

3,9 * 0,5 = 1,95   ->  1,95 * 30 = **58,5$**

## b) Your workload varies throughout the month. For the first 10 days, you use 2 credits per day. For the next 10 days, you use 1.5 credits per day, and for the last 10 days, you use 1 credit per day. Calculate the total credit usage and cost for a 30-day month.

(3,9 * 2) * 10 = **78$**   
(3,9 * 1,5) * 10 = **58,5$**   
3,9 * 10 = **39$**   
78 + 58,5 + 39 = **175,5$**

## c) You have three different warehouses running workloads simultaneously. Warehouse A is of size XS, Warehouse B is of size S, and Warehouse C is of size M. Warehouse A is used for 10h/day, B is used for 2h/day and C is used for 1h/day. Calculate the total monthly cost assuming each warehouse runs for the full 30-day month.

A/day = **39$** (3,9 * 10)   
B/day = **15,6$** ((3,9 * 2) * 2)  
C/day = **15,6$** (3,9 * 4)  
Total/month = **2106$** ((A+B+C) * 30)

## d) Your Snowflake warehouse uses auto-scaling. For the first 10 days, it operates on 2 clusters for 10 hours per day. For the next 10 days, it scales up to 3 clusters for 10 hours per day. For the last 10 days, it scales up to 4 clusters for 10 hours per day. Calculate the total monthly budget. Assume the warehouse consumes 1 credit per hour per cluster.

first 10 days -> ((3,9 * 2) * 10) * 10 = **780$**   
next 10 days -> 8(3,9* 3) * 10) * 10 = **1170$**  
last 10 days -> ((3,9* 4) * 10) * 10 = **1560$**  
the whole month -> **3510$** (780 + 1170 + 1560)