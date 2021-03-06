/*
 * 디자이너와 프로그래머가 협업하여 개발하는데
 * 자바빈은 jsp 페이지의 디자인 부분과 비지니스 로직 로직(=자바코드) 부분을
 * 분리함으로써 복잡한 jsp코드들을 줄이고 프로그램을 재사용할수있다 
 */


//DTO (Data Transfer Object) : DB로 부터 DAO클래스로 가져온 내용
//DAO(Data Access Object) 클래스로 접근하여 DB로부터 가져온 내용을 객체로 바꾸어


/*
 * ---------------------이것이 바로 자바빈 이라는것이다-------
 * JSP책 247p 자바빈의 설계규약 참조!!
 * 
 * 
 */
package member;

//회원목록조회 할때 쓸꺼임
public class MemberBeans {
	// 1. 멤버변수(sql꺼)-private
	private String custno;
	private String custname;
	private String phone;
	private String address;
	private String joindate;
	private String grade;
	private String city;

	// 2.매개변수가 없는 생성자 필요 -
	// 2.1 인자 인수 argument가 없는 생성자 반드시 필요!!
	// 기본생성자 씀

	// 3. 메서드-public
	public String getCustno() {
		return custno;
	}

	public void setCustno(String custno) {
		this.custno = custno;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

}
