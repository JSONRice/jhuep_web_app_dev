/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources.newhorizons.services;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.sql.*;
import java.util.Arrays;
import javax.sql.DataSource;
import javax.naming.InitialContext;

public class ConnectionPool {

    private static ConnectionPool pool = null;
    private static DataSource dataSource = null;

    private ConnectionPool() {
        try {
            InitialContext ic = new InitialContext();
            MysqlDataSource dataSourceMsql = new MysqlDataSource();
            dataSourceMsql.setDatabaseName("newhorizons");
            dataSourceMsql.setUser("nhuser");
            dataSourceMsql.setPassword("nhpass");
            dataSourceMsql.setServerName("db4free.net");
            //<Resource auth="Container" driverClassName="com.mysql.jdbc.Driver" maxActive="20" maxIdle="10" maxWait="-1" name="NewHorizonsMysql" password="nhpass" type="javax.sql.DataSource" url="jdbc:mysql://db4free.net:3306/newhorizons?zeroDateTimeBehavior=convertToNull" username="nhuser"></Resource>
            dataSource = (DataSource) dataSourceMsql;
            
            
            //dataSource = (DataSource) ic.lookup("java:/comp/env/NewHorizonsMysql");
            } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            
        }
    }

    public static ConnectionPool getInstance() {
        if (pool == null) {
            pool = new ConnectionPool();
        }
        return pool;
    }

    public Connection getConnection() {
        try {
            return dataSource.getConnection();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return null;
        }
    }

    public void freeConnection(Connection c) {
        try {
            c.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}
