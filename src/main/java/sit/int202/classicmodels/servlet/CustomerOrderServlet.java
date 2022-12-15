package sit.int202.classicmodels.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import sit.int202.classicmodels.entities.Customer;
import sit.int202.classicmodels.entities.Order;
import sit.int202.classicmodels.repositories.CustomerRepository;
import sit.int202.classicmodels.repositories.OrderRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerOrderServlet", value = "/order")
public class CustomerOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("id"));
        CustomerRepository customerRepository = new CustomerRepository();
        Customer customer = customerRepository.find(customerId);
        request.getSession().setAttribute("customer", customer);
        OrderRepository order = new OrderRepository();
        System.out.println(customer);
        List<Order> orders = order.findByUserId(customerId);
        System.out.println(orders);
        request.setAttribute("Orders", orders);
        getServletContext().getRequestDispatcher("/final.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
