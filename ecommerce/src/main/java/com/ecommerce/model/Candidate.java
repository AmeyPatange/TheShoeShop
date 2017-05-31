package com.ecommerce.model;

import javax.persistence.*;

import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name="Candidate")
public class Candidate {

	@NotEmpty
	@Column(name="FirstName")
	public String signUpFirstName;
	
	@NotEmpty
	@Column(name="LastName")
	public String signUpLastName;
	
	@Column(name="Address")
	public String signUpAddress;
	
	@NotEmpty
	@Column(name="Email", unique=true)
	public String signUpEmail;
	
	@NotEmpty
	@Column(name="Phone")
	public String signUpPhone;
	
	@NotEmpty
	@Column(name="Password")
	public String signUpPassword;
	
	@NotEmpty
	@Column(name="Role")
	public String userType;

	@Id
	@GeneratedValue
	public int CandidateId;
	
	
	public int getCandidateId() {
		return CandidateId;
	}

	public void setCandidateId(int candidateId) {
		CandidateId = candidateId;
	}

	public String getSignUpFirstName(){
		return signUpFirstName;
	}

	public void setSignUpFirstName(String signUpFirstName) {
		this.signUpFirstName = signUpFirstName;
	}

	public String getSignUpLastName() {
		return signUpLastName;
	}

	public void setSignUpLastName(String signUpLastName) {
		this.signUpLastName = signUpLastName;
	}

	public String getSignUpAddress() {
		return signUpAddress;
	}

	public void setSignUpAddress(String signUpAddress) {
		this.signUpAddress = signUpAddress;
	}

	public String getSignUpEmail() {
		return signUpEmail;
	}

	public void setSignUpEmail(String signUpEmail) {
		this.signUpEmail = signUpEmail;
	}

	public String getSignUpPhone() {
		return signUpPhone;
	}

	public void setSignUpPhone(String signUpPhone) {
		this.signUpPhone = signUpPhone;
	}

	public String getSignUpPassword() {
		return signUpPassword;
	}

	public void setSignUpPassword(String signUpPassword) {
		this.signUpPassword = signUpPassword;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	
}
