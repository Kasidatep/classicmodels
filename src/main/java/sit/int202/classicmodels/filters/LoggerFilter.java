package sit.int202.classicmodels.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

//@WebFilter(filterName = "LoggerFilter", urlPatterns = "/*")
//@WebFilter(filterName = "LoggerFilter", servletNames = {"ProductListServlet","AddToCartServlet"})
@WebFilter(filterName = "LoggerFilter")
public class LoggerFilter implements Filter {
    private FilterConfig config;

    public void init(FilterConfig config) throws ServletException {
        this.config = config;
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        //in
        long before = System.currentTimeMillis();
        // invoke resource
        chain.doFilter(request, response);
        //out
        long duration = System.currentTimeMillis() - before;
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String message = "Servlet duration of "+httpServletRequest.getRequestURI() +": " + duration +" ms.";
        config.getServletContext().log(message);
    }
}
