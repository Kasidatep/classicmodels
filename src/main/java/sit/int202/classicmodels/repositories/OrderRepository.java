package sit.int202.classicmodels.repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import sit.int202.classicmodels.entities.Office;
import sit.int202.classicmodels.entities.Order;
import sit.int202.classicmodels.entities.OrderDetail;

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
        query.setParameter("userId", userId);
        List<Order> order = query.getResultList();
        em.close();
        return order;
    }
    public List<Order> findAll() {
        EntityManager em = getEntityManager();
        Query query = em.createNamedQuery("Order.FIND_ALL");
        List<Order> order = query.getResultList();
        em.close();
        return order;
    }

    public Order findByOrder(String order_number){
        Integer orderNo = Integer.valueOf(order_number);
        return getEntityManager().find(Order.class, orderNo);
    }
}
