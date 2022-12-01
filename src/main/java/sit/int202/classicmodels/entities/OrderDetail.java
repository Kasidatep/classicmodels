package sit.int202.classicmodels.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
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
    private String productCode;
    private Integer quantityOrdered;
    private Double priceEach;
    private Long orderLineNumber;
}
