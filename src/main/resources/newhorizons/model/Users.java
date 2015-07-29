/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources.newhorizons.model;

/**
 *
 * @author matth_000
 */
public class Users {
    
	
	private int usersID ;
	
	private String usersFirstName;
	
	private String usersLastName;
	
	public Users() {
		
		usersID = 0;
		usersLastName = "none";
		usersFirstName = "none";
			
	}

	/**
	 * @param usersID
	 * @param usersFirstName
	 * @param usersLastName
	 */
	public Users(int usersID, String usersFirstName, String usersLastName) {
		this.usersID = usersID;
		this.usersFirstName = usersFirstName;
		this.usersLastName = usersLastName;
	}

	/**
	 * @return the usersID
	 */
	public int getUsersID() {
		return usersID;
	}

	/**
	 * @param usersID the usersID to set
	 */
	public void setUsersID(int usersID) {
		this.usersID = usersID;
	}

	/**
	 * @return the usersFirstName
	 */
	public String getUsersFirstName() {
		return usersFirstName;
	}

	/**
	 * @param usersFirstName the usersFirstName to set
	 */
	public void setUsersFirstName(String usersFirstName) {
		this.usersFirstName = usersFirstName;
	}

	/**
	 * @return the usersLastName
	 */
	public String getUsersLastName() {
		return usersLastName;
	}

	/**
	 * @param usersLastName the usersLastName to set
	 */
	public void setUsersLastName(String usersLastName) {
		this.usersLastName = usersLastName;
	}
	
	public String toString() {
		
		
		String temp = "Users ID: " + usersID ;
		temp = temp + " Users Name: " + usersFirstName + " " + usersLastName ;
		
		return temp;
		
	}

}
