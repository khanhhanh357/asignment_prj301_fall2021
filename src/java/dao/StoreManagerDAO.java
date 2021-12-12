package dao;

import context.DBContext;
import model.Account;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class StoreManagerDAO extends DBContext {

    public Account getAccount(String userName, String password) throws SQLException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Account account = null;
        try {
            String query = "SELECT * FROM [Account] WHERE userName = ? AND [password] = ?";
            conn = getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                account = new Account(rs.getString(1), rs.getString(2), rs.getString(3));
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(conn);
        }
        return account;
    }
    

}
