package resources.domain;

/**
 * @description Customer entity (model).
 * @author jsnrice
 */
public class Customer {
    private String firstName;
    private String lastName;
    private double balance;
    private int id;

    Customer(String firstName, String middleName, String lastName, double balance, int id) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.balance = balance;
        this.id = id;
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

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
