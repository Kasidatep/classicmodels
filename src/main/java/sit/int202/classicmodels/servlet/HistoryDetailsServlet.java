package sit.int202.classicmodels.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import sit.int202.classicmodels.entities.Customer;
import sit.int202.classicmodels.entities.Order;
import sit.int202.classicmodels.entities.OrderDetail;
import sit.int202.classicmodels.repositories.OrderRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HistoryDetailServlet", value = "/history-order-detail")
    public class HistoryDetailsServlet extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String orderNo = request.getParameter("orderNo");
            OrderRepository order = new OrderRepository();

            request.setAttribute("orders", order.find(Integer.parseInt(orderNo)));
            Order orders =  order.find(Integer.parseInt(orderNo));
            double total = 0.00;
            for (OrderDetail orderDetail : orders.getOrderDetails()) {
               total +=  orderDetail.getQuantityOrdered() * orderDetail.getPriceEach();
            }
            request.setAttribute("totalPrice",total);
            getServletContext().getRequestDispatcher("/history-detail.jsp").forward(request, response);
            System.out.println("Detail Order: "+ orderNo);
        }


}
