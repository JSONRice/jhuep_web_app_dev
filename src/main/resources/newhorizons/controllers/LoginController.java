/**
 * *
 * @description The login controller manages new users and previously known user
 * logins into the Gift Shop.
 * @date Aug. 6, 2015
 */
package resources.newhorizons.controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import resources.newhorizons.domain.UserSessionBean;
import resources.newhorizons.domain.GiftShopItemsBean;

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
        if (request.getParameter("submitnewuser") != null) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("passwd");

            //create the UserSessionBean object 
            this.user = new UserSessionBean(firstName, lastName, email, username, password);

        }
        if (request.getParameter("submituserpassword") != null) {

            String username = request.getParameter("username");
            String password = request.getParameter("passwd");

            //create the UserSessionBean object 
            this.user = new UserSessionBean(username, password);
        }
                //create a session and store the User 
        //object in the session 
        session = request.getSession();
        session.setAttribute("user", user);

                //create a items object that is used by 
        //gift_shop_logged_in.jsp to populate its 
        //items entries on the page
        this.giftShopItems = new GiftShopItemsBean();
        this.giftShopItems.setItemsAndImagesDictionary();
        this.giftShopItems.setItemsAndPricesDictionary();

        //In a session object, store the gift items 
        session.setAttribute("giftShopItems", giftShopItems);

        System.out.println("\nif user == null, go to gift_shop_logged_in.jsp");

        String url = "/gift_shop_logged_in.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
        return;
    }

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
