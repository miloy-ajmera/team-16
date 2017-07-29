CREATE TABLE child (
aadhar_id INTEGER(12) NOT NULL ,
hospital_name VARCHAR(60) NOT NULL ,
case_no VARCHAR(10)NOT NULL ,
gender CHAR NOT NULL ,
mother_tongue VARCHAR(30)  ,
education VARCHAR(20) ,
fathers_name VARCHAR(60) ,
mothers_name VARCHAR(50) ,
guardian VARCHAR(50) ,
siblings INTEGER(10) ,
illness VARCHAR(50) NOT NULL ,
notes TEXT ,
parent_consent CHAR ,
consent_by VARCHAR(8)  ,
witness VARCHAR(50) ,
photo_url varchar(512),
PRIMARY KEY (aadhar_id)
);

/*child done 
person done 
role done and inserted
person_role done
donation done

child_donor done
child_volunteer done
child_doctor done
*/

CREATE TABLE person (
aadhar_id INTEGER(12) NOT NULL ,
gender CHAR NOT NULL ,
type VARCHAR(50) NOT NULL ,
PRIMARY KEY (aadhar_id)
);

CREATE TABLE person (
aadhar_id INTEGER(12) NOT NULL ,
gender CHAR NOT NULL ,
type_doctor CHAR NOT NULL ,
type_volunteer CHAR NOT NULL ,
type_donor CHAR NOT NULL ,
PRIMARY KEY (aadhar_id)
);

CREATE TABLE role (
role_id INTEGER(10) NOT NULL ,
person VARCHAR(15) NOT NULL ,
PRIMARY KEY (role_id)
);

CREATE TABLE donation (
donation_id INTEGER(10) NOT NULL ,
aadhar_id INTEGER(12) NOT NULL references person(aadhar_id),
receipt_no INTEGER(10) NOT NULL ,
amount DECIMAL(10,2) NOT NULL ,
PRIMARY KEY (donation_id)
);

CREATE TABLE person_role (
type INTEGER(10) NOT NULL ,
aadhar_id INTEGER(12) NOT NULL references person(aadhar_id),
PRIMARY KEY (aadhar_id)
);

CREATE TABLE child_donor (
id_child_donor INTEGER NOT NULL,
aadhar_id_child INTEGER(12) NOT NULL references child(aadhar_id) ,
aadhar_id_donor INTEGER(12) NOT NULL references person(aadhar_id),
PRIMARY KEY (id_child_donor)
);

CREATE TABLE child_doctor (
id_child_doctor INTEGER NOT NULL,
aadhar_id_child INTEGER(12) NOT NULL references child(aadhar_id),
aadhar_id_person INTEGER(12) NOT NULL references person(aadhar_id),
PRIMARY KEY (id_child_doctor)
);

CREATE TABLE child_volunteer (
id_child_volunteer INTEGER NOT NULL,
aadhar_id_child INTEGER(12) NOT NULL references child(aadhar_id),
aadhar_id_person INTEGER(12) NOT NULL references volunteer(aadhar_id),
PRIMARY KEY (id_child_volunteer)
);
---------------
CREATE TABLE referral(
 referral_id INTEGER NOT NULL,
 aadhar_id_child INTEGER(12) NOT NULL references child(aadhar_id),
 aadhar_id_doctor INTEGER(12) NOT NULL references doctor(aadhar_id),
 status varchar(12) NOT NULL,
 PRIMARY KEY (referral_id)
);

/*referral done*/

CREATE TABLE wish(
 wishid INTEGER(10) NOT NULL,
 aadhar_id_child INTEGER(12) NOT NULL references child(aadhar_id),
 wish_detail text NOT NULL,
 priority INTEGER(1) NOT NULL,
 approved CHAR NOT NULL,
 approved_by VARCHAR(50) NOT NULL,
 proposed_date DATE NOT NULL,
 approved_date DATE NOT NULL,
 fulfillmentdate DATE NOT NULL,
 fulfilldby INTEGER(12) NOT NULL references person(aadhar_id) ,
 PRIMARY KEY (wishid)
);
/*WISH DONE*/

CREATE TABLE child_memories (
aadhar_id_child INTEGER(12) NOT NULL ,
aadhar_id_person INTEGER references person(aadhar_id) ,
url VARCHAR(512) ,
images_url VARCHAR(512),
PRIMARY KEY (aadhar_id_child)
);

CREATE TABLE address_directory (
aadhar_id  INTEGER(12) NOT NULL ,
permanent_add TEXT NOT NULL ,
temporary_add TEXT NOT NULL ,
PRIMARY KEY (aadhar_id)
);

