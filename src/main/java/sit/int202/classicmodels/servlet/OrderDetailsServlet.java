package sit.int202.classicmodels.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sit.int202.classicmodels.entities.Customer;
import sit.int202.classicmodels.entities.Order;
import sit.int202.classicmodels.repositories.CustomerRepository;
import sit.int202.classicmodels.repositories.OrderRepository;

import java.io.IOException;

@WebServlet(name = "OrderDetailServlet", value = "/detail")
    public class OrderDetailsServlet extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String orderNo = request.getParameter("no");
            OrderRepository order = new OrderRepository();
            // find by @id
            Order orders = order.findByOrder(orderNo);
            request.setAttribute("orders", orders);
            CustomerRepository customerRepository = new CustomerRepository();
            Customer cust = (Customer) request.getSession().getAttribute("customer");
            Customer customer = customerRepository.find(cust.getCustomerNumber());

            request.setAttribute("customer", customer);
            orders.getOrderNumber();
            getServletContext().getRequestDispatcher("/finalDetail.jsp").forward(request, response);

            System.out.println("Detail Order: "+ orderNo);
        }


}
