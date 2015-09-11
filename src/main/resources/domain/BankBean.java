package resources.domain;

import java.util.ArrayList;

/**
 * @description Bank entity (model)
 * @author jsnrice
 */
public class BankBean {
    private static ArrayList<Customer> customers;
    
    public BankBean() {
        customers = new ArrayList<Customer>();
        customers.add(new Customer("James", "", "Gosling", 64320.90, 1));
        customers.add(new Customer("Jesse", "James", "Garrett", 14030.24, 2));
    }
    
    public final Customer getCustomer(int id) {
        for (int i = 0, length = customers.size(); i < length; ++i) {
            if (customers.get(i).getId() == id) {
                return customers.get(i);
            }
        }
        return null;
    }
}
