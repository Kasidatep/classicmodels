package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@NamedQueries({
        @NamedQuery(name = "Product.FindAll", query = "SELECT p FROM Product p"),
        @NamedQuery(name = "Product.count", query = "SELECT count(p) as count FROM Product p")
})
@Table(name = "products")
public class Product {
    @Id
    private String productCode;
    private String productName;
    private String productLine;
    private String productScale;
    private String productVendor;
    private String productDescription;
    @Column(name = "quantityInStock")
    private Integer quantity;
    private Double buyPrice;
    private Double MSRP;
}
