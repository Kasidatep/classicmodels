package sit.int202.classicmodels.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodels.entities.Customer;
import sit.int202.classicmodels.entities.Order;
import sit.int202.classicmodels.repositories.OfficeRepository;
import sit.int202.classicmodels.repositories.OrderRepository;

import java.io.IOException;

@WebServlet(name = "OrderHistoryServlet", value = "/history")
public class OrderHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer user = (Customer) session.getAttribute("user");
        OrderRepository order = new OrderRepository();
        request.setAttribute("orders", order.findByUserId(user.getCustomerNumber()));
        //request.setAttribute("orders", order.findAll());
       // getServletContext().getRequestDispatcher("/history.jsp").forward(request, response);
        getServletContext().getRequestDispatcher("/orderhistory.jsp").forward(request, response);

        System.out.println("OrderBy: "+user.getCustomerName());
    }
}
