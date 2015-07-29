/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package setup;

import resources.newhorizons.domain.UserSessionBean;
import resources.newhorizons.services.UserSessionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.sql.DataSource;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
//import javax.activation.DataSource;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Matt
 */
public class StartupServlet extends HttpServlet {
    //@Resource(name = "NewHorizonsMysql")
    //private DataSource newHorizonsMysql;
//private Connection conn;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
public void init(){
    
}
//    public void init() throws ServletException {
//      	
//        
//        
//        
//        
//		InitialContext cxt = null;
//		//DataSource ds = null;
//		try {
//			cxt = new InitialContext();
//			newHorizonsMysql = (DataSource)cxt.lookup("java:/comp/env/NewHorizonsMysql");
//		}
//		catch (NamingException ex) {
//			throw new ServletException("naming context error", ex);
//		}
//		try {
//			conn = newHorizonsMysql.getConnection();
//                     
//		}
//		catch (SQLException ex) {
//			throw new ServletException("connection error", ex);
//		}  
//    try {
//       
//        Statement stmnt = conn.createStatement();
//        stmnt.executeUpdate("create table test_table2 (user_name int)");
//        stmnt.executeUpdate("insert into test_table2 values (3)");
//        ResultSet rs = stmnt.executeQuery("select * from test_table2");
//        //ResultSet rs = stmnt.executeQuery("insert into test_table values (2)");
//        System.out.println(rs.toString());
//   
//    } catch (SQLException ex) {
//        Logger.getLogger(StartupServlet.class.getName()).log(Level.SEVERE, null, ex);
//    } 
//} 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("Init");
    UserSessionBean userBean = new UserSessionBean();
    userBean.setUsername("Matt Pavan");
    userBean.setAddress1("123 Sesame St");
    userBean.setAddress2("Somewhere MD 12345");
    userBean.setPassword("newhorizons");
    userBean.setEmailAddress("matthew.pavan@gmail.com");
    //System.out.println(userBean.toString());
    System.out.println(UserSessionDB.insert(userBean));
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StartupServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StartupServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
