package member.model.vo;
/**
 /**
 * 작성자: 전민희
 * 작성일자: 200202
 * 작성목표 : 회원정보객체 생성
 * 
 */
import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {
	
	//페이지내의 업무마다 주석달기  필드
	private static final long serialVersionUID = 1L;
	
	private int mcode;
	private String memberId;
	private String password;
	private String phone;
	private String email;
	private String address;
	private Date enrollDate;
	private double mile;
	private Date birthDay;
	private String memberName;
	
	//생성자
	public Member() {
		super();
	}

	//파라미터생성자
	public Member(int mcode, String memberId, String password, String phone, String email, String address,
			Date enrollDate, double mile, Date birthDay, String memberName) {
		super();
		this.mcode = mcode;
		this.memberId = memberId;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.enrollDate = enrollDate;
		this.mile = mile;
		this.birthDay = birthDay;
		this.memberName = memberName;
	}
	

	//getter/setter
	public int getMcode() {
		return mcode;
	}


	public void setMcode(int mcode) {
		this.mcode = mcode;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public double getMile() {
		return mile;
	}

	public void setMile(double mile) {
		this.mile = mile;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "Member [mcode=" + mcode + ", memberId=" + memberId + ", password=" + password + ", phone=" + phone
				+ ", email=" + email + ", address=" + address + ", enrollDate=" + enrollDate + ", mile=" + mile
				+ ", birthDay=" + birthDay + ", memberName=" + memberName + "]";
	}


	
}
