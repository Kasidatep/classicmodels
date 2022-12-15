package sit.int202.classicmodels.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SignOutServlet", value = "/sign-out")
public class SignOutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
       // session.removeAttribute("user");
       // session.removeAttribute("cart");
        session.invalidate();
        response.getWriter().write("<br><br><div class='container'> <div class=\"alert alert-warning\" role=\"alert\"> <h3>Sign out successfully!!! </h3></div></div>");
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        System.out.println("Sign out successfully!!");
    }
}
