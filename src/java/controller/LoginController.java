
package controller;

import dao.StoreManagerDAO;
import model.Account;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {

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
        String logoutRequest = request.getParameter("logout");
        //if logoutRequest is not null
        if (logoutRequest != null) {
            //then remove all object on the session
            request.getSession().invalidate();
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
            String userName = request.getParameter("name");
            String password = request.getParameter("password");
            StoreManagerDAO studentRequestDAO = new StoreManagerDAO();
            //get account by user name and password
            Account acc = studentRequestDAO.getAccount(userName, password);
            //if account with the entered username and password exists
            if (acc != null && userName.trim().equals(acc.getUserName().trim())
                    && password.trim().equals(acc.getPassword().trim())) {
                request.getSession().setAttribute("name", acc.getDisplayName());
                response.sendRedirect(request.getContextPath() +"/home");
                return;
            } 
            request.setAttribute("name", userName);
            request.setAttribute("msg", "*Login failed!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
