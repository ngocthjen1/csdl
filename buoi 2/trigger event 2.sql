-- event 2: sau 1 tuan them vao 1 cong viec don ve sinh co luong tu 3000 den 4500
DELIMITER $$
create event if not exists event_insert_job
on schedule AT CURRENT_TIMESTAMP + INTERVAL 1 week
do
begin
	INSERT INTO `csdl`.`jobs` (`job_title`, `min_salary`, `max_salary`) VALUES ('Cleaner', '3000.00', '4500.00');
end $$

-- trigger 2: neu them cong viec bi trung ten thi thong bao loi
DELIMITER $$
create trigger before_insert_job
before insert on jobs
for each row
begin
	if (exists(select job_title from jobs where job_title=new.job_title)) then
    signal sqlstate '45000'
    set message_text = 'Job title is exists';
    end if;
end$$