package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Entity
@Getter
@Setter
@ToString
@Table(name = "customers")
@NamedQueries({
        @NamedQuery(name = "Customer.FIND_USER", query = "SELECT c FROM Customer c WHERE concat(trim(c.contactFirstName), ' ', trim(c.contactLastName)) = :user_account")
})
public class Customer {
    @Id
    private Integer customerNumber;
    private String customerName;
    private String contactFirstName;
    private String contactLastName;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String postalCode;
    private String country;
    private String phone;
    private String password;
}