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
public class CheckoutController extends HttpServlet {

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
        
        System.out.println("\n\n\nIN CheckoutController ProcessRequest");
        
        GiftShopItemsBean tempItems = (GiftShopItemsBean) request.getSession().getAttribute("giftShopItems");
        UserSessionBean user = (UserSessionBean) request.getSession().getAttribute("user");

        //check if checkout button from gift_shop_logged_in.jsp 
        //is not null. If not null, retrieve the checked boxes,
        //setup user object with selected items which the user
        //intends to purchase
        if (request.getParameter("checkout") != null)
        {

            String[] items = request.getParameterValues("items");
            
            ArrayList<String> selectedItems = new ArrayList<String>(Arrays.asList(items));

            for (int i = 0; i < selectedItems.size(); i++)
            {
               String itemname = selectedItems.get(i);
               int itemprice = (Integer) tempItems.getItemsAndPricesDictionary().get(itemname);
               user.addItemToItems(itemname, itemprice);
            }
            
            //now set the updated user object back to session.
            //user object now contains items and their prices
            //which have been selected by the user
            request.getSession().setAttribute("user", user);
            
            //Send Updated user object to checkout.jsp
            //for display and calculation of cost initially
            RequestDispatcher resultsDispatcher
            = getServletConfig().getServletContext().getRequestDispatcher("/checkout.jsp");
            resultsDispatcher.forward(request, response); 
            return;
        } 
        
        //this if case is executed when Request from 
        //checkout.jsp received to remove an item
        if (request.getParameter("remove") != null)
        {
            String item = (String) request.getParameter("item");
            
            user.removeItemFromItems(item);
            
            //Send Updated user object back to checkout.jsp
            //for display and recalculation of cost
            RequestDispatcher resultsDispatcher
            = getServletConfig().getServletContext().getRequestDispatcher("/checkout.jsp");
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
