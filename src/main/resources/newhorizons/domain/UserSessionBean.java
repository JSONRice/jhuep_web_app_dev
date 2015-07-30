package resources.newhorizons.domain;

//import javax.ejb.Stateful;
import java.io.Serializable;
import java.util.*;

/**
 *
 * @author Matt
 */

public class UserSessionBean implements Serializable{

    private String firstName;
    private String lastName;
    private String emailAddress;
    private String userName;
    private String password;
    private Dictionary items;
    
    
    
    public UserSessionBean()
    {

    }
    
    
    public UserSessionBean(String firstname, String lastname, String email, 
            String username, String passwd)
    {
        this.firstName = firstname;
        this.lastName = lastname;
        this.emailAddress = email;
        this.userName = username;
        this.password = passwd;
        this.items = new Hashtable();
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
    
    
    /**
     * Set the value of emailAddress
     *
     * @param emailAddress new value of emailAddress
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
    
    
    /**
     * Set the value of userName
     *
     * @param userName new value of userName
     */
    public void setUserName(String username) {
        this.userName = username;
    }

    /**
     * Get the value of lastName
     *
     * @return the value of lastName
     */
    public String getLastName() 
    {
        return lastName;
    }

    /**
     * Set the value of lastName
     *
     * @param lastName new value of lastName
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
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
     * @param password new value of password
     */
    public void setPassword(String passwd) {
        this.password = passwd;
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
     * @param firstName new value of firstName
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    /**
     * 
     * @param itemname
     * @param itemprice 
     * add item selected into the items dictionary
     */
    public void addItemToItems(String itemname, int itemprice)
    {
        items.put(itemname, itemprice);
    }
    
    
    /**
     * 
     * @param itemname
     * Given an item name, remove it from the selected
     * items dictionary
     */
    public void removeItemFromItems(String itemname)
    {
        items.remove(itemname);
    }

    
    /**
     * Gives a list of selected items from the dictionary.
     * Excludes the costs and only gives the keys from the 
     * dictionary which are the selected items names.
     * Should be called after items have been added to the 
     * dictionary.
     */
    public ArrayList<String> getSelectedItemsList()
    {
        ArrayList<String> selectedItemsList = null;
        selectedItemsList = Collections.list(this.items.keys());
        return selectedItemsList;
    }
 
    /**
     * 
     * Get an individual item's price, provided
     * the name of the item
     */
    public int getItemPrice(String itemname)
    {
        int price = 0;
        price = (Integer) this.items.get(itemname);
        return price;
    }
    
    /**
     * 
     * Add prices of all the items in the dictionary
     * which have been selected by the user
     */
    public int getSelectedItemsTotalCost()
    {
        ArrayList<String> selectedItemsList = this.getSelectedItemsList();
        
        int cost = 0;
        for (int i = 0; i < selectedItemsList.size(); i++)
        {
            cost = cost + (Integer) this.items.get(selectedItemsList.get(i));
        }
        return cost;
    }
    
    
    public String getUserInfoString()
    {
        String tempS = this.firstName + " " + this.lastName + " " + 
                       this.emailAddress + " " + this.userName + "\n" +
                       this.items.toString();
        return tempS;
    }
    
    
}
