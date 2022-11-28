package sit.int202.classicmodels.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodels.entities.Order;

import java.util.List;

public class OrderRepository {
    private EntityManager entityManager;
    private EntityManager getEntityManager() {
        if (entityManager == null || !entityManager.isOpen()) {
            entityManager = EntityManagerBuilder.getEntityManager();
        }
        return entityManager;
    }

    public Order find(int userId){
        return getEntityManager().find(Order.class, userId);
    }

    public List<Order> findByUserId(int userId) {
        EntityManager em = getEntityManager();
        Query query = em.createNamedQuery("Order.FIND_BY_USER");
        List<Order> order = query.getResultList();
        query.setParameter("userId", userId);
        em.close();
        return order;
    }
}
