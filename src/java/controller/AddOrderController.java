package controller;

import dao.StoreManagerDAO;
import java.io.IOException;
import java.rmi.server.ExportException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SolveRequestController", urlPatterns = {"/add"})
public class AddOrderController extends HttpServlet {

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
                StoreManagerDAO smdao = new StoreManagerDAO();
                List<Product> listProducts = smdao.getProducts();
                request.setAttribute("listProducts", listProducts);
                request.getRequestDispatcher("add.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/login");
            }
        } catch (Exception ex) {
            request.setAttribute("msg", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (request.getSession().getAttribute("name") != null) {
                StoreManagerDAO smdao = new StoreManagerDAO();
                String firstName = request.getParameter("firstName");
                System.out.println(firstName);
                String lastName = request.getParameter("lastName");
                System.out.println(lastName);
                int productId = Integer.parseInt(request.getParameter("product"));
                System.out.println(productId);
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                System.out.println(quantity);
                int customerId = smdao.insertCustomer(new Customer(firstName, lastName));
                Date date = Date.valueOf(LocalDate.now());
                if (customerId > 0) {
                    if (smdao.insertOrder(productId, customerId, date, quantity) > 0) {
                        response.sendRedirect(request.getContextPath() + "/home");
                    } else {
                        throw new ExportException("Add order failed");
                    }
                } else {
                    throw new ExportException("Add order failed");
                }
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
