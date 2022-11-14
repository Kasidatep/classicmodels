package sit.int202.classicmodels;

import sit.int202.classicmodels.entities.Product;
import sit.int202.classicmodels.models.Cart;
import sit.int202.classicmodels.models.LineItems;
import sit.int202.classicmodels.repositories.ProductRepository;

public class TestCart {
    public static void main(String[] args) {
        ProductRepository productRepository = new ProductRepository();
        Product product = productRepository.find("S32_3207");
        System.out.println(product.getMSRP());
        LineItems lineItems = new LineItems(product);
        Cart cart = new Cart();
        cart.add(lineItems);
        cart.add(lineItems);
        cart.add(lineItems);
        product = productRepository.find("S700_2824");
        lineItems = new LineItems(product);
        cart.add(lineItems);
        System.out.println(product.getMSRP()*4);
        System.out.println(cart.getTotalPrice());
        for(LineItems item : cart.getItems()){
            System.out.println(item.getProduct().getProductCode() + ": " + item.getProduct().getProductName() + " Amount: " + item.getAmount());
        }


    }
}
