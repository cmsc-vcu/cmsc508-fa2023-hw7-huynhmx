# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET AUTOCOMMIT=1;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;

# ... 
SET FOREIGN_KEY_CHECKS=1;


# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!



drop table if exists skills;
CREATE TABLE skills (
    id int NOT NULL, 
    name varchar(255) NOT NULL,
    description varchar(300) NOT NULL DEFAULT '(default description)',
    tag varchar(255) NOT NULL,
    primary key(id)
);





# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!


insert into skills (id, name, description, tag) values 
    (1, 'Python Programming', 'Python is a general-purpose programming language that is used for a wide variety of applications, including web development, data science, and machine learning.', 'Skill 1'),
    (2, 'SQL', 'SQL (Structured Query Language) is a programming language that is used to communicate with and manipulate data in databases.', 'Skill 2'),
    (3, 'Machine Learning', 'Machine learning is a field of computer science that gives computers the ability to learn without being explicitly programmed.', 'Skill 3'),
    (4, 'Cloud Computing', 'Cloud computing is the delivery of computing services—including servers, storage, databases, networking, software, analytics, intelligence, and the Internet of Things (IoT)—over the Internet ("the cloud") to offer faster innovation, flexible resources, and economies of scale.', 'Skill 4'),
    (5, 'Leadership', 'Leadership is the ability to inspire and motivate others to achieve a common goal.', 'Skill 5'),
    (6, 'Communication', 'Communication is the process of exchanging information and ideas with others. It is an essential skill for success in both personal and professional life.', 'Skill 6'),
    (7, 'Data Analysis', 'Data analysis involves inspecting, cleaning, and modeling data to discover useful information, draw conclusions, and support decision-making.', 'Skill 7'),
    (8, 'Web Development', 'Web development is the process of building and maintaining websites. It includes aspects such as web design, content creation, and client-side/server-side scripting.', 'Skill 8');


select * from skills;

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

drop table if exists people;
CREATE TABLE people (
    people_id int,
    first_name varchar(256) NOT NULL,
    people_last_name varchar(256) NOT NULL,
    email varchar(256) NOT NULL,
    linkedin_url varchar(256) NOT NULL,
    headshot_url varchar(256) NOT NULL,
    discord_handle varchar(256) NOT NULL,
    brief_bio varchar(256) NOT NULL,
    date_joined date,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id, first_name, people_last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) values
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', 'https://linkedin.com/in/alice-johnson', 'https://example.com/headshots/alice-johnson.jpg', 'alice-johnson#1234', 'Alice Johnson is a CS student at Stanford University. She is interested in pursuing a career in software engineering.', '2023-08-04'),
(2, 'Bob', 'Williams', 'bob.williams@example.com', 'https://linkedin.com/in/bob-williams', 'https://example.com/headshots/bob-williams.jpg', 'bob-williams#1234', 'Bob Williams is a CS student at Harvard University. He is interested in pursuing a career in machine learning.', '2023-07-25'),
(3, 'Carol', 'Garcia', 'carol.garcia@example.com', 'https://linkedin.com/in/carol-garcia', 'https://example.com/headshots/carol-garcia.jpg', 'carol-garcia#1234', 'Carol Garcia is a CS student at MIT. She is interested in pursuing a career in cybersecurity.', '2023-06-16'),
(4, 'David', 'Miller', 'david.miller@example.com', 'https://linkedin.com/in/david-miller', 'https://example.com/headshots/david-miller.jpg', 'david-miller#1234', 'David Miller is a CS student at Caltech. He is interested in pursuing a career in computer graphics.', '2023-05-27'),
(5, 'Emily', 'Davis', 'emily.davis@example.com', 'https://linkedin.com/in/emily-davis', 'https://example.com/headshots/emily-davis.jpg', 'emily-davis#1234', 'Emily Davis is a CS student at Yale University. She is interested in pursuing a career in data science.', '2023-04-18'),
(6, 'Frank', 'Brown', 'frank.brown@example.com', 'https://linkedin.com/in/frank-brown', 'https://example.com/headshots/frank-brown.jpg', 'frank-brown#1234', 'Frank Brown is a CS student at Princeton University. He is interested in pursuing a career in artificial intelligence.', '2023-03-29');


select * from people;

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

drop table if exists peopleskills;
create table peopleskills (
    id int auto_increment,
    skills_id int,
    people_id int,
    date_acquired date default (current_date),
    primary key (id),
    foreign key (skills_id) references skills (id) on delete cascade,
    foreign key (people_id) references people (people_id),
    unique (skills_id, people_id)
   
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

insert into peopleskills (people_id, skills_id) values
    (1, 1),
    (1, 3),
    (1, 6),
    (2, 3),
    (2, 4),
    (2, 5),
    (3, 1),
    (3, 5),
    (5, 3),
    (5, 6),
    (6, 2),
    (6, 3),
    (6, 4);

 
insert into peopleskills (people_id, skills_id) values
(6,1);

select * from peopleskills;
select count(*) from peopleskills;





# delete from skills where id=3;

SELECT
   name,
   tag
    from 
    skills a
    left join peopleskills b on (a.id=b.skills_id)
    WHERE
    skills_id is NULL
    ;



    

    SELECT
    name,
    count(*)
from
    peopleskills a
    inner join people b on (a.people_id=b.people_id)
    inner join skills c on(a.skills_id=c.id)
    GROUP BY
    name
    ;


SELECT
    people_last_name,
    name,
    tag
from
    peopleskills a
inner join people b on(a.people_id=b.people_id)
inner join skills c on(a.skills_id=c.id)
WHERE
    people_last_name='Johnson'
    ORDER BY
    name,
    people_last_name
    ;


SELECT
    c.role_id,
    c.name AS role_name
from
    roles c left join peopleroles b ON c.role_id = b.role_id
WHERE
    b.role_id IS NULL;



SELECT
    a.first_name,
    a.people_last_name,
    c.name AS role_name,
    s.name AS skill_name
FROM
    people a
    inner join peopleroles b ON a.people_id = b.people_id
    inner join roles c ON b.role_id = c.role_id
    left join peopleskills d ON a.people_id = d.people_id
    left join skills s ON d.skills_id = s.id
WHERE
    c.name = 'Boss'
ORDER BY
    a.people_last_name, s.name;




# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

drop table if exists roles;
create table roles( 
    role_id int auto_increment, 
    name varchar(255) NOT NULL,
    sort_priority int,
    primary key(role_id)
   );



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles(name, sort_priority) values 
 ('Designer', 10),
 ('Developer', 20),
 ('Recruit', 30),
 ('Team Lead', 40),
 ('Boss', 50),
 ('Mentor', 60);


 select * from roles; 



# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

drop table if exists peopleroles;
create table peopleroles( 
    id int auto_increment NOT NULL,  
    role_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date default (current_date) NOT NULL,
    foreign key(role_id) references roles(role_id) on delete cascade,  
    foreign key(people_id) references people(people_id),
    primary key(id));


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles(people_id, role_id) values
   (1, 1),
   (2, 5),
   (2, 6),
   (3, 2),
   (3, 4),
   (4, 3),
   (5, 3),
   (6, 2),
   (6, 1);

   SELECT * from peopleroles;