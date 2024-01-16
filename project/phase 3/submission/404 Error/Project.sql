CREATE TABLE Customer ( 
Customer_ID VARCHAR2(15), 
Customer_name VARCHAR2(30) NOT NULL, 
Customer_emailAddress VARCHAR2(30) NOT NULL,
CONSTRAINT cus_cus_id_pk PRIMARY KEY (Customer_ID) );

CREATE TABLE Phone_Number (
Customer_phoneNumber VARCHAR2(12), 
Customer_ID VARCHAR2(15),
CONSTRAINT pn_cus_pn_pk PRIMARY KEY (Customer_phoneNumber),
CONSTRAINT phoneNum_fk FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID) );

CREATE TABLE CV_Package (
Package_ID VARCHAR2(15), 
Package_name VARCHAR2(30) NOT NULL, 
Package_descriptions VARCHAR2(4000) NOT NULL, 
Package_price NUMBER(8,2) NOT NULL,
CONSTRAINT cvpack_pack_id_pk PRIMARY KEY (Package_ID) );

CREATE TABLE CV_TemplatesPackage (
Package_ID VARCHAR2(15), 
Package_name VARCHAR2(30) NOT NULL, 
Package_descriptions VARCHAR2(4000) NOT NULL, 
Package_price NUMBER(8,2) NOT NULL, 
No_of_directEmail_CV_templates NUMBER(1) NOT NULL, 
No_of_ATS_CV_templates NUMBER(1) NOT NULL,
CONSTRAINT cvtp_pack_id_pk PRIMARY KEY (Package_ID) );


CREATE TABLE CV_Writing_BasicPackage (
Package_ID VARCHAR2(15), 
Package_name VARCHAR2(30) NOT NULL, 
Package_descriptions VARCHAR2(4000) NOT NULL, 
Package_price NUMBER(8,2) NOT NULL, 
Duration NUMBER(2) NOT NULL,
CONSTRAINT cvwbp_pack_id_pk PRIMARY KEY (Package_ID) );

CREATE TABLE CV_Writing_ProPackage (
Package_ID VARCHAR2(15),
Package_name VARCHAR2(30) NOT NULL, 
Package_descriptions VARCHAR2(4000) NOT NULL, 
Package_price NUMBER(8,2) NOT NULL, 
Duration NUMBER(1) NOT NULL, 
No_of_topNotch_ATS_CV NUMBER(1) NOT NULL,
CONSTRAINT cvwpp_pack_id_pk PRIMARY KEY (Package_ID) );

CREATE TABLE CV_WebinarPackage (
Package_ID VARCHAR2(15), 
Package_name VARCHAR2(30) NOT NULL, 
Package_descriptions VARCHAR2(4000) NOT NULL, 
Package_price NUMBER(8,2) NOT NULL, 
No_of_modules NUMBER(1) NOT NULL,
CONSTRAINT cvwp_pack_id_pk PRIMARY KEY (Package_ID) );

CREATE TABLE Payment (
Payment_ID VARCHAR2(15), 
Payment_type CHAR (1) NOT NULL, 
Payment_status CHAR(1) NOT NULL,
CONSTRAINT pay_pay_id_pk PRIMARY KEY (Payment_ID) );

CREATE TABLE Package_Customer (
Payment_ID VARCHAR2(15), 
Package_ID VARCHAR2(15), 
Customer_ID VARCHAR2(15),
CONSTRAINT pc_pay_id_pk PRIMARY KEY (Payment_ID, Package_ID,Customer_ID),
CONSTRAINT pc_pay_id_fk FOREIGN KEY (Payment_ID) REFERENCES Payment (Payment_ID),
CONSTRAINT pc_pack_id_fk FOREIGN KEY (Package_ID) REFERENCES CV_Package (Package_ID),
CONSTRAINT pc_cus_id_fk FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID) );

CREATE TABLE CV_Draft_Info (
Draft_ID VARCHAR2(15), 
Draft_fileName VARCHAR2(40) NOT NULL, 
Draft_dateSubmitted DATE NOT NULL,
Info_contactInfo VARCHAR2(4000) NOT NULL, 
Info_academicHistory VARCHAR2(4000) NOT NULL, 
Info_professionalExperience VARCHAR2(4000) NOT NULL, 
Info_qualificationAndSkills VARCHAR2(4000) NOT NULL, 
Info_awardsAndHonours VARCHAR2(4000) NOT NULL, 
Customer_ID VARCHAR2(15),
CONSTRAINT cvdraft_draft_id_pk PRIMARY KEY (Draft_ID),
CONSTRAINT cvdraft_cus_id_fk FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID) );

CREATE TABLE CV_Generating_Status (
Status_code VARCHAR2(15), 
Status_descriptions VARCHAR2(4000) NOT NULL,
CONSTRAINT cvgs_sc_pk PRIMARY KEY (Status_code) );

CREATE TABLE Draft_Customer (
Draft_ID VARCHAR2(15), 
Customer_ID VARCHAR2(15), 
Status_code VARCHAR2 (15),
CONSTRAINT dc_draft_id_pk PRIMARY KEY (Draft_ID, Customer_ID, status_code),
CONSTRAINT dc_draft_id_fk FOREIGN KEY (Draft_ID) REFERENCES CV_Draft_Info (Draft_ID),
CONSTRAINT dc_cus_id_fk FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
CONSTRAINT dc_sc_id_fk FOREIGN KEY (Status_code) REFERENCES CV_Generating_Status (Status_code) );

CREATE TABLE CV (
CV_ID VARCHAR2(15), 
CV_fileName VARCHAR2(40) NOT NULL, 
CV_dateGenerated DATE NOT NULL,
CONSTRAINT cv_cv_id_pk PRIMARY KEY (CV_ID) );


CREATE TABLE Worker (
Worker_ID VARCHAR2(15), 
Worker_name VARCHAR2(30) NOT NULL, 
Worker_phoneNumber VARCHAR2(12) NOT NULL, 
Worker_emailAddress VARCHAR2(30) NOT NULL,
CONSTRAINT wk_wk_id_pk PRIMARY KEY (Worker_ID) );






CREATE TABLE CV_ConsultantWorker (
Worker_ID VARCHAR2(15), 
Worker_name VARCHAR2(30) NOT NULL, 
Worker_phoneNumber VARCHAR2(12) NOT NULL, 
Worker_emailAddress VARCHAR2(30) NOT NULL, 
Department_name VARCHAR2(30) NOT NULL,
CONSTRAINT cvcw_wk_id_pk PRIMARY KEY (Worker_ID) );

CREATE TABLE Team_LeaderWorker (
Worker_ID VARCHAR2(15), 
Worker_name VARCHAR2(30) NOT NULL, 
Worker_phoneNumber VARCHAR2(12) NOT NULL, 
Worker_emailAddress VARCHAR2(30) NOT NULL, 
Team_name VARCHAR2(30) NOT NULL,
CONSTRAINT tlwk_wk_id_pk PRIMARY KEY (Worker_ID) );

CREATE TABLE Chat_History (
History_ID VARCHAR2(15), 
History_descriptions VARCHAR2(4000) NOT NULL, 
History_date DATE NOT NULL, 
Customer_ID VARCHAR2(15),
CONSTRAINT ch_his_id_pk PRIMARY KEY (History_ID),
CONSTRAINT ch_cus_id_fk FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID) );







CREATE TABLE Feedback (
Feedback_ID VARCHAR2(15), 
Feedback_descriptions VARCHAR2(4000) NOT NULL, 
Feedback_date DATE NOT NULL, 
Customer_ID VARCHAR2(15),
CONSTRAINT fb_fb_id_pk PRIMARY KEY (Feedback_ID),
CONSTRAINT fb_cus_id_fk FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID) );

CREATE TABLE Company (
Company_ID VARCHAR2(15), 
Company_name VARCHAR2(30) NOT NULL, 
Company_phoneNumber VARCHAR2(12) NOT NULL, 
Company_emailAddress VARCHAR2(30) NOT NULL,
CONSTRAINT com_com_id_pk PRIMARY KEY (Company_ID) );

CREATE TABLE Containing (
Package_ID VARCHAR2(15), 
Payment_ID VARCHAR2(15),
CONSTRAINT con_pack_id_pk PRIMARY KEY (Package_ID, Payment_ID),
CONSTRAINT con_pack_id_fk FOREIGN KEY (Package_ID) REFERENCES CV_Package (Package_ID),
CONSTRAINT con_pay_id_fk FOREIGN KEY (Payment_ID) REFERENCES Payment (Payment_ID) );

CREATE TABLE "Having" (
Draft_ID VARCHAR2(15),
CONSTRAINT have_draft_id_pk PRIMARY KEY (Draft_ID),
CONSTRAINT have_draft_id_fk FOREIGN KEY (Draft_ID) REFERENCES CV_Draft_Info (Draft_ID) );

CREATE TABLE Sending (
Draft_ID VARCHAR2(15), 
Worker_ID VARCHAR2(15),
CONSTRAINT send_draft_id_pk PRIMARY KEY (Draft_ID, Worker_ID),
CONSTRAINT send_draft_id_fk FOREIGN KEY (Draft_ID) REFERENCES CV_Draft_Info (Draft_ID),
CONSTRAINT send_worker_id_fk FOREIGN KEY (Worker_ID) REFERENCES Worker (Worker_ID) );

CREATE TABLE Updating (
Worker_ID VARCHAR2(15),
CONSTRAINT up_worker_id_pk PRIMARY KEY (Worker_ID),
CONSTRAINT up_worker_id_fk FOREIGN KEY (Worker_ID) REFERENCES Worker (Worker_ID) );

CREATE TABLE Generating (
Worker_ID VARCHAR2(15), 
CV_ID VARCHAR2(15),
CONSTRAINT gene_worker_id_pk PRIMARY KEY (Worker_ID, CV_ID),
CONSTRAINT gene_worker_id_fk FOREIGN KEY (Worker_ID) REFERENCES Worker (Worker_ID),
CONSTRAINT gene_cv_id_fk FOREIGN KEY (CV_ID) REFERENCES CV (CV_ID) );

CREATE TABLE Obtaining (
Company_ID VARCHAR2(15), 
CV_ID VARCHAR2(15),
CONSTRAINT obt_com_id_pk PRIMARY KEY (Company_ID, CV_ID),
CONSTRAINT obt_com_id_fk FOREIGN KEY (Company_ID) REFERENCES Company (Company_ID),
CONSTRAINT obt_cv_id_fk FOREIGN KEY (CV_ID) REFERENCES CV (CV_ID) );

CREATE TABLE CheckingFeedback (
Worker_ID VARCHAR2(15),
Feedback_ID VARCHAR2(15),
CONSTRAINT cfb_worker_id_pk PRIMARY KEY (Worker_ID, Feedback_ID),
CONSTRAINT cfb_worker_id_fk FOREIGN KEY (Worker_ID) REFERENCES Worker (Worker_ID),
CONSTRAINT cfb_fb_id_fk FOREIGN KEY (Feedback_ID) REFERENCES Feedback (Feedback_ID) );

CREATE TABLE CheckingHistory (
Worker_ID VARCHAR2(15), 
History_ID VARCHAR2(15),
CONSTRAINT ch_worker_id_pk PRIMARY KEY (Worker_ID, History_ID),
CONSTRAINT ch_worker_id_fk FOREIGN KEY (Worker_ID) REFERENCES Worker (Worker_ID),
CONSTRAINT ch_his_id_fk FOREIGN KEY (History_ID) REFERENCES Chat_History (History_ID) );

--Customer--
INSERT INTO Customer
VALUES ('C0001','John','john@gmail.com');
INSERT INTO Customer
VALUES ('C0002','David','david@gmail.com');
INSERT INTO Customer
VALUES ('C0003','Apollo','apollo@gmail.com');
INSERT INTO Customer
VALUES ('C0004','Micheal','micheal@gmail.com');
INSERT INTO Customer
VALUES ('C0005','Richard','richard@gmail.com');
INSERT INTO Customer
VALUES ('C0006','Nick','nick@gmail.com');
INSERT INTO Customer
VALUES ('C0007','Benedict','benedict@gmail.com');
INSERT INTO Customer
VALUES ('C0008','Ben','ben@gmail.com');
INSERT INTO Customer
VALUES ('C0009','Benjamin','benjamin@gmail.com');
INSERT INTO Customer
VALUES ('C0010','Zoe','zoe@gmail.com');
INSERT INTO Customer
VALUES ('C0011','Lily','lily@gmail.com');
INSERT INTO Customer
VALUES ('C0012','James','james@gmail.com');
INSERT INTO Customer
VALUES ('C0013','Tom','tom@gmail.com');
INSERT INTO Customer
VALUES ('C0014','Ali','ali@gmail.com');
INSERT INTO Customer
VALUES ('C0015','Michelle','michelle@gmail.com');
INSERT INTO Customer
VALUES ('C0016','Bella','bella@gmail.com');
INSERT INTO Customer
VALUES ('C0017','Layla','layla@gmail.com');
INSERT INTO Customer
VALUES ('C0018','Charles','charles@gmail.com');
INSERT INTO Customer
VALUES ('C0019','Lisa','lisa@gmail.com');
INSERT INTO Customer
VALUES ('C0020','Jasmine','jasmine@gmail.com');

--Phone_Number--
INSERT INTO Phone_Number VALUES ('011-1111111','C0001');
INSERT INTO Phone_Number VALUES ('011-11111112','C0001');
INSERT INTO Phone_Number VALUES ('011-1111112','C0002');
INSERT INTO Phone_Number VALUES ('011-1111113','C0003');
INSERT INTO Phone_Number VALUES ('011-1111114','C0004');
INSERT INTO Phone_Number VALUES ('011-1111115','C0005');
INSERT INTO Phone_Number VALUES ('011-1111116','C0006');
INSERT INTO Phone_Number VALUES ('011-1111117','C0007');
INSERT INTO Phone_Number VALUES ('011-1111118','C0008');
INSERT INTO Phone_Number VALUES ('011-1111119','C0009');
INSERT INTO Phone_Number VALUES ('011-1111110','C0010');
INSERT INTO Phone_Number VALUES ('011-1111011','C0011');
INSERT INTO Phone_Number VALUES ('011-1111012','C0012');
INSERT INTO Phone_Number VALUES ('011-1111013','C0013');
INSERT INTO Phone_Number VALUES ('011-1111014','C0014');
INSERT INTO Phone_Number VALUES ('011-1111015','C0015');
INSERT INTO Phone_Number VALUES ('011-1111016','C0016');
INSERT INTO Phone_Number VALUES ('011-1111017','C0017');
INSERT INTO Phone_Number VALUES ('011-1111018','C0018');
INSERT INTO Phone_Number VALUES ('011-1111019','C0019');
INSERT INTO Phone_Number VALUES ('011-1111020','C0020');

INSERT INTO CV_Package
VALUES ('P0001', 'CV Templates','2 ATS CV Templates with example. 3 Direct Email CV Templates - PPT. 3 Direct Email CV Templates - Canva.', 99.00);

INSERT INTO CV_Package
VALUES ('P0002', 'CV Writing Basic','1 Full Writing Top-Notch ATS CV. Powerful action verbs on CV. Duration 5- 10 Days', 159.00);

INSERT INTO CV_Package
VALUES ('P0003', 'CV Writing Pro','1 Full Writing Top-Notch ATS CV. Full Access Library. Duration 1-4 Days', 199.00);

INSERT INTO CV_Package
VALUES ('P0004', 'Webinar','Cover 4 Modules. Certificate of Completion. Full Access Member Area', 250.00);

INSERT INTO CV_TemplatesPackage
SELECT Package_ID, Package_name, Package_descriptions, Package_price, 3 as No_of_directEmail_CV_templates, 2 as No_of_ATS_CV_templates
FROM CV_Package
WHERE Package_name='CV Templates';

INSERT INTO CV_Writing_BasicPackage
SELECT Package_ID, Package_name, Package_descriptions, Package_price, 10 as Duration
FROM CV_Package
WHERE Package_name='CV Writing Basic';

INSERT INTO CV_Writing_ProPackage
SELECT Package_ID, Package_name, Package_descriptions, Package_price, 4 as Duration, 1 as No_of_topNotch_ATS_CV
FROM CV_Package
WHERE Package_name='CV Writing Pro';

INSERT INTO CV_WebinarPackage
SELECT Package_ID, Package_name, Package_descriptions, Package_price, 4 as No_of_modules
FROM CV_Package
WHERE Package_name='Webinar';

--Payment--
INSERT INTO Payment VALUES ('PY0001', 'M','Y');
INSERT INTO Payment VALUES ('PY0002', 'E','Y');
INSERT INTO Payment VALUES ('PY0003', 'M','N');
INSERT INTO Payment VALUES ('PY0004', 'E','Y');
INSERT INTO Payment VALUES ('PY0005', 'M','Y');
INSERT INTO Payment VALUES ('PY0006', 'E','Y');
INSERT INTO Payment VALUES ('PY0007', 'M','Y');
INSERT INTO Payment VALUES ('PY0008', 'E','Y');
INSERT INTO Payment VALUES ('PY0009', 'M','Y');
INSERT INTO Payment VALUES ('PY0010', 'E','Y');
INSERT INTO Payment VALUES ('PY0011', 'M','Y');
INSERT INTO Payment VALUES ('PY0012', 'M','Y');
INSERT INTO Payment VALUES ('PY0013', 'E','Y');
INSERT INTO Payment VALUES ('PY0014', 'M','Y');
INSERT INTO Payment VALUES ('PY0015', 'F','Y');
INSERT INTO Payment VALUES ('PY0016', 'F','Y');
INSERT INTO Payment VALUES ('PY0017', 'F','Y');
INSERT INTO Payment VALUES ('PY0018', 'F','Y');
INSERT INTO Payment VALUES ('PY0019', 'V','Y');
INSERT INTO Payment VALUES ('PY0020', 'V','Y');
INSERT INTO Payment VALUES ('PY0021', 'V','Y');

--Package_Customer--
INSERT INTO Package_Customer VALUES ('PY0001','P0001','C0001');
INSERT INTO Package_Customer VALUES ('PY0002','P0002','C0002');
INSERT INTO Package_Customer VALUES ('PY0003','P0003','C0003');
INSERT INTO Package_Customer VALUES ('PY0004','P0003','C0003');
INSERT INTO Package_Customer VALUES ('PY0005','P0004','C0004');
INSERT INTO Package_Customer VALUES ('PY0006','P0001','C0005');
INSERT INTO Package_Customer VALUES ('PY0007','P0002','C0006');
INSERT INTO Package_Customer VALUES ('PY0008','P0003','C0007');
INSERT INTO Package_Customer VALUES ('PY0009','P0004','C0008');
INSERT INTO Package_Customer VALUES ('PY0010','P0001','C0009');
INSERT INTO Package_Customer VALUES ('PY0011','P0002','C0010');
INSERT INTO Package_Customer VALUES ('PY0012','P0003','C0011');
INSERT INTO Package_Customer VALUES ('PY0013','P0004','C0012');
INSERT INTO Package_Customer VALUES ('PY0014','P0001','C0013');
INSERT INTO Package_Customer VALUES ('PY0015','P0002','C0014');
INSERT INTO Package_Customer VALUES ('PY0016','P0003','C0015');
INSERT INTO Package_Customer VALUES ('PY0017','P0004','C0016');
INSERT INTO Package_Customer VALUES ('PY0018','P0001','C0017');
INSERT INTO Package_Customer VALUES ('PY0019','P0002','C0018');
INSERT INTO Package_Customer VALUES ('PY0020','P0003','C0019');
INSERT INTO Package_Customer VALUES ('PY0021','P0004','C0020');

--CV_Draft_Info--
INSERT INTO CV_Draft_Info
VALUES ('D0001', 'Draft1.txt', SYSDATE, '011-1111001', 'Degree in Computer Science', 'Software Developer at ABC Tech, 3 years', 'Programming: Java, C++, Python - Project Management - Problem Solving', 'Best Computer Science Project Award - 2023', 'C0001');

INSERT INTO CV_Draft_Info
VALUES ('D0002', 'Draft2.txt', SYSDATE, '011-2222002', 'Diploma in Business Administration', 'Marketing Coordinator at XYZ Corp, 2 years', 'Marketing: Social Media, Campaign Management - Communication Skills - Team Collaboration', 'Outstanding Marketing Coordinator - 2022', 'C0002');

INSERT INTO CV_Draft_Info
VALUES('D0003', 'Draft3.txt', SYSDATE, '011-3333003', 'Master in Electrical Engineering', 'Electrical Engineer at Power Solutions Inc, 5 years', 'Electrical Engineering: Power Systems, Renewable Energy - Project Management - Technical Writing', 'Innovation in Renewable Energy Award - 2021', 'C0003');

INSERT INTO CV_Draft_Info
VALUES ('D0004', 'Draft4.txt', SYSDATE, '011-4444004', 'Certificate in Graphic Design', 'Graphic Designer at Creative Designs Ltd, 2 years', 'Graphic Design: Adobe Creative Suite - Typography - Visual Communication', 'Best Graphic Design Campaign - 2023', 'C0004');

INSERT INTO CV_Draft_Info
VALUES ('D0005', 'Draft5.txt', SYSDATE, '011-5555005', 'PhD in Biochemistry', 'Research Scientist at BioTech Innovations, 4 years', 'Biochemistry: Molecular Biology, Bioinformatics - Research Methodology - Data Analysis', 'Excellence in Biochemical Research - 2020', 'C0005');

INSERT INTO CV_Draft_Info
VALUES ('D0006', 'Draft6.txt', SYSDATE, '011-6666006', 'Secondary School', 'Sales Associate at RetailMart, 1 year', 'Sales: Customer Service, Product Knowledge - Communication Skills - Problem Solving', 'Top Sales Performer - 2023', 'C0006');

INSERT INTO CV_Draft_Info
VALUES ('D0007', 'Draft7.txt', SYSDATE, '011-7777007', 'Certificate in Culinary Arts', 'Sous Chef at Gourmet Delights, 3 years', 'Culinary Arts: Food Preparation, Menu Planning - Team Management - Creativity', 'Best Dish Presentation - Culinary Festival - 2022', 'C0007');

INSERT INTO CV_Draft_Info
VALUES ('D0008', 'Draft8.txt', SYSDATE, '011-8888008', 'Bachelor in Psychology', 'Human Resources Specialist at People Dynamics Inc, 4 years', 'Psychology: Employee Relations, Recruitment - Communication Skills - Conflict Resolution', 'HR Excellence Award - 2021', 'C0008');

INSERT INTO CV_Draft_Info
VALUES ('D0009', 'Draft9.txt', SYSDATE, '011-9999009', 'Diploma in Marketing', 'Marketing Manager at Global Solutions, 5 years', 'Marketing: Market Research, Campaign Planning - Leadership - Analytical Skills', 'Marketing Campaign of the Year - 2019', 'C0009');

INSERT INTO CV_Draft_Info
VALUES ('D0010', 'Draft10.txt', SYSDATE, '011-10101010', 'Master in Environmental Science', 'Environmental Consultant at EcoSolutions, 3 years', 'Environmental Science: Environmental Impact Assessment, Sustainability - Project Management - Data Analysis', 'Environmental Excellence Award - 2022', 'C0010');

INSERT INTO CV_Draft_Info
VALUES ('D0011', 'Draft11.txt', SYSDATE, '011-11111111', 'Degree in Economics', 'Financial Analyst at Finance Experts Ltd, 2 years', 'Economics: Financial Analysis, Market Trends - Data Interpretation - Risk Management', 'Outstanding Financial Analyst - 2023', 'C0011');
INSERT INTO CV_Draft_Info
VALUES ('D0012', 'Draft12.txt', SYSDATE, '011-12121212', 'Certificate in Web Development', 'Web Developer at Tech Innovators, 3 years', 'Web Development: HTML, CSS, JavaScript - User Interface Design - Problem Solving', 'Best Web Development Project - 2021', 'C0012');

INSERT INTO CV_Draft_Info
VALUES ('D0013', 'Draft13.txt', SYSDATE, '011-13131313', 'PhD in Astrophysics', 'Astrophysicist at Space Research Institute, 4 years', 'Astrophysics: Space Exploration, Data Analysis - Scientific Research - Technical Writing', 'Contributions to Space Exploration Award - 2020', 'C0013');

INSERT INTO CV_Draft_Info
VALUES ('D0014', 'Draft14.txt', SYSDATE, '011-14141414', 'Secondary School', 'Customer Service Representative at Service Solutions, 1 year', 'Customer Service: Problem Resolution, Communication Skills - Time Management', 'Customer Service Excellence Award - 2022', 'C0014');

INSERT INTO CV_Draft_Info
VALUES ('D0015', 'Draft15.txt', SYSDATE, '011-15151515', 'Bachelor in Nursing', 'Registered Nurse at City Hospital, 3 years', 'Nursing: Patient Care, Medical Knowledge - Team Collaboration - Critical Thinking', 'Nursing Excellence Award - 2021', 'C0015');

INSERT INTO CV_Draft_Info
VALUES ('D0016', 'Draft16.txt', SYSDATE, '011-16161616', 'Diploma in Fashion Design', 'Fashion Designer at Trendy Couture, 2 years', 'Fashion Design: Sketching, Textile Selection - Trend Analysis - Creativity', 'Fashion Designer of the Year - 2022', 'C0016');

INSERT INTO CV_Draft_Info
VALUES ('D0017', 'Draft17.txt', SYSDATE, '011-17171717', 'Certificate in Project Management', 'Project Manager at Project Solutions Inc, 4 years', 'Project Management: Planning, Execution - Team Leadership - Risk Management', 'Project Management Excellence Award - 2020', 'C0017');

INSERT INTO CV_Draft_Info
VALUES ('D0018', 'Draft18.txt', SYSDATE, '011-18181818', 'Master in Sociology', 'Sociologist at Social Dynamics Research, 3 years', 'Sociology: Social Research, Data Analysis - Report Writing - Community Engagement', 'Sociologist of the Year - 2021', 'C0018');

INSERT INTO CV_Draft_Info
VALUES ('D0019', 'Draft19.txt', SYSDATE, '011-19191919', 'Bachelor in Computer Engineering', 'Software Engineer at Tech Innovations, 4 years', 'Software Engineering: Coding, Testing - Software Development Life Cycle - Problem Solving', 'Software Engineer of the Year - 2022', 'C0019');

INSERT INTO CV_Draft_Info
VALUES ('D0020', 'Draft20.txt', SYSDATE, '011-20202020', 'Certificate in Digital Marketing', 'Digital Marketing Specialist at MarketingPro, 2 years', 'Digital Marketing: Social Media Marketing, SEO - Analytics - Creative Campaigns', 'Digital Marketing Excellence Award - 2023', 'C0020');

INSERT INTO CV_Generating_Status
VALUES ('S0001', 'Received');

INSERT INTO CV_Generating_Status
VALUES ('S0002', 'Processing');

INSERT INTO CV_Generating_Status
VALUES ('S0003', 'Sent');

--Draft_Customer--
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0001', 'C0001', 'S0001');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0002', 'C0002', 'S0002');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0003', 'C0003', 'S0003');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0004', 'C0004', 'S0001');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0005', 'C0005', 'S0002');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0006', 'C0006', 'S0003');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0007', 'C0007', 'S0001');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0008', 'C0008', 'S0002');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0009', 'C0009', 'S0003');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0010', 'C0010', 'S0001');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0011', 'C0011', 'S0002');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0012', 'C0012', 'S0003');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0013', 'C0013', 'S0001');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0014', 'C0014', 'S0002');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0015', 'C0015', 'S0003');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0016', 'C0016', 'S0001');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0017', 'C0017', 'S0002');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0018', 'C0018', 'S0003');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0019', 'C0019', 'S0001');
INSERT INTO Draft_Customer (Draft_ID, Customer_ID, Status_code) VALUES ('D0020', 'C0020', 'S0002');

--CV--
INSERT INTO CV VALUES ('CV0001', 'CV_0001.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0002', 'CV_0002.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0003', 'CV_0003.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0004', 'CV_0004.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0005', 'CV_0005.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0006', 'CV_0006.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0007', 'CV_0007.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0008', 'CV_0008.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0009', 'CV_0009.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0010', 'CV_0010.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0011', 'CV_0011.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0012', 'CV_0012.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0013', 'CV_0013.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0014', 'CV_0014.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0015', 'CV_0015.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0016', 'CV_0016.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0017', 'CV_0017.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0018', 'CV_0018.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0019', 'CV_0019.pdf', SYSDATE);
INSERT INTO CV VALUES ('CV0020', 'CV_0020.pdf', SYSDATE);

--Worker--
INSERT INTO Worker VALUES ('CW0001', 'John Doe', '012-1111001', 'john_doe@gmail.com');
INSERT INTO Worker VALUES ('CW0002', 'Jane Smith', '012-1111002', 'jane_smith@gmail.com');
INSERT INTO Worker VALUES ('CW0003', 'Michael Johnson', '012-1111003', 'michael_johnson@gmail.com');
INSERT INTO Worker VALUES ('CW0004', 'Emily Brown', '012-1111004', 'emily_brown@gmail.com');
INSERT INTO Worker VALUES ('CW0005', 'Daniel Wilson', '012-1111005', 'daniel_wilson@gmail.com');
INSERT INTO Worker VALUES ('CW0006', 'Olivia Davis', '012-1111006', 'olivia_davis@gmail.com');
INSERT INTO Worker VALUES ('CW0007', 'William Martinez', '012-1111007', 'william_martinez@gmail.com');
INSERT INTO Worker VALUES ('CW0008', 'Sophia Miller', '012-1111008', 'sophia_miller@gmail.com');
INSERT INTO Worker VALUES ('CW0009', 'Benjamin Anderson', '012-1111009', 'benjamin_anderson@gmail.com');
INSERT INTO Worker VALUES ('CM0010', 'Ava Taylor', '012-1111010', 'ava_taylor@gmail.com');
INSERT INTO Worker VALUES ('CM0011', 'James White', '012-1111011', 'james_white@gmail.com');
INSERT INTO Worker VALUES ('CM0012', 'Emma Harris', '012-1111012', 'emma_harris@gmail.com');
INSERT INTO Worker VALUES ('CM0013', 'Alexander Thomas', '012-1111013', 'alexander_thomas@gmail.com');
INSERT INTO Worker VALUES ('CM0014', 'Mia Garcia', '012-1111014', 'mia_garcia@gmail.com');
INSERT INTO Worker VALUES ('CM0015', 'Ethan Lopez', '012-1111015', 'ethan_lopez@gmail.com');
INSERT INTO Worker VALUES ('T0001', 'Isabella Moore', '012-1111016', 'isabella_moore@gmail.com');
INSERT INTO Worker VALUES ('T0002', 'Jackson Taylor', '012-1111017', 'jackson_taylor@gmail.com');
INSERT INTO Worker VALUES ('T0003', 'Sophie Clark', '012-1111018', 'sophie_clark@gmail.com');
INSERT INTO Worker VALUES ('TM0004', 'Logan Wright', '012-1111019', 'logan_wright@gmail.com');
INSERT INTO Worker VALUES ('TM0005', 'Grace Hall', '012-1111020', 'grace_hall@gmail.com');

INSERT INTO CV_ConsultantWorker
SELECT
    Worker_ID,
    Worker_name,
    Worker_phoneNumber,
    Worker_emailAddress,
    CASE
        WHEN Worker_ID LIKE 'CW%' THEN 'IT'
        WHEN Worker_ID LIKE 'CM%' THEN 'Marketing'
    END AS Department_name
FROM Worker
WHERE Worker_ID LIKE 'CW%' OR Worker_ID LIKE 'CM%';

INSERT INTO Team_LeaderWorker
SELECT
    Worker_ID,
    Worker_name,
    Worker_phoneNumber,
    Worker_emailAddress,
    CASE
        WHEN Worker_ID LIKE 'TM%' THEN 'Marketing'
        ELSE 'IT'
    END AS Team_name
FROM Worker
WHERE Worker_ID LIKE 'T%';

--Chat_History--
INSERT INTO Chat_History VALUES ('H0001', 'Welcome to our CV consultation service!', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0002', 'Hello there! How can we assist you today?', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0003', 'We are here to help you with your CV and job search.', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0004', 'Feel free to ask any questions or share your concerns.', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0005', 'Hi! Welcome to our CV consultation. How can we support you?', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0006', 'We can discuss your CV, job goals, and any specific requirements you have.', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0007', 'Let us know how we can make your job search more successful.', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0008', 'Hi there! Ready to enhance your CV and career prospects?', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0009', 'Feel free to share your CV or ask for advice on improving it.', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0010', 'Hello! Our team is excited to assist you with your CV and job applications.', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0011', 'Let us work together to create a standout CV for your dream job.', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0012', 'Welcome aboard! We are here to guide you in your job search journey.', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0013', 'Hi! Ready to craft a CV that showcases your skills and experience?', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0014', 'Feel free to share your career goals so we can tailor our advice accordingly.', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0015', 'Hello! Let us discuss how we can make your CV stand out in the job market.', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0016', 'Hi there! We are here to help you build a compelling CV for your job applications.', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0017', 'Welcome! Feel free to ask any questions about our CV services.', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0018', 'Hi! Ready to transform your CV into a powerful tool for job success?', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0019', 'We are excited to assist you in creating an impactful CV. How can we start?', SYSDATE, 'C0001');
INSERT INTO Chat_History VALUES ('H0020', 'Hello! Let us discuss your CV and career aspirations. We are here to help!', SYSDATE, 'C0001');

--Feedback--
INSERT INTO Feedback VALUES ('F00001', 'Service was excellent, very user-friendly platform!', SYSDATE, 'C0001');
INSERT INTO Feedback VALUES ('F00002', 'The team provided great assistance. Service is highly recommended!', SYSDATE, 'C0002');
INSERT INTO Feedback VALUES ('F00003', 'Very satisfied with the support. User interface is intuitive.', SYSDATE, 'C0003');
INSERT INTO Feedback VALUES ('F00004', 'Exceptional service! The platform is user-friendly and efficient.', SYSDATE, 'C0004');
INSERT INTO Feedback VALUES ('F00005', 'The assistance received exceeded expectations. User-friendly interface.', SYSDATE, 'C0005');
INSERT INTO Feedback VALUES ('F00006', 'Great service, very easy to navigate. Kudos to the team!', SYSDATE, 'C0006');
INSERT INTO Feedback VALUES ('F00007', 'Highly impressed with the user-friendly platform and excellent support.', SYSDATE, 'C0007');
INSERT INTO Feedback VALUES ('F00008', 'Service was excellent. The platform is intuitive and efficient.', SYSDATE, 'C0008');
INSERT INTO Feedback VALUES ('F00009', 'Very user-friendly and the support team is responsive and helpful.', SYSDATE, 'C0009');
INSERT INTO Feedback VALUES ('F00010', 'Excellent service, user-friendly interface. Highly recommended!', SYSDATE, 'C0010');
INSERT INTO Feedback VALUES ('F00011', 'The team is responsive and the platform is easy to use. Great service!', SYSDATE, 'C0011');
INSERT INTO Feedback VALUES ('F00012', 'Satisfied with the service. The platform is user-friendly and efficient.', SYSDATE, 'C0012');
INSERT INTO Feedback VALUES ('F00013', 'Great support and user-friendly platform. Very pleased with the service.', SYSDATE, 'C0013');
INSERT INTO Feedback VALUES ('F00014', 'Service was excellent. The platform is user-friendly and efficient.', SYSDATE, 'C0014');
INSERT INTO Feedback VALUES ('F00015', 'The team provided exceptional service. User-friendly interface.', SYSDATE, 'C0015');
INSERT INTO Feedback VALUES ('F00016', 'Very satisfied with the service. User-friendly platform and great support.', SYSDATE, 'C0016');
INSERT INTO Feedback VALUES ('F00017', 'Excellent support and user-friendly platform. Highly recommended!', SYSDATE, 'C0017');
INSERT INTO Feedback VALUES ('F00018', 'The team is responsive, and the platform is very user-friendly.', SYSDATE, 'C0018');
INSERT INTO Feedback VALUES ('F00019', 'Service exceeded expectations. User-friendly and efficient platform.', SYSDATE, 'C0019');
INSERT INTO Feedback VALUES ('F00020', 'Highly satisfied with the support received. The platform is user-friendly.', SYSDATE, 'C0020');

--Company--
INSERT INTO Company VALUES ('CP0001', 'ABC Corp', '014-1111001', 'abc.corp@gmail.com');
INSERT INTO Company VALUES ('CP0002', 'XYZ Ltd', '015-2222002', 'xyz.ltd@gmail.com');
INSERT INTO Company VALUES ('CP0003', 'Tech Solutions', '016-3333003', 'tech.solutions@gmail.com');
INSERT INTO Company VALUES ('CP0004', 'Innovate Inc', '017-4444004', 'innovate.inc@gmail.com');
INSERT INTO Company VALUES ('CP0005', 'Global Services', '018-5555005', 'global.services@gmail.com');
INSERT INTO Company VALUES ('CP0006', 'Smart Ventures', '019-6666006', 'smart.ventures@gmail.com');
INSERT INTO Company VALUES ('CP0007', 'Elite Innovations', '020-7777007', 'elite.innovations@gmail.com');
INSERT INTO Company VALUES ('CP0008', 'Bright Ideas Co', '021-8888008', 'bright.ideas@gmail.com');
INSERT INTO Company VALUES ('CP0009', 'Prime Tech', '022-9999009', 'prime.tech@gmail.com');
INSERT INTO Company VALUES ('CP0010', 'Pro Solutions', '023-10101010', 'pro.solutions@gmail.com');
INSERT INTO Company VALUES ('CP0011', 'TechGenius', '024-1111111', 'tech.genius@gmail.com');
INSERT INTO Company VALUES ('CP0012', 'Infinite Innovations', '025-1212121', 'infinite.innovations@gmail.com');
INSERT INTO Company VALUES ('CP0013', 'Future Tech', '026-1313131', 'future.tech@gmail.com');
INSERT INTO Company VALUES ('CP0014', 'Global Innovators', '027-1414141', 'global.innovators@gmail.com');
INSERT INTO Company VALUES ('CP0015', 'Inventive Solutions', '028-1515151', 'inventive.solutions@gmail.com');
INSERT INTO Company VALUES ('CP0016', 'Dynamic Technologies', '029-1616161', 'dynamic.technologies@gmail.com');
INSERT INTO Company VALUES ('CP0017', 'InnoSys', '030-1717171', 'innosys@gmail.com');
INSERT INTO Company VALUES ('CP0018', 'Strategic Solutions', '031-1818181', 'strategic.solutions@gmail.com');
INSERT INTO Company VALUES ('CP0019', 'TechMasters', '032-1919191', 'techmasters@gmail.com');
INSERT INTO Company VALUES ('CP0020', 'NexGen Innovations', '033-2020202', 'nexgen.innovations@gmail.com');

--Containing--
INSERT INTO Containing VALUES ('P0001','PY0001');
INSERT INTO Containing VALUES ('P0002','PY0002');
INSERT INTO Containing VALUES ('P0003','PY0003');
INSERT INTO Containing VALUES ('P0003','PY0004');
INSERT INTO Containing VALUES ('P0004','PY0005');
INSERT INTO Containing VALUES ('P0001','PY0006');
INSERT INTO Containing VALUES ('P0002','PY0007');
INSERT INTO Containing VALUES ('P0003','PY0008');
INSERT INTO Containing VALUES ('P0004','PY0009');
INSERT INTO Containing VALUES ('P0001','PY0010');
INSERT INTO Containing VALUES ('P0002','PY0011');
INSERT INTO Containing VALUES ('P0003','PY0012');
INSERT INTO Containing VALUES ('P0004','PY0013');
INSERT INTO Containing VALUES ('P0001','PY0014');
INSERT INTO Containing VALUES ('P0002','PY0015');
INSERT INTO Containing VALUES ('P0003','PY0016');
INSERT INTO Containing VALUES ('P0004','PY0017');
INSERT INTO Containing VALUES ('P0001','PY0018');
INSERT INTO Containing VALUES ('P0002','PY0019');
INSERT INTO Containing VALUES ('P0003','PY0020');
INSERT INTO Containing VALUES ('P0004','PY0021');

--Having--
INSERT INTO "Having" VALUES ('D0001');
INSERT INTO "Having" VALUES ('D0002');
INSERT INTO "Having" VALUES ('D0003');
INSERT INTO "Having" VALUES ('D0004');
INSERT INTO "Having" VALUES ('D0005');
INSERT INTO "Having" VALUES ('D0006');
INSERT INTO "Having" VALUES ('D0007');
INSERT INTO "Having" VALUES ('D0008');
INSERT INTO "Having" VALUES ('D0009');
INSERT INTO "Having" VALUES ('D0010');
INSERT INTO "Having" VALUES ('D0011');
INSERT INTO "Having" VALUES ('D0012');
INSERT INTO "Having" VALUES ('D0013');
INSERT INTO "Having" VALUES ('D0014');
INSERT INTO "Having" VALUES ('D0015');
INSERT INTO "Having" VALUES ('D0016');
INSERT INTO "Having" VALUES ('D0017');
INSERT INTO "Having" VALUES ('D0018');
INSERT INTO "Having" VALUES ('D0019');
INSERT INTO "Having" VALUES ('D0020');

--Sending–-
INSERT INTO Sending VALUES ('D0001', 'CW0001');
INSERT INTO Sending VALUES ('D0002', 'CW0002');
INSERT INTO Sending VALUES ('D0003', 'CW0003');
INSERT INTO Sending VALUES ('D0004', 'CW0004');
INSERT INTO Sending VALUES ('D0005', 'CW0005');
INSERT INTO Sending VALUES ('D0006', 'CW0006');
INSERT INTO Sending VALUES ('D0007', 'CW0007');
INSERT INTO Sending VALUES ('D0008', 'CW0008');
INSERT INTO Sending VALUES ('D0009', 'CW0009');
INSERT INTO Sending VALUES ('D0010', 'CM0010');
INSERT INTO Sending VALUES ('D0011', 'CM0011');
INSERT INTO Sending VALUES ('D0012', 'CM0012');
INSERT INTO Sending VALUES ('D0013', 'CM0013');
INSERT INTO Sending VALUES ('D0014', 'CM0014');
INSERT INTO Sending VALUES ('D0015', 'CM0015');
INSERT INTO Sending VALUES ('D0016', 'CW0001');
INSERT INTO Sending VALUES ('D0017', 'CW0002');
INSERT INTO Sending VALUES ('D0018', 'CW0003');
INSERT INTO Sending VALUES ('D0019', 'CW0004');
INSERT INTO Sending VALUES ('D0020', 'CW0005');


--Updating–-
INSERT INTO Updating VALUES ('CW0001');
INSERT INTO Updating VALUES ('CW0002');
INSERT INTO Updating VALUES ('CW0003');
INSERT INTO Updating VALUES ('CW0004');
INSERT INTO Updating VALUES ('CW0005');
INSERT INTO Updating VALUES ('CW0006');
INSERT INTO Updating VALUES ('CW0007');
INSERT INTO Updating VALUES ('CW0008');
INSERT INTO Updating VALUES ('CW0009');
INSERT INTO Updating VALUES ('CM0010');
INSERT INTO Updating VALUES ('CM0011');
INSERT INTO Updating VALUES ('CM0012');
INSERT INTO Updating VALUES ('CM0013');
INSERT INTO Updating VALUES ('CM0014');
INSERT INTO Updating VALUES ('CM0015');


--Generating–
INSERT INTO Generating VALUES ('CW0001', 'CV0001');
INSERT INTO Generating VALUES ('CW0002', 'CV0002');
INSERT INTO Generating VALUES ('CW0003', 'CV0003');
INSERT INTO Generating VALUES ('CW0004', 'CV0004');
INSERT INTO Generating VALUES ('CW0005', 'CV0005');
INSERT INTO Generating VALUES ('CW0006', 'CV0006');
INSERT INTO Generating VALUES ('CW0007', 'CV0007');
INSERT INTO Generating VALUES ('CW0008', 'CV0008');
INSERT INTO Generating VALUES ('CW0009', 'CV0009');
INSERT INTO Generating VALUES ('CM0010', 'CV0010');
INSERT INTO Generating VALUES ('CM0011', 'CV0011');
INSERT INTO Generating VALUES ('CM0012', 'CV0012');
INSERT INTO Generating VALUES ('CM0013', 'CV0013');
INSERT INTO Generating VALUES ('CM0014', 'CV0014');
INSERT INTO Generating VALUES ('CM0015', 'CV0015');
INSERT INTO Generating VALUES ('CW0001', 'CV0016');
INSERT INTO Generating VALUES ('CW0002', 'CV0017');
INSERT INTO Generating VALUES ('CW0003', 'CV0018');
INSERT INTO Generating VALUES ('CW0004', 'CV0019');
INSERT INTO Generating VALUES ('CW0005', 'CV0020');
--Obtaining–
INSERT INTO Obtaining VALUES ('CP0001', 'CV0001');
INSERT INTO Obtaining VALUES ('CP0002', 'CV0002');
INSERT INTO Obtaining VALUES ('CP0003', 'CV0003');
INSERT INTO Obtaining VALUES ('CP0004', 'CV0004');
INSERT INTO Obtaining VALUES ('CP0005', 'CV0005');
INSERT INTO Obtaining VALUES ('CP0006', 'CV0006');
INSERT INTO Obtaining VALUES ('CP0007', 'CV0007');
INSERT INTO Obtaining VALUES ('CP0008', 'CV0008');
INSERT INTO Obtaining VALUES ('CP0009', 'CV0009');
INSERT INTO Obtaining VALUES ('CP0010', 'CV0010');
INSERT INTO Obtaining VALUES ('CP0011', 'CV0011');
INSERT INTO Obtaining VALUES ('CP0012', 'CV0012');
INSERT INTO Obtaining VALUES ('CP0013', 'CV0013');
INSERT INTO Obtaining VALUES ('CP0014', 'CV0014');
INSERT INTO Obtaining VALUES ('CP0015', 'CV0015');
INSERT INTO Obtaining VALUES ('CP0016', 'CV0016');
INSERT INTO Obtaining VALUES ('CP0017', 'CV0017');
INSERT INTO Obtaining VALUES ('CP0018', 'CV0018');
INSERT INTO Obtaining VALUES ('CP0019', 'CV0019');
INSERT INTO Obtaining VALUES ('CP0020', 'CV0020');

--CheckingFeedback–
INSERT INTO CheckingFeedback VALUES ('CW0001', 'F00001');
INSERT INTO CheckingFeedback VALUES ('CW0002', 'F00002');
INSERT INTO CheckingFeedback VALUES ('CW0003', 'F00003');
INSERT INTO CheckingFeedback VALUES ('CW0004', 'F00004');
INSERT INTO CheckingFeedback VALUES ('CW0005', 'F00005');
INSERT INTO CheckingFeedback VALUES ('CW0006', 'F00006');
INSERT INTO CheckingFeedback VALUES ('CW0007', 'F00007');
INSERT INTO CheckingFeedback VALUES ('CW0008', 'F00008');
INSERT INTO CheckingFeedback VALUES ('CW0009', 'F00009');
INSERT INTO CheckingFeedback VALUES ('CM0010', 'F00010');
INSERT INTO CheckingFeedback VALUES ('CM0011', 'F00011');
INSERT INTO CheckingFeedback VALUES ('CM0012', 'F00012');
INSERT INTO CheckingFeedback VALUES ('CM0013', 'F00013');
INSERT INTO CheckingFeedback VALUES ('CM0014', 'F00014');
INSERT INTO CheckingFeedback VALUES ('CM0015', 'F00015');
INSERT INTO CheckingFeedback VALUES ('T0001', 'F00016');
INSERT INTO CheckingFeedback VALUES ('T0002', 'F00017');
INSERT INTO CheckingFeedback VALUES ('T0003', 'F00018');
INSERT INTO CheckingFeedback VALUES ('TM0004', 'F00019');
INSERT INTO CheckingFeedback VALUES ('TM0005', 'F00020');

--CheckingHistory–
INSERT INTO CheckingHistory VALUES ('CW0001', 'H0001');
INSERT INTO CheckingHistory VALUES ('CW0002', 'H0002');
INSERT INTO CheckingHistory VALUES ('CW0003', 'H0003');
INSERT INTO CheckingHistory VALUES ('CW0004', 'H0004');
INSERT INTO CheckingHistory VALUES ('CW0005', 'H0005');
INSERT INTO CheckingHistory VALUES ('CW0006', 'H0006');
INSERT INTO CheckingHistory VALUES ('CW0007', 'H0007');
INSERT INTO CheckingHistory VALUES ('CW0008', 'H0008');
INSERT INTO CheckingHistory VALUES ('CW0009', 'H0009');
INSERT INTO CheckingHistory VALUES ('CM0010', 'H0010');
INSERT INTO CheckingHistory VALUES ('CM0011', 'H0011');
INSERT INTO CheckingHistory VALUES ('CM0012', 'H0012');
INSERT INTO CheckingHistory VALUES ('CM0013', 'H0013');
INSERT INTO CheckingHistory VALUES ('CM0014', 'H0014');
INSERT INTO CheckingHistory VALUES ('CM0015', 'H0015');
INSERT INTO CheckingHistory VALUES ('T0001', 'H0016');
INSERT INTO CheckingHistory VALUES ('T0002', 'H0017');
INSERT INTO CheckingHistory VALUES ('T0003', 'H0018');
INSERT INTO CheckingHistory VALUES ('TM0004', 'H0019');
INSERT INTO CheckingHistory VALUES ('TM0005', 'H0020');

--Randome display--
SELECT 
    C.Customer_ID, 
    C.Customer_name, 
    C.Customer_emailAddress, 
    PN.Customer_phoneNumber, 
    PC.Payment_ID, 
    PC.Package_ID,
    P.Payment_type,
    P.Payment_Status
FROM 
    Customer C
JOIN 
    Phone_Number PN ON C.Customer_ID = PN.Customer_ID
JOIN 
    Package_Customer PC ON C.Customer_ID = PC.Customer_ID
JOIN 
    Payment P ON PC.Payment_ID = P.Payment_ID;

SELECT D.Draft_ID, D.Draft_dateSubmitted, DC.Status_code,G.Status_descriptions, D.Customer_ID, W.Worker_ID
FROM
	CV_Draft_Info D
JOIN
	Draft_Customer DC ON D.Draft_ID=DC.Draft_ID
JOIN
	CV_Generating_Status G ON DC.Status_code=G.Status_code
JOIN
	Sending S ON D.Draft_ID=S.Draft_ID
JOIN
	CV_ConsultantWorker W ON S.Worker_ID=W.Worker_ID;

SELECT CP.Company_ID, CP.Company_Name, C.CV_ID,C.CV_dateGenerated
FROM
	Company CP
JOIN
	Obtaining O ON CP.Company_ID=O.Company_ID
JOIN
	CV C ON C.CV_ID=O.CV_ID;
    
SELECT W.Worker_ID, W.Worker_Name, F.Feedback_ID, F.Feedback_descriptions, F.Customer_ID
FROM
	Worker W
JOIN
	CheckingFeedback CF ON W.Worker_ID=CF.Worker_ID
JOIN
	Feedback F ON CF.Feedback_ID=F.Feedback_ID;




