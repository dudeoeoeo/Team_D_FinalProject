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

create sequence dl_patient_num  -- 회원번호 시퀀스
increment by 1
start with 1;

insert into dl_user values (dl_patient_num.nextval, 'pati_test1', '1111', '환자1','남', '1234561234567', '01000001111','48653','서울시금천구가산동','', 'asd123@naver.com','O','','160','54','0',sysdate);
insert into dl_user values (dl_patient_num.nextval, 'pati_test2', '1111', '환자2','여', '1234561234567', '01000001111','52595','서울시금천구가산동','', 'asd123@naver.com','O','','160','54','0',sysdate);
insert into dl_user values (dl_patient_num.nextval, 'pati_test3', '1111', '환자3','남', '1234561234567', '01000001111','52553','서울시금천구가산동','', 'asd123@naver.com','O','','180','64','0',sysdate);


create table department (  -- 부서
    dep_num number(3) CONSTRAINT dep_num_pk primary key,
    dep_name varchar(50)
);

insert into department values( 10, '안과');
insert into department values( 20, '피부과');
insert into department values( 30, '정신건강의학과');

commit;

create table dl_doctor (   -- 의사
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

create sequence doctor_num  -- 의사 시퀀스
increment by 1
start with 1;


Insert into DRLINK.DL_DOCTOR (DOCTOR_NUM,D_ID,D_PWD,D_NAME,D_GENDER,D_JUMIN_NUM,D_PHONE_NUM,D_ZIPCODE,D_ADDRESS1,D_ADDRESS2,D_EMAIL,DEP_NUM,D_GRADUATION,D_CAREER,D_LICENCE,D_LICENCE_NUM,D_PHOTO,D_REGDATE,D_CONTENT,D_FIELD) values (doctor_num.nextval,'doctor_test1','1111','의사1','남','1234561234567','01000001111  ','52553','서울시금천구가산동',null,'asd123@naver.com',20,'서울대,호빵학과,2015,연세대,피자학과,2018','서울대,부교수,2015,연세대,부교수,2018','전공의','1234',null,sysdate,'환자의 편에서 바라보는 진료','탈모,피부 종양');
Insert into DRLINK.DL_DOCTOR (DOCTOR_NUM,D_ID,D_PWD,D_NAME,D_GENDER,D_JUMIN_NUM,D_PHONE_NUM,D_ZIPCODE,D_ADDRESS1,D_ADDRESS2,D_EMAIL,DEP_NUM,D_GRADUATION,D_CAREER,D_LICENCE,D_LICENCE_NUM,D_PHOTO,D_REGDATE,D_CONTENT,D_FIELD) values (doctor_num.nextval,'doctor_test2','1111','의사2','여','1234561234567','01000001111  ','52595','서울시금천구가산동',null,'asd123@naver.com',10,'서울대,호빵학과,2015,연세대,피자학과,2018','고려대,부교수,세종대,교수','전공의','1234',null,sysdate,'돈 많이 벌고 싶다!',null);
Insert into DRLINK.DL_DOCTOR (DOCTOR_NUM,D_ID,D_PWD,D_NAME,D_GENDER,D_JUMIN_NUM,D_PHONE_NUM,D_ZIPCODE,D_ADDRESS1,D_ADDRESS2,D_EMAIL,DEP_NUM,D_GRADUATION,D_CAREER,D_LICENCE,D_LICENCE_NUM,D_PHOTO,D_REGDATE,D_CONTENT,D_FIELD) values (doctor_num.nextval,'doctor_test3','1111','의사3','여','1234561234567','01000001111  ','48653','서울시금천구가산동',null,'asd123@naver.com',30,'서울대,호빵학과,2015,연세대,피자학과,2018','경력','전공의','1234',null,sysdate,null,null);

--drop table appointment cascade CONSTRAINTS;
--drop sequence appointment_num;

create table appointment(    -- 예약
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
create sequence appointment_num  -- 예약 시퀀스
increment by 1
start with 1;

--      환자번호, 의사번호, 부서번호, '예약일', '예약시간',
insert into appointment values (appointment_num.nextval, 2, 2, 20, '2020-12-22','18:30', sysdate); 
insert into appointment values (appointment_num.nextval, 2, 2, 20, '2020-12-21','15:20', sysdate); 
insert into appointment values (appointment_num.nextval, 2, 2, 20, '2020-12-23','14:30', sysdate); 
insert into appointment values (appointment_num.nextval, 2, 2, 20, '2020-12-21','15:30', sysdate); 
insert into appointment values (appointment_num.nextval, 3, 2, 20, '2020-12-23','15:00', sysdate); 
insert into appointment values (appointment_num.nextval, 3, 2, 20, '2020-12-24','18:30', sysdate); 


create table treatment_record (   -- 진료 기록
    treatment_num number(5) CONSTRAINT treatment_num_pk primary key,
    patient_num number,
    doctor_num number,
    dep_num number,
    appoint_num number,  -- 예약번호 fk 추가
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

create sequence treatment_num  -- 진료 기록 시퀀스
increment by 1
start with 100;

insert into treatment_record values (treatment_num.nextval, 2, 2, (select dep_num from dl_doctor where doctor_num=2),2,sysdate,'30');  
insert into treatment_record values (treatment_num.nextval, 2, 2, (select dep_num from dl_doctor where doctor_num=2),2,sysdate,'30');  
insert into treatment_record values (treatment_num.nextval, 2, 2, (select dep_num from dl_doctor where doctor_num=3),3,sysdate,'30');


create table prescription (     -- 처방전
    prescription_num number(4) CONSTRAINT prescription_num_pk primary key,
    patient_num number,
    doctor_num number,
    treatment_num number,
    medicine_num varchar2(20), -- REFERENCES treatment_record (start_treatment_time)
    payment_check char(2) default '0',
    dosage varchar2(20), --투여량
    quantity varchar2(20), --횟수
    taking_date varchar2(20), --일수
    prescription_date varchar2(50),
    price number(7),
    
    constraint prescription_treatment_num_fk foreign key(treatment_num)
    references treatment_record (treatment_num),
    constraint prescription_patient_num_fk foreign key(patient_num)
    references dl_user(patient_num),
    constraint prescription_doctor_num_fk foreign key(doctor_num)
    references dl_doctor(doctor_num)
);

create sequence prescription_num  -- 처방전 시퀀스
increment by 1
start with 100;

-- 106 => treatment_num
insert into prescription(prescription_num, patient_num,doctor_num,medicine_num,payment_check,treatment_num,dosage,quantity,taking_date,prescription_date,price) 
values(prescription_num.nextval, (select patient_num from treatment_record where treatment_num = 101),
 (select doctor_num from treatment_record where treatment_num = 101),
  '19,20,21',default,101,'2,2,2','2,2,2','2,2,2', '2020년 12일 21일,06:01 오후' ,67000);
  
insert into prescription(prescription_num, patient_num,doctor_num,medicine_num,payment_check,treatment_num,dosage,quantity,taking_date,prescription_date,price) 
values(prescription_num.nextval, (select patient_num from treatment_record where treatment_num = 102),
 (select doctor_num from treatment_record where treatment_num = 102),
  '19,20,21',default,102,'2,2,2','2,2,2','2,2,2', '2020년 12일 21일,06:01 오후' ,85000);
  
  
   insert into prescription (prescription_num, patient_num,doctor_num,medicine_num,payment_check,treatment_num,dosage,quantity,taking_date,prescription_date) 
   values (prescription_num.nextval, (select patient_num from treatment_record where treatment_num = 102),
   (select doctor_num from treatment_record where treatment_num = 102),
   '2,3,4',default,102,'2,3,4','2,3,4','2,3,4','2020년 12월 20일,07:12 오후');



create table medicine (  -- 약 정보
    medicine_num varchar2(100) constraint medicine_num_pk primary key,
    medicine_name varchar2(100) not null,
    medicine_detail varchar2(1000) not null,
    medicine_taking varchar2(1000) not null,
    medicine_warning varchar2(1000) not null,
    CONSTRAINT UK_INFO UNIQUE(medicine_name)
);

create sequence medicine_num  -- 약 번호 시퀀스
increment by 1
start with 1;

INSERT INTO MEDICINE (medicine_num, MEDICINE_NAME, MEDICINE_DETAIL, MEDICINE_TAKING, MEDICINE_WARNING) VALUES (medicine_num.nextval,'포크랄시럽(포수클로랄)_(9.5g/95mL)','무색 혹은 미황색의 투명한 시럽제','포수클로랄로서 0.5 ∼ 1 g을 취침 15 ∼ 30분 전 또는 수술 30분 전에 경구투여한다.','"중증의 아나필락시스 반응');

INSERT INTO MEDICINE (medicine_num, MEDICINE_NAME, MEDICINE_DETAIL, MEDICINE_TAKING, MEDICINE_WARNING) VALUES (medicine_num.nextval,'포크랄시럽(포수클로랄)_(1g/10mL)','무색 혹은 미황색의 투명한 시럽제','포수클로랄로서 0.5 ∼ 1 g을 취침 15 ∼ 30분 전 또는 수술 30분 전에 경구투여한다.','"중증의 아나필락시스 반응');


INSERT INTO MEDICINE (medicine_num, MEDICINE_NAME, MEDICINE_DETAIL, MEDICINE_TAKING, MEDICINE_WARNING) VALUES (medicine_num.nextval,'포크랄시럽(포수클로랄)_(0.5g/5mL)','무색 혹은 미황색의 투명한 시럽제','포수클로랄로서 0.5 ∼ 1 g을 취침 15 ∼ 30분 전 또는 수술 30분 전에 경구투여한다.','"중증의 아나필락시스 반응');

INSERT INTO MEDICINE (medicine_num, MEDICINE_NAME, MEDICINE_DETAIL, MEDICINE_TAKING, MEDICINE_WARNING) VALUES (medicine_num.nextval,'독세정3밀리그램(독세핀염산염)_(3.39mg/1정)','흰색의 타원형 정제','이 약의 권장용량은 1일 1회 6mg이며, 환자의 경우 의사의 처방에 따라 1일 1회 3mg이 적절할 수 있다.','"자살 위험 및 우울증의 악화');



insert into medicine values(medicine_num.nextval,'가티플로점안액(가티플록사신수화물)','본제에 감수성이 있는 다음의 균종에 의한 세균성 결막염, 검판선염, 각막염(각막궤양 포함)의 치료, 안과수술시 무균화요법

포도상구균속, 연쇄상구균속, 폐렴구균, 장구균속, 코리네박테리움속, 모락셀라(브란하멜라)-카타랄리스, 시트로박터-프룬디, 크렙시엘라-뉴모니아에, 세라치아속, 모르가넬라-모르가니, 인플루엔자균, 슈도모나스속, 녹농균, 스핑고모나스-파우치모빌리스, 스테노트로포모나스(크산토모나스)-말토필리아, 아시네토박터속, 아크네균','세균성 결막염, 검판선염, 각막염(각막궤양 포함) : 통상 1회 1방울 1일 3회 점안 (적절히 증감)한다.',' 이 약은 점안용 이외의 목적으로 사용할 수 없으며, 결막하로 주사하거나, 안구의 전방(anterior chamber)에 직접 주입하지 말아야 한다.');

insert into medicine values(medicine_num.nextval,'겔백플러스주(히알우론산나트륨)','위아래가 고무마개로 막힌 유리관(프리필드시린지 시스템의 일부분)속에 들어있는 무색투명한 점조성이 있는 액',' 섬유주 절제술동안 전방용량을 보충하고 유지하기 위해 이 약을 각막천자를 통해 주입한다.',' 이 약 성분 및 단백질계 약물에 과민증의 병력이 있는 환자');
insert into medicine values(medicine_num.nextval,'겐지스톤크림','흰색의 크림제',' 1일 1～3회 환부에 적당량을 바른다.','1. 다음과 같은 사람은 이 약을 사용하지 말 것.

1) 세균(결핵, 매독 등)ㆍ진균(칸디다증, 백선 등)ㆍ스피로헤타속ㆍ효모ㆍ바이러스(대상포진, 단순포진, 수두, 종두증 등)ㆍ동물(옴, 사면발이 등)성 피부감염증 환자(증상이 악화될 수 있다)

2) 이 약 또는 이 약 성분에 과민증 및 그 병력이 있는 환자

3) 고막천공이 있는 습진성 외이도염 환자(천공부위의 치유지연이 나타날 수 있다.)

4) 궤양(베체트병 제외), 제2도 심재성 이상의 화상ㆍ동상 환자(피부재생이 억제되어 치유가 지연될 수 있다)

5) 입주위피부염, 보통여드름, 주사(rosacea) 환자

6) 스트렙토마이신, 카나마이신, 겐타마이신, 네오마이신 등 아미노글리코사이드계 항생물질 또는 바시트라신에 의한 과민증 및 그 병력이 있는 환자 (아미노글리코사이드계 항생물질사이에는 교차 알레르기유발성이 입증되었다)');



-------------------------------------------------------
-- 이석학생에게 배포할 테이블 

create table payment_record (   -- 결제내역
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



create table hospital_board (   -- 병원공지 게시판
    hospital_board_num number(4) CONSTRAINT hospital_num_pk primary key,
    hospital_photo varchar2(60),
    hospital_title varchar2(100),
    hospital_content varchar2(500),
    hospital_regdate date default sysdate,
    h_watched number(4)
);

create sequence hospital_board_num  -- 일정게시판 시퀀스
increment by 1
start with 1;

create table hospital_repl (   -- 병원공지 댓글
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

create table faq_board (   -- FAQ 게시판
    faq_board_num number(4) CONSTRAINT faq_num_pk primary key,
    faq_title varchar2(60),
    faq_content varchar2(500),
    faq_regdate date default sysdate
);

create sequence faq_board_num  -- FAQ 게시판  시퀀스
increment by 1
start with 1;


create table news_board (   -- 건강정보 게시판
    news_board_num number(4) CONSTRAINT news_num_pk primary key,
    news_url varchar2(60),
    news_photo varchar2(60),
    news_title varchar2(70),
    news_content varchar2(4000),
    news_regdate date default sysdate,
    watched number(4)
);

create sequence news_board_num  -- 건강정보 시퀀스
increment by 1
start with 1;

create table news_repl (   -- 건강정보 댓글
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

create sequence news_board_repl_num  -- 건강정보 댓글 시퀀스
increment by 1
start with 1;


create table ai_record (   -- ai 진단 기록
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


create table favorite_doctor (   -- 찜한 의사
    patient_num number,
    doctor_num number,
    ai_symptom varchar(20) not null,
    favorite_date date default sysdate, 
    constraint favorite_patient_num_fk foreign key(patient_num)
    references dl_user(patient_num),
    constraint favorite_doctor_num_fk foreign key(doctor_num)
    references dl_doctor(doctor_num)
);


create table treat_repl (   -- 진료후기 댓글
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

create sequence treat_repl_num  -- 진료후기 댓글 시퀀스
increment by 1
start with 1;

create table doc_review(    -- 진료후기 별점 좋아요 싫어요 등
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

create table chat_room (  -- 채팅방 번호
    room_num number(4) CONSTRAINT room_num_pk primary key
);

create table chat_msg (   -- 채팅메세지
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



create table chat_room_join (  -- 조인한 채팅방 번호
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