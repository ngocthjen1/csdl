-- event 1: moi 1 tuan xoa du lieu trong employees cua 1 cong nhan lam lau nam nhat
DELIMITER $$
create event if not exists event_one
on schedule every 1 week
do
begin
	delete from employees order by hire_date limit 1;
end $$
select * from employees order by hire_date limit 1

-- trigger 1: thong bao loi khi xoa thong tin cua employees hien dang lam quan ly
DELIMITER $$
create trigger before_delete_employees
before delete on employees
for each row
begin

	if (exists(select * from employees where manager_id=old.employee_id)) then
    signal sqlstate '45000'
    set message_text = 'This Employee is being manager';
    end if;
end$$
    
delete from employees where employee_id=100