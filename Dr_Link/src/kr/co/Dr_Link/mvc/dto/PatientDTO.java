package kr.co.Dr_Link.mvc.dto;

/*
 patient_num number(4) constraint dl_patient_num_pk primary key,
    p_id varchar2(20) not null,
    p_pwd varchar2(20) not null,
    p_name varchar2(10) not null,
    p_jumin_num char(13) not null,
    p_phone_num char(13) not null,
    p_address varchar2(60) not null,
    p_email varchar2(30) not null,
    bloodtype char(1) not null,
    height varchar2(10) not null,
    weight varchar2(10) not null,
    allergy char(1) not null,
    p_photo varchar2(50),
    p_regdate date default sysdate
*/
public class PatientDTO {
	
	private String patient_num, p_id, p_pwd, p_name, p_jumin_num,p_phone_num,p_address,bloodtype,allergy, p_email,height,weight,p_photo ;

	
	
	public String getPatient_num() {
		return patient_num;
	}

	public void setPatient_num(String patient_num) {
		this.patient_num = patient_num;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getP_pwd() {
		return p_pwd;
	}

	public void setP_pwd(String p_pwd) {
		this.p_pwd = p_pwd;
	}

	public String getP_jumin_num() {
		return p_jumin_num;
	}

	public void setP_jumin_num(String p_jumin_num) {
		this.p_jumin_num = p_jumin_num;
	}

	public String getP_phone_num() {
		return p_phone_num;
	}

	public void setP_phone_num(String p_phone_num) {
		this.p_phone_num = p_phone_num;
	}

	public String getP_address() {
		return p_address;
	}

	public void setP_address(String p_address) {
		this.p_address = p_address;
	}

	public String getBloodtype() {
		return bloodtype;
	}

	public void setBloodtype(String bloodtype) {
		this.bloodtype = bloodtype;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public String getP_email() {
		return p_email;
	}

	public void setP_email(String p_email) {
		this.p_email = p_email;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getP_photo() {
		return p_photo;
	}

	public void setP_photo(String p_photo) {
		this.p_photo = p_photo;
	}
	

}
