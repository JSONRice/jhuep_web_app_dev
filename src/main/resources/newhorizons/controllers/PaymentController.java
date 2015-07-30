/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package resources.newhorizons.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import resources.newhorizons.domain.UserSessionBean;
import resources.newhorizons.domain.GiftShopItemsBean;

import java.util.*;
import java.io.*;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Sajjad
 */
public class PaymentController extends HttpServlet {

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
            throws ServletException, IOException 
    {
        
        response.setContentType("text/html;charset=UTF-8");
        
        System.out.println("\n\n\nIN PaymentController ProcessRequest");
        
        UserSessionBean user = (UserSessionBean) request.getSession().getAttribute("user");
        
        
        //check if payment button from checkout.jsp 
        //is not null. If not null, call the user calculate
        //price for the items selected and move forward
        //to payment.jsp
        if (request.getParameter("pay") != null)
        {
            System.out.println("\n\nIN PaymentController: Pay clicked");
            int cost = user.getSelectedItemsTotalCost();
            System.out.println("\nIN PaymentController: Total Price: " + cost);
            
            //forward to payment.jsp for options
            //for payment
            RequestDispatcher resultsDispatcher
            = getServletConfig().getServletContext().getRequestDispatcher("/payment.jsp");
            resultsDispatcher.forward(request, response); 
            return;
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

