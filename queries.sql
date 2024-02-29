# Query 1
SELECT 
    a.project_id,
    GROUP_CONCAT(DISTINCT t.employee_id) possible_employees
FROM
    employee_task_project AS a
        JOIN
    (SELECT 
        *
    FROM
        task
    JOIN employee ON employee.specialization = task.required_skills
    ORDER BY task_id DESC) AS t ON a.task_id = t.task_id
GROUP BY a.project_id;


# Query 2
select * from employee_task_project as e where e.employee_id in
(
	SELECT employee_id FROM employee
	WHERE customers_rating > (SELECT AVG(customers_rating) FROM employee)
	order by customers_rating desc
);

# Query 3
select concat(c.first_name, ' ', c.last_name) full_name , 
count(distinct p.project_id) number_of_projects,
SUM(datediff(RF_time, RS_time)) total_number_of_days
from customers as c join project_name as p on p.customer_id = c.customer_id
group by full_name 
order by total_number_of_days desc;

# Query 4
SELECT *
FROM stock
        JOIN
    em_no_tool ON stock.tool_id = em_no_tool.tool_id
WHERE
    availability_tool = 'T';


# Query 5
UPDATE project_name 
SET 
    budget = 3001
WHERE
    customer_id = 2;

# Query 6
select name ,years_of_warranty
 from columns
 where years_of_warranty>3;

# Query 7
select store_id tool_id,availability_tool,quantity 
from stock
 where availability_tool ='available' or quantity>8;

# Query 8
select project_id, budget, customer_id
 from project_name
 where budget>3000 or work_limitations<2019;

# Query 9
select name , price
 from tool
 where (name="Drill") and price>800;


# Query 10
SELECT first_name, last_name, phone_number
FROM employee
WHERE (price_per_hour < 100) and (customers_rating >=4);


# Query 11
SELECT project_id, budget
FROM project_name
ORDER BY budget DESC limit 5;


# Query 12
SELECT *
FROM stock
WHERE (availability_tool <5) and (estimated_delivery_time < 24);


# Query 13
SELECT employee_id, first_name, last_name, email_address
FROM employee
WHERE (starting_date > 2019);

