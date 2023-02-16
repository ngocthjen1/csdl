-- câu 1:tạo một thủ tục có tên là pro_salary để xét thưởng cuối năm như sau nếu nhân viên làm trên:
 -- a) >=9 năm thì hưởng lương là 12 triệu
 -- b) >6 năm thưởng 8 triệu
 -- c) >4 năm thưởng 6 triệu
 -- d) còn lại thưởng 5 triệu
 
 -- cau1
 select hire_date,timestampdiff(YEAR,hire_date,now()) as year_work, salary,
 case
	when timestampdiff(YEAR,hire_date,now())>=9 then salary+12000
    when timestampdiff(YEAR,hire_date,now())>6 then salary+8000
    when timestampdiff(YEAR,hire_date,now())>4 then salary+6000
    else salary+5000
end as thuong
from employees;

 -- câu 2:viết một thủ tục có tên là là pro_search_name tìm kíêm tên của một nhân viên với tên được truyền 
 -- vào sau đó cho hiển thị toàn bộ thông tin của nhân viên đó. Trong đó nối full name 
DELIMITER $$
create procedure pro_search_name (IN firstname varchar(20))
begin
	select employee_id,concat(first_name,' ',last_name) as fullname, email, phone_number, hire_date,
	job_id,salary,manager_id,department_id from employees where first_name like concat('%',firstname,'%');
end;$$
call pro_search_name('steven')