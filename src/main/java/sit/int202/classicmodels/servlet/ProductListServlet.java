package sit.int202.classicmodels.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodels.entities.Product;
import sit.int202.classicmodels.repositories.ProductRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductListServlet", value = "/product-list")
public class ProductListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductRepository productRepository = new ProductRepository();
        int page = (request.getParameter("page")==null)?1: Integer.parseInt(request.getParameter("page"));
        int size = (request.getParameter("size")==null)?productRepository.getSize():Integer.parseInt(request.getParameter("size"));
        int itemCount = productRepository.countAll();
        int totalPage = itemCount/size + (itemCount%size==0 ? 0 : 1) ;
        List<Product> productList =  productRepository.findAll(page, size);
        request.setAttribute("products", productList);
        request.setAttribute("page", page);
        request.setAttribute("pageSize", size);
        request.setAttribute("totalPage",totalPage);
        System.out.println("Product: Page=" +page+" Size="+size);
        getServletContext().getRequestDispatcher("/product-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
