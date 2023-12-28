select datehired, datehired + 5 plus5d, datehired-5 min5d
from doctor;

select datehired, datehired + 5/24 plus5hr, datehired-5/24 min5hr
from doctor;

select datehired,
to_char(datehired + 5/(24*60),'dd-mon-yy hh:mi:ss am') plus5min,
to_char(datehired - 5/(24*60),'dd-mon-yy hh:mi:ss am') min5min
from doctor;

select     datehired,
           sysdate, 
           sysdate-datehired noofdays,
          (sysdate-datehired)/7 noofweek,
          (sysdate-datehired)/30 noofmth,
           months_between(sysdate,datehired) "Months in Service",
          (sysdate-datehired)/365 noofyear
from doctor;

select datehired, add_months(datehired,3) from doctor;
select add_months('04-JAN-22',3) from dual;
select next_day(sysdate,'mon') from dual;
select next_day(sysdate,'wednesday') from dual;

select last_day(sysdate) from dual;

select doc_id, datehired, 
    round(datehired,'month') roundmth, 
    round(datehired,'year') roundyear
from doctor;
  
  
select
round(to_date('06-JUN-21'),'month') roundmth,
round(to_date('06-JUN-21'),'year') roundyear
from dual;

 select doc_id, datehired, 
 trunc(datehired,'month') roundmth, 
 trunc(datehired,'year') roundyear
from doctor;

select datehired, to_char(datehired,'fm ddspth Month yyyy') from doctor;

select salpermon, to_char(salpermon,'$99,999.99') from doctor;

