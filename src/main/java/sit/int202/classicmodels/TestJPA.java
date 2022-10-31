package sit.int202.classicmodels;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import sit.int202.classicmodels.entities.Office;

import java.util.List;

public class TestJPA {
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("classic-models");
        System.out.println((emf!=null)?"connected":"something wrong");
        EntityManager em = emf.createEntityManager();
        List<Office> offices = em.createQuery("select o from Office o").getResultList();
        offices.forEach(o-> System.out.println(o.getOfficeCode()+ ": "+ o.getCity()+ ", "+ o.getCountry()));
    }
}
