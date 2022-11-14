package sit.int202.classicmodels.models;

import lombok.Getter;
import lombok.Setter;
import sit.int202.classicmodels.entities.Product;
@Getter
@Setter
public class LineItems {
    private Product product;
    private Double price;
    private Integer amount;
    public LineItems(Product p){
        this(p,1);
    }
    public LineItems(Product p, int amount){
        this.product = p;
        this.price = product.getMSRP();
        this.amount = amount;
    }

    public Double getTotalPrice() {
        return price*amount;
    }
}
