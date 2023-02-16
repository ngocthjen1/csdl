-- cau 2
DELIMITER $$
create event if not exists event_buoi2
on schedule at '2023-02-16 06:30:00'
on completion preserve
do 
	insert into employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
    value('Thien','Nguyen','thienlala@gmail.com','0359594478','2020-10-14','4' , '30000', '101' , '9');
select * from employees