--Asfarah Rahman
--chapter two problem set

--drop tables 


DROP TABLE Gym_Employees;
DROP TABLE Gym_Equipments;
DROP TABLE Gym_Payments;
DROP TABLE Gym_Members;
DROP TABLE Gyms;


--creates table for gyms 


CREATE TABLE Gyms
(gym_id NUMBER(6),
gym_name VARCHAR2(50),
gym_street VARCHAR2(100),
gym_city VARCHAR2(50),
gym_zip VARCHAR2(11),
gym_state CHAR(2),
gym_phone VARCHAR2(13),
gym_email VARCHAR2(60),
CONSTRAINT gyms_gym_id_pk PRIMARY KEY (gym_id));


--creates table for gym_members


CREATE TABLE Gym_Members
(mem_id NUMBER(6),
mem_first VARCHAR2(20),
mem_last VARCHAR2(30),
mem_street VARCHAR2(100),
mem_city VARCHAR2(50),
mem_zip VARCHAR2(11),
mem_state CHAR(2),
mem_email VARCHAR2(60),
mem_phone VARCHAR2(13),
gym_id NUMBER(6),
CONSTRAINT gym_members_mem_id_pk PRIMARY KEY (mem_id),
CONSTRAINT gym_members_gym_id_fk FOREIGN KEY (gym_id)
REFERENCES gyms(gym_id));


--creates table for gym_payments


CREATE TABLE Gym_Payments
(pay_id NUMBER(8),
pay_amount NUMBER(5,2),
card_holder_name VARCHAR2(21),
card_num NUMBER(16),
card_month NUMBER(2),
card_year NUMBER(2),
card_cvv NUMBER(3),
mem_id NUMBER(6),
CONSTRAINT gym_payments_pay_id_pk PRIMARY KEY(pay_id),
CONSTRAINT gym_payments_mem_id_fk FOREIGN KEY(mem_id)
REFERENCES gym_members(mem_id));


--creates table for gym_equipments


CREATE TABLE Gym_Equipments
(equip_id NUMBER(6),
equip_type VARCHAR2(30),
equip_purchase_date DATE,
equip_replacement_date DATE,
gym_id NUMBER(6),
CONSTRAINT gym_equipments_equip_id_pk PRIMARY KEY(equip_id),
CONSTRAINT gym_equipments_gym_id_fk FOREIGN KEY(gym_id)
REFERENCES gyms(gym_id));


--creates table for gym_employees


CREATE TABLE Gym_Employees
(emp_id NUMBER(6),
emp_first VARCHAR2(20),
emp_last VARCHAR2(30),
emp_phone VARCHAR2(13),
emp_email VARCHAR2(60),
emp_social_security VARCHAR2(11),
gym_id NUMBER(6),
CONSTRAINT gym_employees_emp_id_pk PRIMARY KEY(emp_id),
CONSTRAINT gym_employees_gym_id_fk FOREIGN KEY(gym_id)
REFERENCES gyms(gym_id));

COMMIT;

--Asfarah Rahman ITEC 4200-02
--chapter three problem set


--drop tables 

DROP TABLE Gym_Employees;
DROP SEQUENCE gym_employees_seq;
DROP TABLE Gym_Equipments;
DROP SEQUENCE gym_equipments_seq;
DROP TABLE Gym_Payments;
DROP SEQUENCE gym_payments_seq;
DROP TABLE Gym_Members;
DROP SEQUENCE gym_members_seq;
DROP TABLE Gyms;
DROP SEQUENCE gyms_seq;


--creates table for gyms 

CREATE TABLE Gyms
(gym_id NUMBER(6),
gym_name VARCHAR2(50),
gym_street VARCHAR2(100),
gym_city VARCHAR2(50),
gym_zip VARCHAR2(11),
gym_state CHAR(2),
gym_phone VARCHAR2(13),
gym_email VARCHAR2(60),
CONSTRAINT gyms_gym_id_pk PRIMARY KEY (gym_id));

--create the sequence for gyms

CREATE SEQUENCE gyms_seq
START WITH 10
INCREMENT BY 10;


--creates table for gym_members

CREATE TABLE Gym_Members
(mem_id NUMBER(6),
mem_first VARCHAR2(20),
mem_last VARCHAR2(30),
mem_street VARCHAR2(100),
mem_city VARCHAR2(50),
mem_zip VARCHAR2(11),
mem_state CHAR(2),
mem_email VARCHAR2(60),
mem_phone VARCHAR2(13),
gym_id NUMBER(6),
CONSTRAINT gym_members_mem_id_pk PRIMARY KEY (mem_id),
CONSTRAINT gym_members_gym_id_fk FOREIGN KEY (gym_id)
REFERENCES gyms(gym_id));

--create the sequence for gym members

CREATE SEQUENCE gym_members_seq
START WITH 1000
INCREMENT BY 1;


--creates table for gym_payments

CREATE TABLE Gym_Payments
(pay_id NUMBER(8),
pay_amount NUMBER(5,2),
pay_date DATE,
card_holder_name VARCHAR2(21),
card_num NUMBER(16),
card_month NUMBER(2),
card_year NUMBER(2),
card_cvv NUMBER(3),
mem_id NUMBER(6),
CONSTRAINT gym_payments_pay_id_pk PRIMARY KEY(pay_id),
CONSTRAINT gym_payments_mem_id_fk FOREIGN KEY(mem_id)
REFERENCES gym_members(mem_id));

--create the sequence for gyms payments

CREATE SEQUENCE gym_payments_seq
START WITH 1
INCREMENT BY 1;


--creates table for gym_equipments

CREATE TABLE Gym_Equipments
(equip_id NUMBER(6),
equip_type VARCHAR2(30),
equip_purchase_date DATE,
equip_replacement_date DATE,
gym_id NUMBER(6),
CONSTRAINT gym_equipments_equip_id_pk PRIMARY KEY(equip_id),
CONSTRAINT gym_equipments_gym_id_fk FOREIGN KEY(gym_id)
REFERENCES gyms(gym_id));

--create the sequence for gym equipments

CREATE SEQUENCE gym_equipments_seq
START WITH 100
INCREMENT BY 100;

--creates table for gym_employees

CREATE TABLE Gym_Employees
(emp_id NUMBER(6),
emp_first VARCHAR2(20),
emp_last VARCHAR2(30),
emp_phone VARCHAR2(13),
emp_email VARCHAR2(60),
emp_social_security VARCHAR2(11),
gym_id NUMBER(6),
CONSTRAINT gym_employees_emp_id_pk PRIMARY KEY(emp_id),
CONSTRAINT gym_employees_gym_id_fk FOREIGN KEY(gym_id)
REFERENCES gyms(gym_id));

--create the sequence for gym employees


CREATE SEQUENCE gym_employees_seq
START WITH 10000
INCREMENT BY 1;


--insert data into gyms
INSERT INTO Gyms(gym_id, gym_name, gym_street, gym_city, gym_zip, gym_state, gym_phone, gym_email)
	VALUES (gyms_seq.NEXTVAL, 'West Coast', '1234 Pacific Avenue',	'Venice', '90291', 'CA', '808-999-8989', 'westcoast@gym.com');
INSERT INTO Gyms(gym_id, gym_name, gym_street, gym_city, gym_zip, gym_state, gym_phone, gym_email)
	VALUES (gyms_seq.NEXTVAL, 'Get Free', '5858 Ocean Front Drive', 'Orlando', '44554', 'FL', '404-679-2343', 'getfree@gym.com');
INSERT INTO Gyms(gym_id, gym_name, gym_street, gym_city, gym_zip, gym_state, gym_phone, gym_email)
	VALUES (gyms_seq.NEXTVAL, 'Summer Bummer', '9769 Valley View Road', 'Atlanta', '30069', 'GA', '678-998-5556', 'summerbummer@gmym.com');
INSERT INTO Gyms(gym_id, gym_name, gym_street, gym_city, gym_zip, gym_state, gym_phone, gym_email)
	VALUES (gyms_seq.NEXTVAL, 'Shades Of Cool', '6754 Saks Street', 'Queens', '34511', 'NY', '917-890-3457', 'shadesofcool@gym.com');
INSERT INTO Gyms(gym_id, gym_name, gym_street, gym_city, gym_zip, gym_state, gym_phone, gym_email)
	VALUES (gyms_seq.NEXTVAL, 'Mariners Complex', '123 Sesame Street', 'Lawrenceville', '30044', 'GA', '770-333-0229', 'marinerscomplex@gym.com');
INSERT INTO Gyms(gym_id, gym_name, gym_street, gym_city, gym_zip, gym_state, gym_phone, gym_email)
	VALUES (gyms_seq.NEXTVAL, 'Body Electric', '5th Avenue', 'Manhattan', '10021', 'NY', '917-902-6802', 'bodyelectric@gym.com');
INSERT INTO Gyms(gym_id, gym_name, gym_street, gym_city, gym_zip, gym_state, gym_phone, gym_email)
	VALUES (gyms_seq.NEXTVAL, 'Blue Velvet', '2567 Spout Springs Road', 'Auburn', '30011', 'GA', '770-456-1234', 'bluevelvet@gym.com');
INSERT INTO Gyms(gym_id, gym_name, gym_street, gym_city, gym_zip, gym_state, gym_phone, gym_email)
	VALUES (gyms_seq.NEXTVAL, 'Paradise', '5678 James Street', 'Atlanta', '30063', 'GA', '678-432-0921', 'paradise@gym.com');
	

--insert data into gym memebers
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'Lizzy', 'Grant', '200 Long Drive', 'Venice', '90210', 'CA', 'lgrant@email.com', '808-002-6789', 10);
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'Max', 'Smith', '555 Lee Grant', 'Orlando', '44554', 'FL', 'msmith@email.com', '770-789-6689', 20);
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'John', 'Pickles', '34 Easter Lane', 'Dacula', '30022', 'GA', 'jpickles@email.com', '770-654-0002', 30);
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'Carrie', 'Bradshaw', '11 Helix Drive', 'Queens', '10032', 'NY', 'cbradshaw@email.com', '917-363-1116', 40);
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'Kim', 'Brown', '890 Chesire Road', 'Lawrenceville', '30043', 'GA', 'kbrown@gmail.com', '678-444-6667', 50); 
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'Cindy', 'Krabs', '1665 Spongebob Lane', 'Manhattan', '10031', 'NY', 'ckrabs@email.com', '917-222-0002', 60);
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'Barack', 'Obama', '125 Pike Drive', 'Dacula', '30519', 'GA', 'bobama@email.com', '470-883-8374', 70);
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'Mary', 'Garica', '600 Wing Street', 'Atlanta', '30064', 'GA', 'mgarica@email.com', '457-455-2838',80);
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'Mandy', 'Wright', '23 Fun House Road', 'Atlanta', '30069', 'GA', 'mwright@email.com', '770-628-3747', 80);
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'John', 'Wick', '8969 Randy Court', 'Atlanta', '30067', 'GA', 'jwick@email.com', '678-366-3772', 80);
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'John', 'Krabs', '1645 Spongebob Lane', 'Manhattan', '10031', 'NY', 'jkrabs@email.com', '917-212-0662', 60);
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'Michelle', 'Obama', '125 Pike Drive', 'Dacula', '30519', 'GA', 'mobama@email.com', '470-893-8311', 70);
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'Larry', 'Garica', '600 Wing Street', 'Atlanta', '30064', 'GA', 'lgarica@email.com', '457-465-8838',80);
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'Mandy', 'Kard', '45 Fun House Road', 'Atlanta', '30069', 'GA', 'mkard@email.com', '770-618-3797', 80);
INSERT INTO Gym_Members(mem_id, mem_first, mem_last, mem_street, mem_city, mem_zip, mem_state, mem_email, mem_phone, gym_id)
	VALUES (gym_members_seq.NEXTVAL, 'Kevin', 'Green', '999 Petal Court', 'Atlanta', '30067', 'GA', 'kgreen@email.com', '678-386-3567', 80);

--insert data into gym payments
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 25.99, '15-JUN-19', 'Lizzy Grant', 6700123498764567, 08, 25, 777, 1000);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 25.99, '15-JUN-19', 'Max Smith', 3780123446783567, 06, 21, 487, 1001);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 25.99, '15-JUN-19', 'John Pickles', 1678256839762999, 11, 20, 678, 1002);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 25.99, '15-JUN-19', 'Carrie Bradshaw', 4568294726941680, 02, 20, 274, 1003);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 25.99, '15-JUN-19', 'Kim Brown', 4567194274194274, 10, 22, 666, 1004);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 25.99, '15-JUN-19', 'Cindy Krabs', 9000158900334369, 12, 20, 630, 1005);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 25.99, '15-JUN-19', 'Barack Obama', 6899234900695679, 03, 20, 632, 1006);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 25.99, '15-JUN-19', 'Mary Garica', 4470237018903300, 01, 22, 712, 1007);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 65.99, '15-JUN-19', 'Mandy Wright', 6711456190813421, 09, 20, 194, 1008);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 75.99, '15-JUN-19', 'John Wick', 4555678521156035, 04, 23, 566, 1009);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 65.99, '15-AUG-19', 'Kim Brown', 4567194274194274, 10, 22, 666, 1004);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 45.99, '15-AUG-19', 'Cindy Krabs', 9000158900334369, 12, 20, 630, 1005);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 75.99, '15-AUG-19', 'Barack Obama', 6899234900695679, 03, 20, 632, 1006);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 85.99, '15-AUG-19', 'Mary Garica', 4470237018903300, 01, 22, 712, 1007);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 85.99, '15-AUG-19', 'Mandy Wright', 6711456190813421, 09, 20, 194, 1008);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 95.99, '15-AUG-19', 'John Wick', 4555678521156035, 04, 23, 566, 1009);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 45.99, '15-SEP-19', 'John Pickles', 1678256839762999, 11, 20, 678, 1002);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 45.99, '15-SEP-19', 'Carrie Bradshaw', 4568294726941680, 02, 20, 274, 1003);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 65.99, '15-SEP-19', 'Kim Brown', 4567194274194274, 10, 22, 666, 1004);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 55.99, '15-SEP-19', 'Cindy Krabs', 9000158900334369, 12, 20, 630, 1005);
INSERT INTO Gym_Payments(pay_id, pay_amount, pay_date, card_holder_name, card_num, card_month, card_year, card_cvv, mem_id)
	VALUES (gym_payments_seq.NEXTVAL, 45.99, '15-SEP-19', 'Barack Obama', 6899234900695679, 03, 20, 632, 1006);

--insert data into gym equipments
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Treadmill', '05-JAN-19', '05-JAN-29', 10);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Elliptical', '05-JAN-19', '05-JAN-29', 10);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Yoga Mat', '05-JAN-19', '05-JAN-29', 20);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Jump Rope', '05-JAN-19', '05-JAN-29', 30);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Exercise Bike', '05-JAN-19', '05-JAN-29', 40);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Rowing Machine', '05-JAN-19', '05-JAN-29', 50);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Exercise Ball', '05-JAN-19', '05-JAN-29', 60);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Dumbbell Rack', '05-JAN-19', '05-JAN-29', 70);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Leg Press', '05-JAN-19', '05-JAN-29', 10);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Chest Press', '05-JAN-19', '05-JAN-29', 10);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Treadmill', '05-JAN-19', '05-JAN-29', 80);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Elliptical', '05-JAN-19', '05-JAN-29', 40);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Yoga Mat', '05-JAN-19', '05-JAN-29', 50);  
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Treadmill', '05-JAN-20', '05-JAN-30', 70);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Elliptical', '05-JAN-20', '05-JAN-30', 50);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Yoga Mat', '05-JAN-20', '05-JAN-30', 40);
INSERT INTO Gym_Equipments(equip_id, equip_type, equip_purchase_date, equip_replacement_date, gym_id)
	VALUES (gym_equipments_seq.NEXTVAL, 'Jump Rope', '05-JAN-20', '05-JAN-30', 60);


--insert data into gym employees 
INSERT INTO Gym_Employees(emp_id, emp_first, emp_last, emp_phone, emp_email, emp_social_security, gym_id)
	VALUES (gym_employees_seq.NEXTVAL, 'Lisa', 'Brown', '706-666-7878', 'lisabrown@gymco.com', '243-45-4672', 10);
INSERT INTO Gym_Employees(emp_id, emp_first, emp_last, emp_phone, emp_email, emp_social_security, gym_id)
	VALUES (gym_employees_seq.NEXTVAL, 'Elvis', 'Greene', '770-354-3473', 'elvisgreene@gymco.com', '469-69-2000', 20);
INSERT INTO Gym_Employees(emp_id, emp_first, emp_last, emp_phone, emp_email, emp_social_security, gym_id)
	VALUES (gym_employees_seq.NEXTVAL, 'Shay', 'White', '679-227-4529', 'shaywhite@gymco.com', '237-47-3433',30);
INSERT INTO Gym_Employees(emp_id, emp_first, emp_last, emp_phone, emp_email, emp_social_security, gym_id)
	VALUES (gym_employees_seq.NEXTVAL, 'Abby', 'Green', '677-333-4658', 'abbygreen@gymco.com', '789-35-4238',40);
INSERT INTO Gym_Employees(emp_id, emp_first, emp_last, emp_phone, emp_email, emp_social_security, gym_id)
	VALUES (gym_employees_seq.NEXTVAL, 'Roxy', 'Dunn', '917-499-6480', 'roxydunn@gymco.com', '293-56-9393', 50);
INSERT INTO Gym_Employees(emp_id, emp_first, emp_last, emp_phone, emp_email, emp_social_security, gym_id)
	VALUES (gym_employees_seq.NEXTVAL, 'Alex', 'Fitz', '404-263-5768', 'alexfitz@gymco.com', '258-33-6753', 60);
INSERT INTO Gym_Employees(emp_id, emp_first, emp_last, emp_phone, emp_email, emp_social_security, gym_id)
	VALUES (gym_employees_seq.NEXTVAL, 'Deja', 'Smith', '808-456-7344', 'dejasmith@gymco.com', '576-34-6202', 70);
INSERT INTO Gym_Employees(emp_id, emp_first, emp_last, emp_phone, emp_email, emp_social_security, gym_id)
	VALUES (gym_employees_seq.NEXTVAL,'Gina', 'Brown', '678-023-1234', 'ginabrown@gymco.com', '205-11-5690', 80);
	
COMMIT;

--display all tables
SELECT * FROM gyms;
SELECT * FROM gym_members;
SELECT * FROM gym_payments;
SELECT * FROM gym_equipments;
SELECT * FROM gym_employees;