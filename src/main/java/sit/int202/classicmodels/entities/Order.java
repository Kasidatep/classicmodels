package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Entity
@Getter
@Setter
@ToString
@Table(name = "orders")
@NamedQueries({
        @NamedQuery(name = "Order.FIND_BY_USER", query = "SELECT o FROM Order o WHERE o.customerNumber = :userId"),
        @NamedQuery(name = "Order.FIND_BY_CODE", query = "SELECT o FROM Order o WHERE o.customerNumber = :userId"),
        @NamedQuery(name = "Order.FIND_ALL", query = "SELECT o FROM Order o ")
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
    @OneToMany(cascade = CascadeType.ALL, fetch= FetchType.EAGER)
    @JoinColumn(name = "orderNumber")
//    @OneToMany(mappedBy = "orderNumber")
    private List<OrderDetail> orderDetails;
}
