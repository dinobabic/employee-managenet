package com.main.crm;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.main.validation.ValidEmail;

public class CrmCustomer {
	
	@NotNull(message = "is required")
	@Size(min=1, message="is required")
	private String username;
	
	@NotNull(message = "is required")
	@Size(min=1, message="is required")
	private String firstName;
	
	@NotNull(message = "is required")
	@Size(min=1, message="is required")
	private String lastName;

	@ValidEmail
	@NotNull(message = "is required")
	@Size(min=1, message="is required")
	private String email;

	@NotNull(message = "is required")
	private Long moneySpent;
	
	public CrmCustomer() {
		
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getMoneySpent() {
		return moneySpent;
	}

	public void setMoneySpent(Long moneySpent) {
		this.moneySpent = moneySpent;
	}

	@Override
	public String toString() {
		return "CrmCustomer [username=" + username + ", firstName=" + firstName + ", lastName=" + lastName + ", email="
				+ email + ", moneySpent=" + moneySpent + "]";
	}
}
	
