/*
 * Copyright(C) 2021, FPT University.
 * J3.L.P0010:
 * Student Request System
 *
 * Record of change:
 * DATE            Version             AUTHOR               DESCRIPTION
 * 2021-12-10      1.0                 Admin                First Implement
 */
package filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Manage access url of user, allow the user to continue or return the user to
 * the home page
 *
 * @author Admin
 */
@WebFilter(filterName = "AccessControl", urlPatterns = "/*")
public class AccessFilterController implements Filter {

    private static final boolean DEBUG = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public AccessFilterController() {
    }

    /**
     * Don't allow user to enter jsp page except ErrorPage.jsp and redirect user
     * to HomeControl servlet
     *
     * @param request go through each filter in turn to reach the endpoint
     * @param response go through each new filter in turn is officially returned
     * to the client
     * @param chain the next filter in the filter chain, and when the thread
     * ends, it invokes the target servlet.
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    @SuppressWarnings("CallToPrintStackTrace")
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (DEBUG) {
            log("AccessControl:doFilter()");
        }

        doBeforeProcessing(request, response);

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpRespone = (HttpServletResponse) response;
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = httpRequest.getSession();
        String myUrl = httpRequest.getServletPath();
        //if userId object not exist on the session then redirect to login page
//        if (session.getAttribute("name") == null) {
//            if (myUrl.endsWith("home")) {
//                httpRespone.sendRedirect(httpRequest.getContextPath() + "/login");
//                return;
//            }
//        }
        /*if userId object existed on the session and user redirect to login page
        then redirect to home page*/
//        if (session.getAttribute("name") != null
//                && myUrl.endsWith("login")
//                && request.getParameter("logout") == null) {
//            httpRespone.sendRedirect(httpRequest.getContextPath() + "/home");
//            return;
//        }
        //If url end with a .jsp extension then return to home page
//        if (myUrl.endsWith(".jsp") && !myUrl.contains("error.jsp")) {
//            httpRespone.sendRedirect(httpRequest.getContextPath() + "/home");
//            //check if user info not exist on the session then return to login page
//            return;
//        }

        Throwable problem = null;
        try {
            chain.doFilter(request, response);
        } catch (IOException | ServletException t) {

            // If an exception is thrown somewhere down the filter chain,
            // we still want to execute our after processing, and then
            // rethrow the problem after that.
            problem = t;
            t.printStackTrace();
        }

        doAfterProcessing(request, response);

        // If there was a problem, we want to rethrow it if it is
        // a known type, otherwise log it.
        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (DEBUG) {
            log("AccessControl:DoBeforeProcessing");
        }
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (DEBUG) {
            log("AccessControl:DoAfterProcessing");
        }
    }

    /**
     * Return the filter configuration object for this filter.
     *
     * @return
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    @Override
    public void destroy() {
    }

    /**
     * Init method for this filter
     *
     * @param filterConfig
     */
    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (DEBUG) {
                log("AccessControl:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AccessControl()");
        }
        @SuppressWarnings("StringBufferMayBeStringBuilder")
        StringBuffer sb = new StringBuffer("AccessControl(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    @SuppressWarnings({"ConvertToTryWithResources", "UseSpecificCatch"})
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    @SuppressWarnings("UseSpecificCatch")
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
