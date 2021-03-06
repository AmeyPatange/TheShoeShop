package com.ecommerce.model;

import javax.persistence.*;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Table(name="Supplier")
@Component
public class Supplier {
	
	@Id
	@GeneratedValue
	private int SupplierId;
	
	@NotEmpty
	@Column(name="FirstName")
	private String supplierFirstName;
	
	@NotEmpty
	@Column(name="LastName")
	private String supplierLastName;
	
	@NotEmpty
	@Column(name="Address")
	private String supplierAddress;
	
	@NotEmpty
	@Column(name="Email", unique=true)
	private String supplierEmail;

	
	
	public Supplier() {

	}

	public int getSupplierId() {
		return SupplierId;
	}

	public void setSupplierId(int supplierId) {
		SupplierId = supplierId;
	}

	public String getSupplierFirstName() {
		return supplierFirstName;
	}

	public void setSupplierFirstName(String supplierFirstName) {
		this.supplierFirstName = supplierFirstName;
	}

	public String getSupplierLastName() {
		return supplierLastName;
	}

	public void setSupplierLastName(String supplierLastName) {
		this.supplierLastName = supplierLastName;
	}

	public String getSupplierAddress() {
		return supplierAddress;
	}

	public void setSupplierAddress(String supplierAddress) {
		this.supplierAddress = supplierAddress;
	}

	public String getSupplierEmail() {
		return supplierEmail;
	}

	public void setSupplierEmail(String supplierEmail) {
		this.supplierEmail = supplierEmail;
	}
	
	
	
}
