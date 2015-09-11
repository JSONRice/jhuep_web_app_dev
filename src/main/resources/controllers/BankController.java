package resources.controllers;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import resources.services.LookupService;

/**
 * @author jsnrice
 */
public class BankController extends HttpServlet {
    private final static Logger LOGGER = Logger.getLogger(BankController.class.getName());
    private LookupService lookupService = new LookupService();
    private HttpSession session;

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
        session = request.getSession();

        String idStr = request.getParameter("id");
        
        if (idStr == null || idStr.equals("")) {
            String msg = "Invalid ID";
            LOGGER.severe(msg);
            throw new NullPointerException(msg);
        }
        LOGGER.log(Level.INFO, "Detected: {0}", idStr);
        int id = 0;
        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException nfe) {
            // If overflow or underflow then set id to zero:
            id = 00;
        }
        if (id <= 0) {
            LOGGER.severe("id <= 0 dispatching to error.jsp");
            request.setAttribute("idStr", idStr);        
            RequestDispatcher errorDispatcher
                    = getServletConfig().getServletContext().getRequestDispatcher("/error.jsp");
            errorDispatcher.forward(request, response);
        }

        // If there was an exception and a previous redirect, prevent the folowing redirect:            

        if (!response.isCommitted()) {
            // Else if no errors store our updated bean and dispatch (route) to the results page:
            request.setAttribute("customer", lookupService.findCustomer(id));
            request.setAttribute("id", idStr);
            LOGGER.info("dispatching to results.jsp");
            RequestDispatcher resultsDispatcher
                    = getServletConfig().getServletContext().getRequestDispatcher("/results.jsp");
            resultsDispatcher.forward(request, response);
        }
        else {
            LOGGER.warning("response was previously commited");            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     *
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
        return "Bank servlet";
    }// </editor-fold>

}
