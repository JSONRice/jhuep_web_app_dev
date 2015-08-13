package resources.newhorizons.domain;

//import javax.ejb.Stateful;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import resources.newhorizons.services.UserSessionDB;

/**
 *
 * @author Matt
 */
public class UserSessionBean implements Serializable {

    private String firstName;
    private String lastName;
    private String emailAddress;
    private String userName;
    private String password;
    private Dictionary items;
    
    private String errorMessage;

    /**
     * Get the value of errorMessage
     *
     * @return the value of errorMessage
     */
    public String getErrorMessage() {
        return errorMessage;
    }

    /**
     * Set the value of errorMessage
     *
     * @param errorMessage new value of errorMessage
     */
    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public UserSessionBean() {

    }

    public UserSessionBean(String username, String passwd) {

        if (UserSessionDB.usernameExists(username)) {
            if (UserSessionDB.usernameLogin(username, passwd)){
            System.out.println("Password Success, logging in");
                UserSessionBean temp = UserSessionDB.selectUser(username);
                this.firstName = temp.getFirstName();
            this.lastName = temp.getLastName();
            this.emailAddress = temp.getEmailAddress();
            this.userName = temp.getUserName();
            this.password = temp.getPassword();
            this.items = temp.items;
            this.errorMessage = "";
                
            }
           this.errorMessage = "Password Failed";
        } 
    }
    
    public UserSessionBean(String firstname, String lastname, String email,
            String username, String passwd) {

        if (UserSessionDB.usernameExists(username)) {
           this.errorMessage = "Username Exists";
        } else {
            this.firstName = firstname;
            this.lastName = lastname;
            this.emailAddress = email;
            this.userName = username;
            this.password = passwd;
            this.items = new Hashtable();
            this.errorMessage = "";
            UserSessionDB.insert(this);
        }
    }

    public String getItemsDB() {
        String encoded = null;
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
            objectOutputStream.writeObject(items);
            objectOutputStream.close();
            encoded = new String(Base64.encode(byteArrayOutputStream.toByteArray()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return encoded;
    }

    public void setItemsDB(String itemsDb) {
        byte[] bytes = Base64.decode(itemsDb);
        Hashtable object = null;
        try {
            ObjectInputStream objectInputStream = new ObjectInputStream(new ByteArrayInputStream(bytes));
            object = (Hashtable) objectInputStream.readObject();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (ClassCastException e) {
            e.printStackTrace();
        }
        items = object;
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
     * Get the value of user name
     *
     * @return the value of userName
     */
    public String getUserName() {
        return userName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
        UserSessionDB.update(this);
    }

    /**
     * Set the value of emailAddress
     *
     * @param emailAddress new value of emailAddress
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
        UserSessionDB.update(this);
    }

    /**
     * Set the value of userName
     *
     * @param userName new value of userName
     */
    public void setUserName(String username) {
        this.userName = username;
        UserSessionDB.update(this);
    }

    /**
     * Get the value of lastName
     *
     * @return the value of lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Get the value of password
     *
     * @return the value of password
     */
    public String getPassword() {
        return this.password;
    }

    /**
     * Set the value of password
     *
     * @param password new value of password
     */
    public void setPassword(String passwd) {
        this.password = passwd;
        UserSessionDB.update(this);
    }

    /**
     * Get the value of firstName
     *
     * @return the value of firstName
     */
    public String getFirstName() {
        return firstName;

    }

    /**
     * Set the value of firstName
     *
     * @param firstName new value of firstName
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
        UserSessionDB.update(this);
    }

    /**
     *
     * @param itemname
     * @param itemprice add item selected into the items dictionary
     */
    public void addItemToItems(String itemname, int itemprice) {
        if (items == null) {
            items = new Hashtable();
        }
        items.put(itemname, itemprice);
        UserSessionDB.update(this);
    }

    /**
     *
     * @param itemname Given an item name, remove it from the selected items
     * dictionary
     */
    public void removeItemFromItems(String itemname) {
        items.remove(itemname);
    }

    /**
     * Gives a list of selected items from the dictionary. Excludes the costs
     * and only gives the keys from the dictionary which are the selected items
     * names. Should be called after items have been added to the dictionary.
     */
    public ArrayList<String> getSelectedItemsList() {
        ArrayList<String> selectedItemsList = null;
        selectedItemsList = Collections.list(this.items.keys());
        return selectedItemsList;
    }

    /**
     *
     * Get an individual item's price, provided the name of the item
     */
    public int getItemPrice(String itemname) {
        int price = 0;
        price = (Integer) this.items.get(itemname);
        return price;
    }

    /**
     *
     * Add prices of all the items in the dictionary which have been selected by
     * the user
     */
    public int getSelectedItemsTotalCost() {
        ArrayList<String> selectedItemsList = this.getSelectedItemsList();

        int cost = 0;
        for (int i = 0; i < selectedItemsList.size(); i++) {
            cost = cost + (Integer) this.items.get(selectedItemsList.get(i));
        }
        return cost;
    }

    public String getUserInfoString() {
        String tempS = this.firstName + " " + this.lastName + " "
                + this.emailAddress + " " + this.userName + "\n"
                + this.items.toString();
        return tempS;
    }

    public void resetItems() {
        this.items = new Hashtable();
    }
}
