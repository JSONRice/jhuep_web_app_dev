package resources.newhorizons.domain;

//import javax.ejb.Stateful;
import java.io.Serializable;

/**
 *
 * @author Matt
 */

public class UserSessionBean implements Serializable{
    private String userID;
    private String name;
    private String address1;
    private String address2;
    private String username;
    private String email;
    //String password; //Dont worry about password for now
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public UserSessionBean () {
    }

    public String getUserID() {
        return userID;
    }

    public String getName() {
        return name;
    }

    public String getAddress1() {
        return address1;
    }

    public String getAddress2() {
        return address2;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    
    
}
