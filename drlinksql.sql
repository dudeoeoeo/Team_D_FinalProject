select * from pr 

--DROP TABLE "DL_USER" CASCADE CONSTRAINTS;
--DROP TABLE "DL_DOCTOR" CASCADE CONSTRAINTS;
--DROP SEQUENCE "dl_patient_num";


SELECT * FROM prescription a 
  JOIN dl_doctor b ON a.doctor_num = b.doctor_num 
  JOIN department c ON b.dep_num=c.dep_num 
  WHERE patient_num=2 order by a.prescription_num desc

select a.patient_num as patient_num, p_name, p_imgfile, review_num,
		review_content, review_rating, review_date from dl_user a, doc_review
		b
		where a.patient_num=b.patient_num and doctor_num=2 order by
		review_date desc

create table dl_user (      
    patient_num number(4) constraint dl_patient_num_pk primary key,
    p_id varchar2(20) not null,
    p_pwd varchar2(20) not null,
    p_name varchar2(10) not null,
    p_gender char(2) not null,
    p_jumin_num char(20) not null,
    p_phone_num char(13) not null,
    p_zipcode varchar2(50) not null,
    p_address1 varchar2(60) not null,
    p_address2  varchar2(50),
    p_email varchar2(30) not null,
    bloodtype varchar2(8) not null,
    p_imgfile varchar2(50),
    height char(10),
    weight char(10),
    allergy char(2) not null,
    p_regdate date default sysdate
);

create sequence dl_patient_num  -- ȸ����ȣ ������
increment by 1
start with 1;

insert into dl_user values (dl_patient_num.nextval, 'pati_test1', '1111', 'ȯ��1','��', '1234561234567', '01000001111','48653','����ñ�õ�����굿','', 'asd123@naver.com','O','','160','54','0',sysdate);
insert into dl_user values (dl_patient_num.nextval, 'pati_test2', '1111', 'ȯ��2','��', '1234561234567', '01000001111','52595','����ñ�õ�����굿','', 'asd123@naver.com','O','','160','54','0',sysdate);
insert into dl_user values (dl_patient_num.nextval, 'pati_test3', '1111', 'ȯ��3','��', '1234561234567', '01000001111','52553','����ñ�õ�����굿','', 'asd123@naver.com','O','','180','64','0',sysdate);


create table department (  -- �μ�
    dep_num number(3) CONSTRAINT dep_num_pk primary key,
    dep_name varchar(50)
);

insert into department values( 10, '�Ȱ�');
insert into department values( 20, '�Ǻΰ�');
insert into department values( 30, '���Űǰ����а�');

commit;

create table dl_doctor (   -- �ǻ�
    doctor_num number(4) CONSTRAINT doctor_num_pk primary key,
    d_id varchar2(20) not null,
    d_pwd varchar2(20) not null,
    d_name varchar2(15) not null,
    d_gender char(2) not null,
    d_jumin_num char(13) not null,
    d_phone_num char(13) not null,
    d_zipcode varchar2(50) not null,
    d_address1 varchar2(60) not null,
    d_address2  varchar2(50),
    d_email varchar2(30) not null,
    dep_num number,
    d_graduation varchar2(150) not null,
    d_career varchar2(200),
    d_licence varchar2(100),
    d_licence_num varchar2(20),
    d_imgfile varchar2(50),
    d_regdate date default sysdate, 
    d_content varchar2(500),
    d_field varchar2(100),
    constraint dl_doctor_dep_num_fk foreign key(dep_num)
    references department(dep_num) 
);

create sequence doctor_num  -- �ǻ� ������
increment by 1
start with 1;


Insert into DRLINK.DL_DOCTOR (DOCTOR_NUM,D_ID,D_PWD,D_NAME,D_GENDER,D_JUMIN_NUM,D_PHONE_NUM,D_ZIPCODE,D_ADDRESS1,D_ADDRESS2,D_EMAIL,DEP_NUM,D_GRADUATION,D_CAREER,D_LICENCE,D_LICENCE_NUM,D_PHOTO,D_REGDATE,D_CONTENT,D_FIELD) values (doctor_num.nextval,'doctor_test1','1111','�ǻ�1','��','1234561234567','01000001111  ','52553','����ñ�õ�����굿',null,'asd123@naver.com',20,'�����,ȣ���а�,2015,������,�����а�,2018','�����,�α���,2015,������,�α���,2018','������','1234',null,sysdate,'ȯ���� ���� �ٶ󺸴� ����','Ż��,�Ǻ� ����');
Insert into DRLINK.DL_DOCTOR (DOCTOR_NUM,D_ID,D_PWD,D_NAME,D_GENDER,D_JUMIN_NUM,D_PHONE_NUM,D_ZIPCODE,D_ADDRESS1,D_ADDRESS2,D_EMAIL,DEP_NUM,D_GRADUATION,D_CAREER,D_LICENCE,D_LICENCE_NUM,D_PHOTO,D_REGDATE,D_CONTENT,D_FIELD) values (doctor_num.nextval,'doctor_test2','1111','�ǻ�2','��','1234561234567','01000001111  ','52595','����ñ�õ�����굿',null,'asd123@naver.com',10,'�����,ȣ���а�,2015,������,�����а�,2018','�����,�α���,������,����','������','1234',null,sysdate,'�� ���� ���� �ʹ�!',null);
Insert into DRLINK.DL_DOCTOR (DOCTOR_NUM,D_ID,D_PWD,D_NAME,D_GENDER,D_JUMIN_NUM,D_PHONE_NUM,D_ZIPCODE,D_ADDRESS1,D_ADDRESS2,D_EMAIL,DEP_NUM,D_GRADUATION,D_CAREER,D_LICENCE,D_LICENCE_NUM,D_PHOTO,D_REGDATE,D_CONTENT,D_FIELD) values (doctor_num.nextval,'doctor_test3','1111','�ǻ�3','��','1234561234567','01000001111  ','48653','����ñ�õ�����굿',null,'asd123@naver.com',30,'�����,ȣ���а�,2015,������,�����а�,2018','���','������','1234',null,sysdate,null,null);

--drop table appointment cascade CONSTRAINTS;
--drop sequence appointment_num;

create table appointment(    -- ����
    appoint_num number CONSTRAINT appointment_appoint_num_pk PRIMARY KEY,
    patient_num number,
    doctor_num number,
    dep_num number,
    appointment_time varchar2(25) not null,
    appointment_date varchar2(25) not null,
    reg_time date default sysdate,
    constraint appointment_patient_num1_fk foreign key(patient_num)
    references dl_user(patient_num),
    constraint appointment_doctor_num1_fk foreign key(doctor_num)
    references dl_doctor(doctor_num),
    constraint dep_num1_fk foreign key(dep_num)
    references department(dep_num)
);
create sequence appointment_num  -- ���� ������
increment by 1
start with 1;

--      ȯ�ڹ�ȣ, �ǻ��ȣ, �μ���ȣ, '������', '����ð�',
insert into appointment values (appointment_num.nextval, 2, 2, 20, '2020-12-22','18:30', sysdate); 
insert into appointment values (appointment_num.nextval, 2, 2, 20, '2020-12-21','15:20', sysdate); 
insert into appointment values (appointment_num.nextval, 2, 2, 20, '2020-12-23','14:30', sysdate); 
insert into appointment values (appointment_num.nextval, 2, 2, 20, '2020-12-21','15:30', sysdate); 
insert into appointment values (appointment_num.nextval, 3, 2, 20, '2020-12-23','15:00', sysdate); 
insert into appointment values (appointment_num.nextval, 3, 2, 20, '2020-12-24','18:30', sysdate); 


create table treatment_record (   -- ���� ���
    treatment_num number(5) CONSTRAINT treatment_num_pk primary key,
    patient_num number,
    doctor_num number,
    dep_num number,
    appoint_num number,  -- �����ȣ fk �߰�
    start_treatment_time date default sysdate,
    monitoring_time number(5),
    
    constraint treat_patient_num_fk foreign key(patient_num)
    references dl_user(patient_num),
    constraint treat_doctor_num_fk foreign key(doctor_num)
    references dl_doctor(doctor_num),
    constraint treat_dep_num_fk foreign key(dep_num)
    references department(dep_num),
    constraint treat_appoint_num_fk foreign key(appoint_num)
    references appointment(appoint_num)
);

create sequence treatment_num  -- ���� ��� ������
increment by 1
start with 100;

insert into treatment_record values (treatment_num.nextval, 2, 2, (select dep_num from dl_doctor where doctor_num=2),2,sysdate,'30');  
insert into treatment_record values (treatment_num.nextval, 2, 2, (select dep_num from dl_doctor where doctor_num=2),2,sysdate,'30');  
insert into treatment_record values (treatment_num.nextval, 2, 2, (select dep_num from dl_doctor where doctor_num=3),3,sysdate,'30');


create table prescription (     -- ó����
    prescription_num number(4) CONSTRAINT prescription_num_pk primary key,
    patient_num number,
    doctor_num number,
    treatment_num number,
    medicine_num varchar2(20), -- REFERENCES treatment_record (start_treatment_time)
    payment_check char(2) default '0',
    dosage varchar2(20), --������
    quantity varchar2(20), --Ƚ��
    taking_date varchar2(20), --�ϼ�
    prescription_date varchar2(50),
    price number(7),
    
    constraint prescription_treatment_num_fk foreign key(treatment_num)
    references treatment_record (treatment_num),
    constraint prescription_patient_num_fk foreign key(patient_num)
    references dl_user(patient_num),
    constraint prescription_doctor_num_fk foreign key(doctor_num)
    references dl_doctor(doctor_num)
);

create sequence prescription_num  -- ó���� ������
increment by 1
start with 100;

-- 106 => treatment_num
insert into prescription(prescription_num, patient_num,doctor_num,medicine_num,payment_check,treatment_num,dosage,quantity,taking_date,prescription_date,price) 
values(prescription_num.nextval, (select patient_num from treatment_record where treatment_num = 101),
 (select doctor_num from treatment_record where treatment_num = 101),
  '19,20,21',default,101,'2,2,2','2,2,2','2,2,2', '2020�� 12�� 21��,06:01 ����' ,67000);
  
insert into prescription(prescription_num, patient_num,doctor_num,medicine_num,payment_check,treatment_num,dosage,quantity,taking_date,prescription_date,price) 
values(prescription_num.nextval, (select patient_num from treatment_record where treatment_num = 102),
 (select doctor_num from treatment_record where treatment_num = 102),
  '19,20,21',default,102,'2,2,2','2,2,2','2,2,2', '2020�� 12�� 21��,06:01 ����' ,85000);
  
  
   insert into prescription (prescription_num, patient_num,doctor_num,medicine_num,payment_check,treatment_num,dosage,quantity,taking_date,prescription_date) 
   values (prescription_num.nextval, (select patient_num from treatment_record where treatment_num = 102),
   (select doctor_num from treatment_record where treatment_num = 102),
   '2,3,4',default,102,'2,3,4','2,3,4','2,3,4','2020�� 12�� 20��,07:12 ����');



create table medicine (  -- �� ����
    medicine_num varchar2(100) constraint medicine_num_pk primary key,
    medicine_name varchar2(100) not null,
    medicine_detail varchar2(1000) not null,
    medicine_taking varchar2(1000) not null,
    medicine_warning varchar2(1000) not null,
    CONSTRAINT UK_INFO UNIQUE(medicine_name)
);

create sequence medicine_num  -- �� ��ȣ ������
increment by 1
start with 1;

INSERT INTO MEDICINE (medicine_num, MEDICINE_NAME, MEDICINE_DETAIL, MEDICINE_TAKING, MEDICINE_WARNING) VALUES (medicine_num.nextval,'��ũ���÷�(����Ŭ�ζ�)_(9.5g/95mL)','���� Ȥ�� ��Ȳ���� ������ �÷���','����Ŭ�ζ��μ� 0.5 �� 1 g�� ��ħ 15 �� 30�� �� �Ǵ� ���� 30�� ���� �汸�����Ѵ�.','"������ �Ƴ��ʶ��ý� ����');

INSERT INTO MEDICINE (medicine_num, MEDICINE_NAME, MEDICINE_DETAIL, MEDICINE_TAKING, MEDICINE_WARNING) VALUES (medicine_num.nextval,'��ũ���÷�(����Ŭ�ζ�)_(1g/10mL)','���� Ȥ�� ��Ȳ���� ������ �÷���','����Ŭ�ζ��μ� 0.5 �� 1 g�� ��ħ 15 �� 30�� �� �Ǵ� ���� 30�� ���� �汸�����Ѵ�.','"������ �Ƴ��ʶ��ý� ����');


INSERT INTO MEDICINE (medicine_num, MEDICINE_NAME, MEDICINE_DETAIL, MEDICINE_TAKING, MEDICINE_WARNING) VALUES (medicine_num.nextval,'��ũ���÷�(����Ŭ�ζ�)_(0.5g/5mL)','���� Ȥ�� ��Ȳ���� ������ �÷���','����Ŭ�ζ��μ� 0.5 �� 1 g�� ��ħ 15 �� 30�� �� �Ǵ� ���� 30�� ���� �汸�����Ѵ�.','"������ �Ƴ��ʶ��ý� ����');

INSERT INTO MEDICINE (medicine_num, MEDICINE_NAME, MEDICINE_DETAIL, MEDICINE_TAKING, MEDICINE_WARNING) VALUES (medicine_num.nextval,'������3�и��׷�(�����ɿ��꿰)_(3.39mg/1��)','����� Ÿ���� ����','�� ���� ����뷮�� 1�� 1ȸ 6mg�̸�, ȯ���� ��� �ǻ��� ó�濡 ���� 1�� 1ȸ 3mg�� ������ �� �ִ�.','"�ڻ� ���� �� ������� ��ȭ');



insert into medicine values(medicine_num.nextval,'��Ƽ�÷����Ⱦ�(��Ƽ�÷ϻ�ż�ȭ��)','������ �������� �ִ� ������ ������ ���� ���ռ� �ḷ��, ���Ǽ���, ������(�����˾� ����)�� ġ��, �Ȱ������� ����ȭ���

�����󱸱ռ�, ����󱸱ռ�, ��ű���, �屸�ռ�, �ڸ��׹��׸����, �������(����ϸ��)-īŸ������, ��Ʈ�ι���-�����, ũ���ÿ���-����Ͼƿ�, ����ġ�Ƽ�, �𸣰��ڶ�-�𸣰���, ���÷翣�ڱ�, �����𳪽���, ����, ���ΰ�𳪽�-�Ŀ�ġ�������, ���׳�Ʈ�����𳪽�(ũ����𳪽�)-�����ʸ���, �ƽó�����ͼ�, ��ũ�ױ�','���ռ� �ḷ��, ���Ǽ���, ������(�����˾� ����) : ��� 1ȸ 1��� 1�� 3ȸ ���� (������ ����)�Ѵ�.',' �� ���� ���ȿ� �̿��� �������� ����� �� ������, �ḷ�Ϸ� �ֻ��ϰų�, �ȱ��� ����(anterior chamber)�� ���� �������� ���ƾ� �Ѵ�.');

insert into medicine values(medicine_num.nextval,'�ֹ��÷�����(���˿�л곪Ʈ��)','���Ʒ��� �������� ���� ������(�����ʵ�ø��� �ý����� �Ϻκ�)�ӿ� ����ִ� ���������� �������� �ִ� ��',' ������ ���������� ����뷮�� �����ϰ� �����ϱ� ���� �� ���� ����õ�ڸ� ���� �����Ѵ�.',' �� �� ���� �� �ܹ����� �๰�� �������� ������ �ִ� ȯ��');
insert into medicine values(medicine_num.nextval,'��������ũ��','����� ũ����',' 1�� 1��3ȸ ȯ�ο� ���緮�� �ٸ���.','1. ������ ���� ����� �� ���� ������� �� ��.

1) ����(����, �ŵ� ��)������(ĭ�����, �鼱 ��)�����Ƿ���Ÿ�Ӥ�ȿ������̷���(�������, �ܼ�����, ����, ������ ��)������(��, ������ ��)�� �Ǻΰ����� ȯ��(������ ��ȭ�� �� �ִ�)

2) �� �� �Ǵ� �� �� ���п� ������ �� �� ������ �ִ� ȯ��

3) ��õ���� �ִ� ������ ���̵��� ȯ��(õ�������� ġ�������� ��Ÿ�� �� �ִ�.)

4) �˾�(��üƮ�� ����), ��2�� ���缺 �̻��� ȭ������� ȯ��(�Ǻ������ �����Ǿ� ġ���� ������ �� �ִ�)

5) �������Ǻο�, ���뿩�帧, �ֻ�(rosacea) ȯ��

6) ��Ʈ���丶�̽�, ī�����̽�, ��Ÿ���̽�, �׿����̽� �� �ƹ̳�۸��ڻ��̵�� �׻����� �Ǵ� �ٽ�Ʈ��ſ� ���� ������ �� �� ������ �ִ� ȯ�� (�ƹ̳�۸��ڻ��̵�� �׻��������̿��� ���� �˷��������߼��� �����Ǿ���)');



-------------------------------------------------------
-- �̼��л����� ������ ���̺� 

create table payment_record (   -- ��������
    pay_num number(4) constraint payment_record_num primary key,
    patient_num number,
    doctor_num number,
    dep_num number,
    prescription_num number,
    paydate date default sysdate,
    price number(7) not null,
    payment_way varchar2(10) not null,
    constraint patient_num_fk foreign key(patient_num)
    references dl_user(patient_num),
    constraint doctor_num_fk foreign key(doctor_num)
    references dl_doctor(doctor_num),
    constraint dep_num_fk foreign key(dep_num)
    references department(dep_num),
    constraint payment_record_fk foreign key(prescription_num)
    references prescription(prescription_num)
);



create table hospital_board (   -- �������� �Խ���
    hospital_board_num number(4) CONSTRAINT hospital_num_pk primary key,
    hospital_photo varchar2(60),
    hospital_title varchar2(100),
    hospital_content varchar2(500),
    hospital_regdate date default sysdate,
    h_watched number(4)
);

create sequence hospital_board_num  -- �����Խ��� ������
increment by 1
start with 1;

create table hospital_repl (   -- �������� ���
    hospital_board_num number(4),
    hospital_repl_num number(4) CONSTRAINT news_num_pk primary key,
    patient_num number,
    doctor_num number,
    hospital_reply_comment varchar2(100),
    h_repl_date date default sysdate,
    constraint hospitalrepl_board_num_fk foreign key(hospital_board_num)
    references hospital_board(hospital_board_num),
    constraint hospitalrepl_patient_num_fk foreign key(patient_num)
    references dl_user(patient_num),
    constraint hospitalrepl_doctor_num_fk foreign key(doctor_num)
    references dl_doctor(doctor_num)
);

create table faq_board (   -- FAQ �Խ���
    faq_board_num number(4) CONSTRAINT faq_num_pk primary key,
    faq_title varchar2(60),
    faq_content varchar2(500),
    faq_regdate date default sysdate
);

create sequence faq_board_num  -- FAQ �Խ���  ������
increment by 1
start with 1;


create table news_board (   -- �ǰ����� �Խ���
    news_board_num number(4) CONSTRAINT news_num_pk primary key,
    news_url varchar2(60),
    news_photo varchar2(60),
    news_title varchar2(70),
    news_content varchar2(4000),
    news_regdate date default sysdate,
    watched number(4)
);

create sequence news_board_num  -- �ǰ����� ������
increment by 1
start with 1;

create table news_repl (   -- �ǰ����� ���
    news_board_num number(4),
    news_reply_num number(4) CONSTRAINT news_repl_pk primary key,
    patient_num number,
    doctor_num number,
    news_repl_comment varchar2(150),
    n_repl_date date default sysdate,
    n_comments_num number(4),
    

    constraint news_repl_board_num_fk foreign key(news_board_num)
    references news_board(news_board_num),
    
    constraint news_repl_patient_num_fk foreign key(patient_num)
    references dl_user(patient_num),
    
    constraint news_repl_doctor_num_fk foreign key(doctor_num)
    references dl_doctor(doctor_num)
);

create sequence news_board_repl_num  -- �ǰ����� ��� ������
increment by 1
start with 1;


create table ai_record (   -- ai ���� ���
    patient_num number,
    doctor_num number,
    dep_num number,
    ai_symptom varchar(20) not null,
    use_time date default sysdate, 
    symptom_photo varchar2(50) not null,
    constraint ai_record_patient_num_fk foreign key(patient_num)
    references dl_user(patient_num),
    constraint ai_record_doctor_num_fk foreign key(doctor_num)
    references dl_doctor(doctor_num),
    constraint ai_record_dep_num_fk foreign key(dep_num)
    references department(dep_num)
);


create table favorite_doctor (   -- ���� �ǻ�
    patient_num number,
    doctor_num number,
    ai_symptom varchar(20) not null,
    favorite_date date default sysdate, 
    constraint favorite_patient_num_fk foreign key(patient_num)
    references dl_user(patient_num),
    constraint favorite_doctor_num_fk foreign key(doctor_num)
    references dl_doctor(doctor_num)
);


create table treat_repl (   -- �����ı� ���
    treat_repl_num number(4) CONSTRAINT treat_num_pk primary key,
    treat_repl_comment varchar2(100) not null,
    treat_repl_regdate date default sysdate,
    treat_star number(1) not null,
    patient_num number,
    doctor_num number,
    constraint treat_repl_patient_num_fk foreign key(patient_num)
    references dl_user(patient_num),
    constraint treat_repl_doctor_num_fk foreign key(doctor_num)
    references dl_doctor(doctor_num)
);

create sequence treat_repl_num  -- �����ı� ��� ������
increment by 1
start with 1;

create table doc_review(    -- �����ı� ���� ���ƿ� �Ⱦ�� ��
   review_num number primary key,
   doctor_num number,
   patient_num number,
   review_content varchar2(500),
   review_rating number,
   review_date date default sysdate
);


create sequence doc_review_seq
increment by 1
start with 1;

create table chat_room (  -- ä�ù� ��ȣ
    room_num number(4) CONSTRAINT room_num_pk primary key
);

create table chat_msg (   -- ä�ø޼���
    msg_num number(4) CONSTRAINT msg_num_pk primary key,
    msg varchar2(100),
    msg_time date default sysdate,
    doctor_num number,
    chat_room_num number,
    constraint chat_msg_chat_room_num_fk foreign key(chat_room_num)
    references chat_room(room_num),
    constraint chat_msg_doctor_num_fk foreign key(doctor_num)
    references dl_doctor(doctor_num)
);



create table chat_room_join (  -- ������ ä�ù� ��ȣ
    join_room_num number,
    doctor_num number,
    constraint join_room_num_fk foreign key(join_room_num)
    references chat_room(room_num),
    constraint room_join_doctor_num_fk foreign key(doctor_num)
    references dl_doctor(doctor_num)
);




select *
	from 
		prescription p join treatment_record t on p.treatment_num=t.treatment_num
        join dl_user u on p.patient_num = u.patient_num
        join dl_doctor d on p.doctor_num = d.doctor_num 
	where 
		p.patient_num=2 and p.prescription_num=101;
        
        
        SELECT * FROM prescription a 
  JOIN dl_doctor b ON a.doctor_num = b.doctor_num 
  JOIN department c ON b.dep_num=c.dep_num 
  WHERE patient_num=2 order by a.prescription_num desc;