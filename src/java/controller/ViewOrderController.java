/*
 * Copyright(C) 2021, FPT University.
 * J3.L.P0010:
 * Student Request System
 *
 * Record of change:
 * DATE            Version             AUTHOR               DESCRIPTION
 * 2021-12-10      1.0                 Admin                First Implement
 */
package controller;

import dao.StoreManagerDAO;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ViewRequestController", urlPatterns = {"/view"})
public class ViewOrderController extends HttpServlet {

    
    /*convert string into java.sql.Date*/
    private Date parseToDate(String str) {
        try {
            if (str == null) {
                str = "";
            }
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = simpleDateFormat.parse(str);
            Date date = new java.sql.Date(utilDate.getTime());
            return date;
        } catch (ParseException e) {
            return null;
        }
    }

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
            request.getRequestDispatcher("view.jsp").forward(request, response);
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
