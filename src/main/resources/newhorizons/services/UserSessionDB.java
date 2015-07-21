package resources.newhorizons.services;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import resources.newhorizons.domain.UserSessionBean;

/**
 *
 * @author Matt
 */
public class UserSessionDB {

    public static int insert(UserSessionBean user) {
        System.out.println("UserSessionDB Insert Start");
        ConnectionPool pool = ConnectionPool.getInstance();
        System.out.println("Received instance from pool");
        Connection connection = pool.getConnection();
        System.out.println("Received connection");
        PreparedStatement ps = null;
        String query
                = "INSERT INTO user (FirstName, LastName, "
                + "EmailAddress) "
                + "VALUES (?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmailAddress()); 
            System.out.println(ps.toString());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int update(UserSessionBean user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE user SET "
                + "FirstName = ?, "
                + "LastName = ?, "
                + "WHERE EmailAddress = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmailAddress());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int delete(UserSessionBean user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "DELETE FROM user "
                + "WHERE EmailAddress = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getEmailAddress());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static boolean emailExists(String emailAddress) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT EmailAddress FROM user "
                + "WHERE EmailAddress = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, emailAddress);
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static UserSessionBean selectUser(String emailAddress) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM user "
                + "WHERE EmailAddress = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, emailAddress);
            rs = ps.executeQuery();
            UserSessionBean user = null;
            if (rs.next()) {
                user = new UserSessionBean();
                user.setFirstName(
                        rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));
                user.setEmailAddress(
                        rs.getString("EmailAddress"));
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

}
