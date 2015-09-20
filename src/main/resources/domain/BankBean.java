package resources.domain;

import java.util.ArrayList;

/**
 * @description Bank entity (model)
 * @author jsnrice
 */
public class BankBean {
    private ArrayList<Customer> customers;
    
    public BankBean() {
        customers = new ArrayList<Customer>();
        // The Gang of Four (GOF)
        customers.add(new Customer("Erich", "", "Gamma", 4030.24, 1));
        customers.add(new Customer("Richard", "McGarrah", "Helm", 14030.24, 1));
        customers.add(new Customer("Ralph", "E.", "Johnson", 64320.90, 1));
        customers.add(new Customer("John", "Matthew", "Vlissides", 30.24, 1));
    }
    
    public final Customer getCustomer(int id) {
        for (int i = 0, length = customers.size(); i < length; ++i) {
            if (customers.get(i).getId() == id) {
                return customers.get(i);
            }
        }
        return null;
    }
    
    public final ArrayList<Customer> getCustomers() {
        return customers;
    }
}
