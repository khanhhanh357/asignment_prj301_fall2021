package controller;

import dao.StoreManagerDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CustomerOrder;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ViewRequestController", urlPatterns = {"/view"})
public class ViewOrderController extends HttpServlet {

    


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request is a <code>javax.servlet.http.HttpServletRequest</code>
     * object
     * @param response is a <code>javax.servlet.http.HttpServletResponse</code>
     * object
     *
     * @throws ServletException if a servlet-specific error occurs It is a
     * <code>javax.servlet.ServletException</code> object
     *
     * @throws IOException if an I/O error occurs It is a
     * <code>java.io.IOException</code> object
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
            if (request.getSession().getAttribute("name") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                StoreManagerDAO smdao = new StoreManagerDAO();
                CustomerOrder customerOrder = smdao.getOrderById(id);
                Product product = smdao.getProductById(customerOrder.getProductId());
                System.out.println(customerOrder.getFirstName());
                request.setAttribute("order", customerOrder);
                request.setAttribute("product", product);
                request.setAttribute("total", customerOrder.getQuantity() * product.getPrice());
                request.getRequestDispatcher("view.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/login");
            }
        } catch (Exception ex) {
            request.setAttribute("msg", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
