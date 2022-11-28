package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "orders")
@NamedQueries({
        @NamedQuery(name = "Order.FIND_BY_USER", query = "SELECT c FROM Order o WHERE o.customerNumber = :userId")
})
public class Order {
    @Id
    private Integer orderNumber;
    private String orderDate;
    private String requiredDate;
    private String shippedDate;
    private String status;
    private String comments;
    private Integer customerNumber;
}
