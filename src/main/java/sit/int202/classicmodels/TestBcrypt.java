package sit.int202.classicmodels;

import at.favre.lib.crypto.bcrypt.BCrypt;
import sit.int202.classicmodels.entities.Customer;
import sit.int202.classicmodels.repositories.CustomerRepository;

public class TestBcrypt {
    public static void main(String[] args) {
        CustomerRepository repository = new CustomerRepository();
        Customer user = repository.findByName("Jean King");
        System.out.println( "User: " +user.getContactFirstName()+"\nPW: " + user.getPassword());
        String password = "king";
        BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
        System.out.println("Correct Password? " + result.verified);
        System.out.println(BCrypt.withDefaults().hashToString(12, password.toCharArray()));
    }
}
