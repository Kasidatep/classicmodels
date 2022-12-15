package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "orderdetails")
public class OrderDetail {
    @Id
    private Integer orderNumber;
    @Id
    @ManyToOne
    @JoinColumn(name="productCode")
    private Product product;
    //private String productCode;
    private Integer quantityOrdered;
    private Double priceEach;
    private Long orderLineNumber;
}
