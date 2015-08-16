package resources.newhorizons.controllers;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import resources.newhorizons.services.DiscoveriesDBService;

/**
 * @description This ad-hoc controller serves up images from the NEWHORIZONS database and is
 * mainly used to return a planetary entity image.
 * @author jsnrice
 */
public class ImageController extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(ImageController.class.getName());
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @description Retrieve the image for a planetary entity.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.log(Level.INFO, "doGet() returning image to browser.");
        response.setContentType("image/jpeg");
        response.setContentType("image/gif");
        String name = request.getParameter("name");
        byte[] imageBytes = DiscoveriesDBService.blobQuery("IMAGE", name);
        response.setContentLength(imageBytes.length);
        response.getOutputStream().write(imageBytes);
        response.getOutputStream().flush();
        LOGGER.log(Level.INFO, "doGet() stream flushed and image bytes returned to browser.");        
    }
}
