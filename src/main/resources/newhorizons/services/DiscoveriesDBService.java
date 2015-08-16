package resources.newhorizons.services;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import resources.newhorizons.controllers.MainController;

/**
 * @author jsnrice
 * @description Contains the Discoveries transactional queries employed by the
 * Discoveries service and utilized within the Discoveries view. Transactions
 * should strictly be READ-ONLY.
 */
public class DiscoveriesDBService {

    private final static Logger LOGGER = Logger.getLogger(MainController.class.getName());

    private static final String tableName = "PLANETARY_ENTITY";

    /**
     * @description Given an id (pk) return the tuple (row) associated with that
     * id (pk) as a csv string.
     * @param id
     * @return
     */
    public static String getTuple(final int id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet result;
        String csvTuple = "";

        if (id <= 0) {
            LOGGER.log(Level.WARNING, "getTuple(): param id <= 0\n");
            return "";
        }
        final String query = "SELECT * FROM " + tableName + " WHERE id='" + Integer.toString(id) + "'";

        try {
            ps = connection.prepareStatement(query);
            result = ps.executeQuery(query);
            csvTuple = convertToCsv(result);        
        } catch (SQLException e) {
            e.printStackTrace(System.out);
            return "";
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
        return csvTuple;
    }
        
    /**
     * @description Get parameter data.
     * @param name Planet or moon name.
     * @return 
     */
    public static String getParameterData(final String name) {
       return basicQuery("PARAMETER_DATA", name);
    }

    /**
     * @description Get atmosphere data.
     * @param name Planet or moon name.
     * @return 
     */
    public static String getAtmosphereData(final String name) {
       return basicQuery("ATMOSPHERE_DATA", name);
    }

    /**
     * @description Get ring data.
     * @param name Planet or moon name.
     * @return 
     */
    public static String getRingData(final String name) {
       return basicQuery("RINGDATA", name);
    }
    
    /**
     * @description Get moon survey data.
     * @param name Planet or moon name.
     * @return 
     */
    public static String getMoonSurvey(final String name) {
       return basicQuery("MOON_SURVEY", name);
    }
    
    /**
     * @description Get the image.
     * @param name Planet or moon name.
     * @return
     */
    public static byte[] getImage(final String name) {
        return blobQuery("IMAGE", name);
    }
    
    /**
     * @description Perform a BLOB based query for an item such as an image.
     * @param col column to query against (e.g. "IMAGE")
     * @param name name of planet or moon to query on.
     */
    public static byte[] blobQuery(final String col, final String name) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet result;
        Blob image = null;

        if (name == null || name.isEmpty()) {
            LOGGER.log(Level.WARNING, "basicQuery(): param name null || isEmpty\n");
            return null;
        }
        
        final String query = "SELECT " + col + " FROM " + tableName + " WHERE NAME ='" + name +"'";
        
        try {
            ps = connection.prepareStatement(query);
            result = ps.executeQuery(query);
            // There will only be one item to return
            if (result.next()){
                image = result.getBlob(1);
                byte[] resultBlob = image.getBytes(1, (int) image.length());
                return resultBlob;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
            return null;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
        // This should never get called if the query runs successfully.
        return null;
    }
    
    /**
     * @description Perform a basic query returning data associated with just one parameter string.
     * 
     * Example: 
     * To perform the following:
     *  SELECT PARAMETER_DATA FROM PLANETARY_ENTITY WHERE NAME = 'Jupiter'
     * The table would be "PARAMETER_DATA" and the name would be "Jupiter"
     * 
     * @param col - column to query against
     * @param name - name of planet or moon to query on
     * @return Query string
     */
    public static String basicQuery(final String col, final String name) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet result;
        String resultStr = "";

        if (name == null || name.isEmpty()) {
            LOGGER.log(Level.WARNING, "basicQuery(): param name null || isEmpty\n");
            return "";
        }
        
        final String query = "SELECT " + col + " FROM " + tableName + " WHERE NAME ='" + name +"'";
        
        try {
            ps = connection.prepareStatement(query);
            result = ps.executeQuery(query);
            // There will only be one item to return
            if (result.next()){
                resultStr = result.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
            return "";
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
        return resultStr;         
    }
    

    /**
     * @description Helper method for returning the result as a csv string.
     * @param rs
     * @return
     * @throws SQLException 
     */
    public static String convertToCsv(ResultSet rs) throws SQLException {
        ResultSetMetaData meta = rs.getMetaData();
        int numberOfColumns = meta.getColumnCount();
        /*        
         String dataHeaders = "\"" + meta.getColumnName(1) + "\"";
         for (int i = 2; i < numberOfColumns + 1; i++) {
         dataHeaders += ",\"" + meta.getColumnName(i) + "\"";
         }
         */
        String row = "";
        while (rs.next()) {
            row = "\"" + rs.getString(1) + "\"";
            for (int i = 2; i < numberOfColumns + 1; i++) {
                row += ",\"" + rs.getString(i) + "\"";
            }
        }
        return row;
    }
}
