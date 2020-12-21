package kr.co.Dr_Link.mvc.dto;

import java.util.List;

/*
  prescription_num number(4) CONSTRAINT prescription_num_pk primary key,
    patient_num number,
    doctor_num number,
    medicine_num number, -- REFERENCES treatment_record (start_treatment_time)
    payment_check char(2),
    treatment_num number,
    dosage varchar2(20), --투여량
    quantity varchar2(20), --횟수
    taking_date varchar2(20), --일수
    prescription_date varchar2(50),
*/
public class PrescriptionDTO {
	
	private int prescription_num, patient_num,doctor_num,treatment_num;
	private String payment_check,prescription_date;
	private String [] medicine_num,dosage,quantity,taking_date;
	private List<TreatmentRecordDTO> treatmentRecordDTO;
	private List<MedicineDTO> medicineDTO;
	private List<DoctorDTO> doctorDTO;
	private List<PatientDTO> patientDTO;

	
	public List<TreatmentRecordDTO> getTreatmentRecordDTO() {
		return treatmentRecordDTO;
	}
	public void setTreatmentRecordDTO(List<TreatmentRecordDTO> treatmentRecordDTO) {
		this.treatmentRecordDTO = treatmentRecordDTO;
	}
	public List<MedicineDTO> getMedicineDTO() {
		return medicineDTO;
	}
	public void setMedicineDTO(List<MedicineDTO> medicineDTO) {
		this.medicineDTO = medicineDTO;
	}
	public List<DoctorDTO> getDoctorDTO() {
		return doctorDTO;
	}
	public void setDoctorDTO(List<DoctorDTO> doctorDTO) {
		this.doctorDTO = doctorDTO;
	}
	public List<PatientDTO> getPatientDTO() {
		return patientDTO;
	}
	public void setPatientDTO(List<PatientDTO> patientDTO) {
		this.patientDTO = patientDTO;
	}
	
	
	public int getPrescription_num() {
		return prescription_num;
	}
	public void setPrescription_num(int prescription_num) {
		this.prescription_num = prescription_num;
	}
	public void setMedicine_num(String medicine_num) {
		this.medicine_num = medicine_num.split(",");
	}
	
	public String[] getMedicine_num() {
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
	public void setDosage(String dosage) {
		this.dosage = dosage.split(",");
	}
	public String[] getDosage() {
		return dosage;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity.split(",");
	} 
	public String[] getQuantity() {
		return quantity;
	}
	public void setTaking_date(String taking_date) {
		this.taking_date = taking_date.split(",");
	}
	public String[] getTaking_date() {
		return taking_date;
	}
	public String getPrescription_date() {
		return prescription_date;
	}
	public void setPrescription_date(String prescription_date) {
		StringBuffer str = new StringBuffer(prescription_date);
		str = str.insert(4, "년 ");
		str = str.insert(8, "월 ");
		str = str.insert(12, "일 ");
		prescription_date = str.toString();
		this.prescription_date = prescription_date;
	}
	
	

}
