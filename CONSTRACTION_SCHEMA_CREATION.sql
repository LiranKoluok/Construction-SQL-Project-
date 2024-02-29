DROP SCHEMA project3;

CREATE SCHEMA project3 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

USE project3;

CREATE TABLE customers (
  customer_id INT NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  phone_number VARCHAR(45) NOT NULL,
  PRIMARY KEY (customer_id));
  
  CREATE TABLE project_name (
  project_id INT NOT NULL,
  customer_id INT NOT NULL,
  project_level INT NOT NULL,
  RS_time DATETIME NOT NULL,
  RF_time DATETIME NOT NULL,
  budget INT NOT NULL,
  street_number INT NOT NULL,
  building_number INT NOT NULL,
  apartment_number INT NOT NULL,
  work_limitations VARCHAR(45) NOT NULL,
  PRIMARY KEY (project_id));
  
  CREATE TABLE task (
  task_id INT NOT NULL,
  task_description VARCHAR(45) NOT NULL,
  duration INT NOT NULL,
  required_skills VARCHAR(45) NOT NULL,
  PRIMARY KEY (task_id));
  
  CREATE TABLE employee (
  employee_id INT NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  starting_date DATETIME NOT NULL,
  customers_rating INT NOT NULL,
  phone_number VARCHAR(45) NOT NULL,
  email_address VARCHAR(45) NOT NULL,
  price_per_hour INT NOT NULL,
  specialization VARCHAR(45) NOT NULL,
  PRIMARY KEY (employee_id));
  
  CREATE TABLE tool (
  tool_id INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  price INT NOT NULL,
  years_of_warranty INT NOT NULL,
  rate INT NOT NULL,
  PRIMARY KEY (tool_id));
  
  CREATE TABLE hardware_store (
hardware_store_id INT NOT NULL ,
street_number VARCHAR(45),
building_number INT,
floor INT,
open_hours  VARCHAR(45),
name VARCHAR(45),
phone_number VARCHAR(45),
email_address VARCHAR(45),
PRIMARY KEY (hardware_store_id)
 );
 
 CREATE TABLE employee_task_project (
  task_id INT NOT NULL,
  project_id INT NOT NULL,
  employee_id INT NOT NULL,
  task_start_time_requeste_employee VARCHAR(45) NOT NULL,
  task_completion_time_requeste_employee VARCHAR(45) NOT NULL,
  Number_workers_required_task_project INT NOT NULL,
  requested_finnishing_task VARCHAR(45) NOT NULL,
  PRIMARY KEY (task_id, project_id, employee_id));
  
  
  CREATE TABLE stock (
tool_id INT NOT NULL,
store_id INT NOT NULL,
availability_tool VARCHAR(1) NOT NULL,
quantity VARCHAR(2) NOT NULL,
Estimated_delivery_time VARCHAR(1) NOT NULL);


CREATE TABLE employee_tool (
  tool_id INT NOT NULL,
  employee_id INT NOT NULL,
  own VARCHAR(1) NOT NULL,
  ammount INT NOT NULL,
  PRIMARY KEY (tool_id, employee_id));
  
  CREATE TABLE updates (
  customer_id INT NOT NULL,
  project_id INT NOT NULL,
  budget INT NOT NULL,
  num_of_project INT NOT NULL,
  num_of_updates INT NOT NULL,
  date DATETIME NOT NULL,
  PRIMARY KEY (project_id));
  
  -- Mock data for customers table
INSERT INTO customers (customer_id, first_name, last_name, email, phone_number) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '456-789-0123'),
(4, 'Bob', 'Wilson', 'bob.wilson@example.com', '789-012-3456');

-- Mock data for project_name table
INSERT INTO project_name (project_id, customer_id, project_level, RS_time, RF_time, budget, street_number, building_number, apartment_number, work_limitations) VALUES
(1, 1, 1, '2023-01-01 08:00:00', '2023-02-01 17:00:00', 5000, 123, 456, 789, 'No limitations'),
(2, 2, 2, '2023-03-01 08:00:00', '2023-04-01 17:00:00', 7000, 456, 789, 123, 'Some limitations'),
(3, 3, 1, '2023-05-01 08:00:00', '2023-06-01 17:00:00', 6000, 789, 123, 456, 'No limitations'),
(4, 4, 3, '2023-07-01 08:00:00', '2023-08-01 17:00:00', 8000, 456, 789, 123, 'Some limitations');

-- Mock data for task table
INSERT INTO task (task_id, task_description, duration, required_skills) VALUES
(1, 'Design', 10, 'Design'),
(2, 'Construction', 20, 'Construction'),
(3, 'Planning', 15, 'Planning'),
(4, 'Inspection', 8, 'Inspection');

-- Mock data for employee table
INSERT INTO employee (employee_id, first_name, last_name, starting_date, customers_rating, phone_number, email_address, price_per_hour, specialization) VALUES
(1, 'Charlie', 'Davis', '2002-01-01 08:00:00', 4, '111-222-3333', 'charlie.davis@example.com', 50, 'Design'),
(2, 'Sophia', 'Martinez', '2002-02-01 08:00:00', 5, '444-555-6666', 'sophia.martinez@example.com', 60, 'Construction'),
(3, 'Emily', 'Brown', '2022-03-01 08:00:00', 3, '777-888-9999', 'emily.brown@example.com', 55, 'Planning'),
(4, 'Michael', 'Wilson', '2022-04-01 08:00:00', 4, '999-000-1111', 'michael.wilson@example.com', 65, 'Inspection');

-- Mock data for tool table
INSERT INTO tool (tool_id, name, price, years_of_warranty, rate) VALUES
(1, 'Hammer', 20, 5, 4),
(2, 'Drill', 9050, 3, 5),
(3, 'Saw', 30, 4, 4),
(4, 'Wrench', 25, 2, 3);

-- Mock data for hardware_store table
INSERT INTO hardware_store (hardware_store_id, street_number, building_number, floor, open_hours, name, phone_number, email_address) VALUES
(1, '123', 456, 1, '9AM-6PM', 'Hardware Store A', '111-222-3333', 'info@storea.com'),
(2, '456', 789, 2, '10AM-7PM', 'Hardware Store B', '444-555-6666', 'info@storeb.com'),
(3, '789', 123, 1, '8AM-5PM', 'Hardware Store C', '777-888-9999', 'info@storec.com'),
(4, '987', 654, 2, '9AM-6PM', 'Hardware Store D', '999-000-1111', 'info@stored.com');

-- Mock data for employee_task_project table
INSERT INTO employee_task_project (task_id, project_id, employee_id, task_start_time_requeste_employee, task_completion_time_requeste_employee, Number_workers_required_task_project, requested_finnishing_task) VALUES
(1, 1, 1, '2023-01-01 08:00:00', '2023-01-11 17:00:00', 5, '2023-01-10'),
(2, 2, 2, '2023-03-01 08:00:00', '2023-03-21 17:00:00', 3, '2023-03-20'),
(3, 3, 3, '2023-05-01 08:00:00', '2023-05-16 17:00:00', 4, '2023-05-15'),
(4, 4, 4, '2023-07-01 08:00:00', '2023-07-09 17:00:00', 2, '2023-07-08');

-- Mock data for stock table
INSERT INTO stock (tool_id, store_id, availability_tool, quantity, Estimated_delivery_time) VALUES
(1, 1, 'T', '10', '1'),
(2, 2, 'T', '5', '1'),
(3, 3, 'T', '8', '1'),
(4, 4, 'T', '3', '1');

-- Mock data for employee_tool table
INSERT INTO employee_tool (tool_id, employee_id, own, ammount) VALUES
(1, 1, 'Y', 1),
(2, 2, 'Y', 2),
(3, 3, 'Y', 1),
(4, 4, 'Y', 1);

-- Mock data for updates table
INSERT INTO updates (customer_id, project_id, budget, num_of_project, num_of_updates, date) VALUES
(1, 1, 5000, 1, 1, '2023-01-15'),
(2, 2, 7000, 1, 1, '2023-03-10'),
(3, 3, 6000, 1, 1, '2023-05-20'),
(4, 4, 8000, 1, 1, '2023-07-15');