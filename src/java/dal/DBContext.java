
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;

/**
 * The class create connection with database and helps other classes to get
 * connection to the database
 *
 * @author Admin
 */
public class DBContext {

    /**
     * Create attribute
     */
    private static InitialContext initialContext;
    private static Context context;
    private static String dbName;
    private static String serverName;
    private static String portNumber;
    private static String userName;
    private static String password;

    /**
     * Assign address to DBContext from file context
     *
     * It get name by <code>javax.naming.Context</code> object It is a
     * <code>javax.naming.InitialContext</code> object
     */
    @SuppressWarnings("UseSpecificCatch")
    public DBContext() {
        try {
            initialContext = new InitialContext();
            Object obj = initialContext.lookup("java:comp/env");
            context = (Context) obj;
            serverName = context.lookup("serverName").toString();
            dbName = context.lookup("dbName").toString();
            portNumber = context.lookup("portNumber").toString();
            userName = context.lookup("userName").toString();
            password = context.lookup("password").toString();
        } catch (Exception e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    /**
     * Return the connection helps other classes to get connection to the
     * database
     *
     * @throws ClassNotFoundException is defined as the common superclass of
     * exceptions thrown by reflective operations in core reflection
     * @throws SQLException is one of the basic classes of JDBC, and is
     * responsible for handling exceptions follow
     * <code>java.sql.SQLException</code> object
     * @return connection to connect database. It is a
     * <code>java.sql.Connection</code> object
     */
    public Connection getConnection() throws ClassNotFoundException, SQLException {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userName, password);
    }

    /**
     * CloseResultSet method, help closing connect with SqlServer
     *
     * @param rs is a <code>java.sql.ResultSet</code> object
     * @throws SQLException is a <code>java.sql.SQLException</code> object
     */
    public void closeResultSet(ResultSet rs) throws SQLException {
        if (rs != null && !rs.isClosed()) {
            rs.close();
        }
    }

    /**
     * ClosePreparedStatement method, help closing connect with SqlServer
     *
     * @param ps is a <code>java.sql.PreparedStatement</code> object
     * @throws SQLException is a <code>java.sql.SQLException</code> object
     */
    public void closePreparedStatement(PreparedStatement ps) throws SQLException {
        if (ps != null && !ps.isClosed()) {
            ps.close();
        }
    }

    /**
     * CloseConnection method, help closing connect with SqlServer
     *
     * @param con is a <code>java.sql.Connection</code> object
     * @throws SQLException is a <code>java.sql.SQLException</code> object
     */
    public void closeConnection(Connection con) throws SQLException {
        if (con != null && !con.isClosed()) {
            con.close();
        }
    }

    /**
     * Return address of file images, helps other class can get image from
     * database
     *
     * @throws Exception is a <code>java.sql.SQLException</code> object
     * @return address of file images. Is a <code>java.lang.String</code> object
     */
    public String getImagePath() throws Exception {
        return "images/";
    }
}
