package sit.int202.classicmodels.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AuthenticationFilter",servletNames = {"OfficeListServlet","AddToCartServlet","OrderHistoryServlet","HistoryDetailServlet"})
public class AuthenticationFilter implements Filter {
    private FilterConfig filterConfig;

    public void init(FilterConfig config) throws ServletException {
        this.filterConfig = config;
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException  {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpSession session = httpServletRequest.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.getWriter().write("<br><br><div class='container'> <div class=\"alert alert-warning\" role=\"alert\"> <h3>Please login first !!! </h3></div></div>");
        } else {
            chain.doFilter(request, response);
        }
    }
}
