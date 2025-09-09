use db 
DROP TABLE IF EXISTS customers;

create table customers(customer_id int ,name varchar(20), adress varchar(20), region varchar(20) );


create table SmartMeterReadings(meter_id int ,customer_id int, location varchar(20),
installed_date date,readind_date_time datetime, energy_consumed int);


insert into customers values (1,'surendra','guntur','ap'),(2,'ramesh','nellore','ap')
,(3,'suresh','vzg','ap'),(4,'aman','nasik','bombay'),(5,'pratap','vjwd','ap');


insert into SmartMeterReadings values (101,1,'ap','2024-10-09','2024-10-11 11:30:30',25),
(102,2,'ap','2025-11-09','2025-10-12 11:30:30',25),
(103,3,'ap','2023-12-09','2023-10-13 11:30:30',113),
(104,4,'bombay','2024-01-09','2025-10-14 11:30:30',126),
(105,5,'ap','2023-05-09','2024-10-15 11:30:30',11);


insert into SmartMeterReadings values (101,1,'ap','2024-10-09','2024-10-12 10:30:00',24),
(102,2,'ap','2025-11-09','2025-10-13 10:30:00',20),
(103,3,'ap','2023-12-09','2023-10-14 10:30:00',83),
(104,4,'bombay','2024-01-09','2025-10-15 10:30:00',99),
(105,5,'ap','2023-05-09','2024-10-16 10:30:00',26);

insert into SmartMeterReadings values (101,1,'ap','2024-10-09','2024-10-11 10:30:00',24),
(102,2,'ap','2025-11-09','2025-10-12 10:30:00',20),
(103,3,'ap','2023-12-09','2023-10-13 10:30:00',83),
(104,4,'bombay','2024-01-09','2025-10-14 10:30:00',99),
(105,5,'ap','2023-05-09','2024-10-15 10:30:00',26);


drop table SmartMeterReadings;
select * from customers;

select * from SmartMeterReadings;

----task 1: Write a query to
--. Fetch all smart meter readings where:
--EnergyConsumed is between 10 and 50 kWh
--ReadingDateTime is between '2024-01-01' and '2024-12-01
--Exclude meters installed after '2024-06-30'

select  from SmartMeterReadings
where (readind_date_time between '2024-01-01' and '2024-12-31') and (energy_consumed between 10 and 50)
and (installed_date<'2024-06-30');


---Task2 :For each customer, calculate:
--Average energy consumed per reading
--Maximum energy consumed in a single reading.
---Only include readings from the current year.

select meter_id,avg(energy_consumed) as average_reading,max(energy_consumed) as maximum_enery_perday
from SmartMeterReadings 
where readind_date_time>'2025-01-01'
group by meter_id;


---stretch goal 
--task 3 :Smart Meter Energy SummaryObjective: Analyse smart meter readings 
--with moderate filtering andgrouping.Write a query to:
--For each meter, calculate:
--Total energy consumed during peak hours (6 PM to 10 PM)
--Number of readings recorded during that time
--Only include meters that Have more than 10 readings in total
--Were installed before 2025-01-01
--Consider only readings from the current year




