package dao;

import context.DBContext;
import model.Account;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.CustomerOrder;
import model.Product;

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

    public List<CustomerOrder> getOrders(String customerName, int month) throws SQLException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<CustomerOrder> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM dbo.[Order] AS o \n"
                    + "INNER JOIN Customer AS c ON o.customerID = c.id \n"
                    + "WHERE (c.firstName LIKE ? OR c.lastName LIKE ?) \n";

            conn = getConnection();
            if (month >= 0) {
                System.out.println("in here");
                query += "AND orderdate between ? and ? ";
            }
            query += "ORDER BY o.orderdate DESC";
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + customerName + "%");
            ps.setString(2, "%" + customerName + "%");
            int paramCount = 3;
            if (month >= 0) {
                Date fromDate = Date.valueOf(LocalDateTime.now().minusMonths(month).toLocalDate().withDayOfMonth(1));
                LocalDate lc = LocalDateTime.now().minusMonths(month).toLocalDate();
                YearMonth ym = YearMonth.from(lc);
                Date toDate = Date.valueOf(ym.atEndOfMonth());
                ps.setDate(paramCount, fromDate);
                ++paramCount;
                ps.setDate(paramCount, toDate);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                CustomerOrder cOrder = new CustomerOrder(rs.getInt("id"),
                        rs.getInt("productID"), rs.getInt("customerID"),
                        rs.getDate("orderDate"), rs.getInt("quantity"),
                        rs.getString("firstName"), rs.getString("lastName"));
                list.add(cOrder);
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(conn);
        }
        return list;
    }

    public CustomerOrder getOrderById(int id) throws SQLException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        CustomerOrder customerOrder = null;
        try {
            String query = "SELECT * FROM dbo.[Order] AS o \n"
                    + "INNER JOIN Customer AS c ON o.customerID = c.id \n"
                    + "WHERE o.id = ? \n";
            conn = getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                customerOrder = new CustomerOrder(rs.getInt("id"),
                        rs.getInt("productID"), rs.getInt("customerID"),
                        rs.getDate("orderDate"), rs.getInt("quantity"),
                        rs.getString("firstName"), rs.getString("lastName"));
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(conn);
        }
        return customerOrder;
    }

    public List<Product> getProducts() throws SQLException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Product> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM Product";
            conn = getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt("id"),
                        rs.getString("name"), rs.getFloat("price"));
                list.add(product);
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(conn);
        }
        return list;
    }

    public Product getProductById(int id) throws SQLException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Product product = null;
        try {
            String query = "SELECT * FROM Product WHERE id = ?";
            conn = getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product(rs.getInt("id"),
                        rs.getString("name"), rs.getFloat("price"));
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(conn);
        }
        return product;
    }

    public int insertCustomer(Customer customer) throws SQLException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int genId = 0;
        try {
            String query = "INSERT INTO [Customer] (firstName, lastName) VALUES(?, ?)";
            conn = getConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, customer.getFirstName());
            ps.setString(2, customer.getLastName());
            ps.execute();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                genId = rs.getInt(1);
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(conn);
        }
        return genId;
    }

    public int insertOrder(int pId, int cId, Date orderDate, int quantity) throws SQLException, Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int genId = 0;
        try {
            String query = "INSERT INTO dbo.[Order] (productID, customerID, orderdate, quantity) VALUES(?, ?, ?, ?)";
            conn = getConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, pId);
            ps.setInt(2, cId);
            ps.setDate(3, orderDate);
            ps.setInt(4, quantity);
            ps.execute();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                genId = rs.getInt(1);
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(ps);
            closeConnection(conn);
        }
        return genId;
    }
}
