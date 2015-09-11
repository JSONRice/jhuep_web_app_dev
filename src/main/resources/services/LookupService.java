package resources.services;

import java.util.logging.Level;
import java.util.logging.Logger;
import resources.domain.BankBean;
import resources.domain.Customer;

/**
 * @description Lookup service is utilized by controller to retrieve (look up) a customer
 * associated with the bank (bean).
 * @author jsnrice
 */
public class LookupService {
    private final static Logger LOGGER = Logger.getLogger(LookupService.class.getName());
    private BankBean bankBean;
    
    public LookupService() {
        bankBean = new BankBean();
    }
    
    public Customer findCustomer(int id){
        if (id < 0) {
            LOGGER.log(Level.WARNING, "findCustomer param id must be greater than zero");                                
        }
        return bankBean.getCustomer(id);
    }
    
    public BankBean getBankBean() {
        return bankBean;
    }
}
