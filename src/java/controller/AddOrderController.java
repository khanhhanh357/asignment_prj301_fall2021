
package controller;

import dao.StoreManagerDAO;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            request.getRequestDispatcher("add.jsp").forward(request, response);
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
