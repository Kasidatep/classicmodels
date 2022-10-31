package sit.int202.classicmodels.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "offices")
public class Office {

        @Id
        private String officeCode;
        private String addressLine1;
        private String addressLine2;
        private String city;
        private String state;
        private String country;
        private String postalCode;
        private String phone;
        private String territory;

     //   @OneToMany(mappedBy = "officeCode")
     //   private List<Employee> employees;


}
