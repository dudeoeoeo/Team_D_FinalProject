package kr.co.Dr_Link.mvc.dto;

import java.util.List;

/*
  prescription_num number(4) CONSTRAINT prescription_num_pk primary key,
    patient_num number,
    doctor_num number,
    dep_num number,
    medicine_num number, -- REFERENCES treatment_record (start_treatment_time)
    payment_check char(2),
    treatment_num number,
    dosage varchar2(20), --투여량
    quantity varchar2(20), --횟수
    taking_date varchar2(20), --일수
    prescription_date varchar2(50),
*/
public class PrescriptionDTO {
	
	private int patient_num,doctor_num,dep_num,treatment_num;
	private String payment_check,dosage,quantity,taking_date,prescription_date;
	private List<Integer> medicine_num;
	
	
	public void setMedicine_num(List<Integer> medicine_num) {
		this.medicine_num = medicine_num;
	}
	public List<Integer> getMedicine_num() {
		return medicine_num;
	}
	public int getPatient_num() {
		return patient_num;
	}
	public void setPatient_num(int patient_num) {
		this.patient_num = patient_num;
	}
	public int getDoctor_num() {
		return doctor_num;
	}
	public void setDoctor_num(int doctor_num) {
		this.doctor_num = doctor_num;
	}
	public int getDep_num() {
		return dep_num;
	}
	public void setDep_num(int dep_num) {
		this.dep_num = dep_num;
	}
	/*
	public int getMedicine_num() {
		return medicine_num;
	}
	public void setMedicine_num(int medicine_num) {
		this.medicine_num = medicine_num;
	}
	*/
	public int getTreatment_num() {
		return treatment_num;
	}
	public void setTreatment_num(int treatment_num) {
		this.treatment_num = treatment_num;
	}
	public String getPayment_check() {
		return payment_check;
	}
	public void setPayment_check(String payment_check) {
		this.payment_check = payment_check;
	}
	public String getDosage() {
		return dosage;
	}
	public void setDosage(String dosage) {
		this.dosage = dosage;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getTaking_date() {
		return taking_date;
	}
	public void setTaking_date(String taking_date) {
		this.taking_date = taking_date;
	}
	public String getPrescription_date() {
		return prescription_date;
	}
	public void setPrescription_date(String prescription_date) {
		this.prescription_date = prescription_date;
	}
	
	
	

}
