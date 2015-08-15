



<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ page import="java.util.*" %>

<jsp:useBean id="user" scope="session" class="resources.newhorizons.domain.UserSessionBean"></jsp:useBean>
<jsp:useBean id="giftShopItems" scope="session" class="resources.newhorizons.domain.GiftShopItemsBean">
    <%
        giftShopItems.setItemsAndImagesDictionary();
        giftShopItems.setItemsAndPricesDictionary();        
    %>
</jsp:useBean>

<!--Get parameters values from the gift items bean 
to setup items in the jsp
-->


<%
        System.out.println("First name: " + user.getFirstName());
    if (user.getFirstName() == null){
        System.out.println("Entered redirect");
   response.sendRedirect("gift_shop.jsp");
    }
%>
<% 
    Enumeration itemkeys  = giftShopItems.getItemsKeys();
%>



<!DOCTYPE html>
<html>
    <head>
        <title>Gift Shop</title>
        <link href="css/hw.css" rel="stylesheet" type="text/css" />
        <link href="css/master.css" rel="stylesheet" type="text/css" />        
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/indexErrorHandler.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <form id="form" action="CheckoutController" method="post">
            <table>
                <tr>
                    <td>
                        <h1 class="main-title">Gift Shop Items</h1>            
                    </td>
                </tr>    
                <tr>
                    <td>
                        <h1 class="title">Select one or more items for sale:</h1>            
                    </td>
                </tr>    

                <tr class="empty-row"/>
                <tr>
                    <td>
                        <fieldset id="credentials">
                            <legend>Items for Sale:</legend>
                            <br>
                            <% System.out.println("\ngift_shop_logged_in.jsp"); %>
                            <% while (itemkeys.hasMoreElements()) { %>
                            <% String itemName = (String) itemkeys.nextElement(); %>
                            
                            <% System.out.println("itemName: " + itemName); %>
                            
                            <% String itemImageLoc = (String) giftShopItems.getItemsAndImagesDictionary().get(itemName); %>
                            <% String itemPrice = giftShopItems.getItemsAndPricesDictionary().get(itemName).toString(); %>
                            <% System.out.println("itemImageLoc: " + itemImageLoc); %>
                            
                            <br>
                            <div id= <%=itemName%> class = "item">
                                <input type="checkbox" 
                                       name="items" value=<%=itemName%>>
                                 <input type="image" name=<%=itemName%> src=<%=itemImageLoc%>
                                       class="itemimage" alt=<%=itemName%> title=<%=itemName%>/>
                                <br/>
                                <span><%=(itemName + ": $" + itemPrice)%></span>
                              </div>
                              <br/>
                              
                            <% } %>
                            
                            <div id="submitbuttons">
                                <input id="submit" type="submit" name="checkout" value="Add to Cart"/> 
                            </div>                            
                        </fieldset>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
