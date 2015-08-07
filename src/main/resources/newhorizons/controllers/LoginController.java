/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources.newhorizons.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import resources.newhorizons.domain.UserSessionBean;
import resources.newhorizons.domain.GiftShopItemsBean;
import resources.newhorizons.services.UserSessionDB;

/**
 *
 * @author jsnrice
 */
// @WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private UserSessionBean user = null;
    private GiftShopItemsBean giftShopItems = null;
    HttpSession session;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        System.out.println("\n\n\nIN LoginController ProcessRequest");

        //check if submit button from gift_shop.jsp 
        //is not null. If not null, then check if user
        //object has been created before or not. If not,
        //create a user object, and pass it on to 
        //gift_shop_logged_in.jsp. 
        
        
        System.out.println("Submit new user: " + request.getParameter("submitnewuser"));
        if (request.getParameter("submitnewuser") != null) {
            System.out.println("New User Controller");
            String firstname = request.getParameter("firstName");
            String lastname = request.getParameter("lastName");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("passwd");
            
            if (!UserSessionDB.usernameExists(username)) {
                this.user = new UserSessionBean(firstname, lastname, email,
                        username, password);
                session = request.getSession();
                session.setAttribute("user", user);
                String url = "/gift_shop_logged_in.jsp";
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
                return;
            } else {
                String url = "/new_user.jsp";
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
                return;

            }

        }
        
        
        if (request.getParameter("submituserpassword") != null) {
            System.out.println("\n\nIN LoginController: submit");

            if (this.user == null) {

//Sample variables for user object
                String username = request.getParameter("username");
                String password = request.getParameter("passwd");

                if (UserSessionDB.usernameLogin(username, password)) {
                    this.user = UserSessionDB.selectUser(username);
                } else {
                    //create the UserSessionBean object 
                    System.out.println("Invalid Password");
                }
                //create a session and store the User 
                //object in the session 
                session = request.getSession();
                session.setAttribute("user", user);

                //create a items object that is used by 
                //gift_shop_logged_in.jsp to populate its 
                //items entries on the page
                //this.giftShopItems = new GiftShopItemsBean();
                //In a session object, store the gift items 
                session.setAttribute("giftShopItems", giftShopItems);

                System.out.println("\nif user == null, go to gift_shop_logged_in.jsp");

                String url = "/gift_shop_logged_in.jsp";
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
                return;
            }
        }
        
        //
        //NEED TO HAVE NEW USER FUNCTIONALITY HANDLED FROM gift_shop.jsp
        //

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
        return "Gift Shop Secure Login Controller";
    }// </editor-fold>

}
