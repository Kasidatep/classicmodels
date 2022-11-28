package sit.int202.classicmodels.servlet;

import at.favre.lib.crypto.bcrypt.BCrypt;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodels.entities.Customer;
import sit.int202.classicmodels.repositories.CustomerRepository;

import java.io.IOException;

@WebServlet(name = "AuthenticationServlet", value = "/auth")
public class AuthenticationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String userName = request.getParameter("userName");
        if(userName==null || userName.trim().length()==0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;    }
        CustomerRepository customerRepository = new CustomerRepository();
        Customer customer = customerRepository.findByName(userName);
        if (customer==null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
        } else {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), customer.getPassword());
            if (!result.verified) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            } else {
                request.getSession().setAttribute("user", customer);
            }
        }
    }
}
