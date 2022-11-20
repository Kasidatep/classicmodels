package sit.int202.classicmodels;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodels.entities.Product;
import sit.int202.classicmodels.repositories.EntityManagerBuilder;
import sit.int202.classicmodels.repositories.ProductRepository;

import java.util.List;

public class TestProduct {
    public static void main(String[] args) {
//        EntityManager em = EntityManagerBuilder.getEntityManager();
//        Query query = em.createQuery("SELECT p FROM Product p");
//        query.setFirstResult(0);
//        query.setMaxResults(20);
        ProductRepository repository = new ProductRepository();
        System.out.println("No. of Product : "+repository.countAll());
        List<Product> productList = repository.findAll(11);
        for(Product product : productList){
            System.out.println(product.getProductCode()+ ": " + product.getProductName());
        }
//        em.close;
    }

}
