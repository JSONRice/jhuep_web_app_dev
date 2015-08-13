package resources.newhorizons.controllers;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import resources.newhorizons.domain.DiscoveriesBean;

/**
 * @author jsnrice
 */
public class DiscoveriesController extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(DiscoveriesController.class.getName());
    private DiscoveriesBean discoveriesBean = null;
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

        LOGGER.log(Level.INFO, "processRequest()");
        response.setContentType("text/html;charset=UTF-8");

        session = request.getSession();

        // User wishes to query discoveries database and see discoveries_results.jsp
        if (request.getParameter("queryDiscoveries") != null) {
            discoveriesBean = new DiscoveriesBean();
            LOGGER.log(Level.INFO, "Setting planetary entities from select[planets]");
            discoveriesBean.setPlanetaryEntities(request.getParameterValues("planets"));
            // Now that we the planetary entities have been set run the db query and store data for;
            // PARAMETER_DATA, ATMOSPHERE_DATA, RINGDATA
            discoveriesBean.planetaryEntityQuery();
        } 
        else if (request.getParameter("remove") != null) {
          // TODO: user wishes to remove a planetary entity item and rerun query report:
        }
        
        if (!response.isCommitted()) {
            // Else if no errors store our updated bean and dispatch (route) to the results page:
            session.setAttribute("discoveriesBean", discoveriesBean);
            String url = "/discoveries_results.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
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
