package resources.newhorizons.domain;

//import javax.ejb.Stateful;
import java.io.Serializable;

/**
 *
 * @author Matt
 */

public class UserSessionBean implements Serializable{

    private String username;
    private String address1;
    private String address2;
    private String emailAddress;
    private String password;

    

    /**
     * Get the value of address2
     *
     * @return the value of address2
     */
    public String getAddress2() {
        return address2;
    }

    /**
     * Set the value of address2
     *
     * @param address2 new value of address2
     */
    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    /**
     * Get the value of address1
     *
     * @return the value of address1
     */
    public String getAddress1() {
        return address1;
    }

    /**
     * Set the value of address1
     *
     * @param address1 new value of address1
     */
    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    
    /**
     * Get the value of password
     *
     * @return the value of password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Set the value of password
     *
     * @param password new value of password
     */
    public void setPassword(String password) {
        this.password = password;
    }


    /**
     * Get the value of emailAddress
     *
     * @return the value of emailAddress
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * Set the value of emailAddress
     *
     * @param emailAddress new value of emailAddress
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }


    /**
     * Get the value of lastName
     *
     * @return the value of lastName
     */
    public String getUsername() {
        return username;
    }

    /**
     * Set the value of lastName
     *
     * @param lastName new value of lastName
     */
    public void setUsername(String username) {
        this.username = username;
    }


  

    
    
}
