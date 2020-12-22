package kr.co.Dr_Link.mvc.dto;

public class DoctorDTO {
    
    private int doctor_num, dep_num;
	private String d_id, d_pwd, d_name, d_jumin_num, d_phone_num, d_address, d_email;
	private String d_licence, d_licence_num, d_photo, d_regdate, d_gender;
	private String[][] d_graduation,d_career;
	private DepartmentDTO departmentDTO;
	
	public DepartmentDTO getDepartmentDTO() {
		return departmentDTO;
	}
	public void setDepartmentDTO(DepartmentDTO departmentDTO) {
		this.departmentDTO = departmentDTO;
	}
	
	
	
	public String getD_licence_num() {
		return d_licence_num;
	}
	public void setD_licence_num(String d_licence_num) {
		this.d_licence_num = d_licence_num;
	}
	public int getDep_num() {
		return dep_num;
	}
	public void setDep_num(int dep_num) {
		this.dep_num = dep_num;
	}

	/*
	 * public String getD_school() { 
	 * return d_school; 
	 * } public void
	 * setD_school(String d_school) { //System.out.println("else문 안의 d_school : " +
	 * d_school); this.d_school = d_school; } public String getD_whengrad() { return
	 * d_whengrad; } public void setD_whengrad(String d_whengrad) {
	 * //System.out.println("else문 안의 d_whengrad : " + d_whengrad); this.d_whengrad
	 * = d_whengrad; }
	 */
	

	public String getD_gender() {
		return d_gender;
	}
	
	public void setD_gender(String d_gender) {
		this.d_gender = d_gender;
	}
	
	public int getDoctor_num() {
		return doctor_num;
	}
	public void setDoctor_num(int doctor_num) {
		this.doctor_num = doctor_num;
	}
	public String getD_id() {
		return d_id;
	}
	public void setD_id(String d_id) {
		this.d_id = d_id;
	}
	public String getD_pwd() {
		return d_pwd;
	}
	public void setD_pwd(String d_pwd) {
		this.d_pwd = d_pwd;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_jumin_num() {
		return d_jumin_num;
	}
	public void setD_jumin_num(String d_jumin_num) {
		StringBuffer str = new StringBuffer(d_jumin_num);
		str = str.insert(7, "-");
		d_jumin_num = str.toString();
		this.d_jumin_num = d_jumin_num;
	}
	public String getD_phone_num() {
		return d_phone_num;
	}
	public void setD_phone_num(String d_phone_num) {
		StringBuffer str = new StringBuffer(d_phone_num);
		str = str.insert(3, "-");
		str = str.insert(8, "-");
		this.d_phone_num = d_phone_num;
	}
	public String getD_address() {
		return d_address;
	}
	public void setD_address(String d_address) {
		this.d_address = d_address;
	}
	public String getD_email() {
		return d_email;
	}
	public void setD_email(String d_email) {
		this.d_email = d_email;
	}
	public String[][] getD_graduation() {
		return d_graduation;
	}
	public void setD_graduation(String d_graduation) {
		//System.out.println("else문 안의 d_graduation : " + d_graduation);
		String[] school = d_graduation.split(",");
		String[][] result = new String[school.length][];
		for (int i = 0; i < school.length; ++i) {
			result[i] = school[i].split(" ");
		}
		this.d_graduation = result;
	}
	public String[][] getD_career() {
		return d_career;
	}
	public void setD_career(String d_career) {
		String[] school = d_career.split(",");
		String[][] result = new String[school.length][];
		for (int i = 0; i < school.length; ++i) {
			result[i] = school[i].split(" ");
		}
		this.d_career = result;
	}
	public String getD_licence() {
		return d_licence;
	}
	public void setD_licence(String d_licence) {
		this.d_licence = d_licence;
	}
	public String getD_photo() {
		return d_photo;
	}
	public void setD_photo(String d_photo) {
		this.d_photo = d_photo;
	}
	public String getD_regdate() {
		return d_regdate;
	}
	public void setD_regdate(String d_regdate) {
		this.d_regdate = d_regdate;
	}
	
}
