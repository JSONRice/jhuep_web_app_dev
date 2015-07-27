/*
*ContactUsController
*Added: July 22, 2015
*ContactUsController is invoked whena  user press a Send
*Feedback button in contact_us.jsp. Once the Controller is 
*is invoked, it collects the parameters from contact_us.jsp
*stored in the request object. Then EmailSenderBean instance
*is created and the parameters are sned to EmailSenderBean
*to be included in an email and sent to the New Horizons
*Team D gmail address. Note that email is created from
*and sent to the same newhorizonsteamd@gmail.com address.
 */
package resources.newhorizons.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import resources.newhorizons.domain.EmailSenderBean;

/**
 *
 * @author Sajjad
 */
public class ContactUsController extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(ContactUsController.class.getName());

    
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
        PrintWriter out = response.getWriter();
        
        String emailstatus = "Email Status Not Available. Please submit feedback later.";
        
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ContactUsController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContactUsController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            //get all the parameters from request object
            String name  =(String)request.getParameter("name");
            String email =(String)request.getParameter("email");
            String suggestions = (String) request.getParameter("suggestions");
            String rating = (String) request.getParameter("rating");
            
            
            EmailSenderBean sendemail = new EmailSenderBean();
            try
            {
                EmailSenderBean.sendMail("newhorizonsteamd@gmail.com", 
                                    "newhorizonsteamd@gmail.com", name, 
                                    email + "\n" + suggestions + "\n" + rating + " star rating", 
                                    false);
                emailstatus = "Email Sent to New Horizon Team D. Thank you for your suggestions.";
            }
            catch (MessagingException e)
            {
                LOGGER.log(Level.SEVERE, "\nSending email failed:\n");
                LOGGER.log(Level.SEVERE, e.getMessage());                
                emailstatus = "\nERROR in Sending Email.\n" + e.getMessage();
            }
            
            //forward to email confirmation page to let the
            //user know email has been either sent or not sent
            request.setAttribute("emailstatus", emailstatus);
            RequestDispatcher resultsDispatcher
                = getServletConfig().getServletContext().getRequestDispatcher("/email_confirmation.jsp");
            resultsDispatcher.forward(request, response);
            
        } finally {
            LOGGER.log(Level.INFO, "\n\nClosing output stream in ContactUsController");
            out.close();
        }
        return;        
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
        return "Contact Us Controller";
    }// </editor-fold>

}
