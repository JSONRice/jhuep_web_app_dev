
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ page import="java.util.*" %>

<jsp:useBean id="user" scope="session" class="resources.newhorizons.domain.UserSessionBean"></jsp:useBean>
<jsp:useBean id="giftShopItems" scope="session" class="resources.newhorizons.domain.GiftShopItemsBean"></jsp:useBean>

<!--Get parameters values from the gift items bean 
to setup items in the jsp. Create a Dictionary 
containing key value pair of all the items and their 
prices.
-->
<% 
Dictionary costDict = giftShopItems.getItemsAndPricesDictionary();
%>



<!--Get parameters values from the html form 
which are contained in the request object
-->
<% 
String name  = user.getFirstName() + " " + user.getLastName();
String email = user.getEmailAddress();
String username = user.getUserName();
ArrayList<String> selectedItems = user.getSelectedItemsList();
int itemprice = 0;
%>


<!--Create an ArrayList that would contain the cost of 
each course and additional charges for a particular user
Note that adding an ! makes the List object global/static.
-->
<%!
List userCostArray = new ArrayList();
%>



<!--Add the cost of each item to a instance 
array for the particular user.
-->
<%! 
public void incrementCost(int cost)
{
   System.out.println("\n\nFROM checkout.jsp saveDisplayCost cost of item: " + cost);
   userCostArray.add(cost);
}
%>


<!--This method adds up all the costs saved for
particular user in the Array. 
-->
<%! 
public int calculateCost()
{
    int sum = 0;
    for (int i = 0; i < userCostArray.size(); i++)
    {
       sum = sum + (Integer)userCostArray.get(i);
    }
    return sum;
}
%>



<!DOCTYPE html>
<html>
    <head>
        <title>Checkout</title>
        <link href="css/hw.css" rel="stylesheet" type="text/css" />
        <link href="css/master.css" rel="stylesheet" type="text/css" />        
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/indexErrorHandler.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <form id="form" action="CheckoutController" method="post">
            
        <div id="info">
            <br>
        
            <%
            userCostArray = new ArrayList();
            %>
        
        
        <table cellspacing="5" border="0">
            <tr>
                <td align="left">Your Name:</td>
                <td><%= name %></td>
            </tr>
            
            <tr>
                <td align="left">Your username: </td>
                <td><%= username %></td>
            </tr>
            
            <tr>
                <td align="left">Your e-mail confirmation will be sent to:</td>
                <td><%= email %></td>
            </tr>
            
        </table>
    </div>
            
    <div id="calculation">
        <br>
        <table BORDER="1"  WIDTH="50%"   CELLPADDING="1" CELLSPACING="1">  
          
          <th>Your Items</th>
  	  <th>Cost</th>
          
        <%
        // returns the values of items selected in list box.
        for (int i = 0; i < selectedItems.size(); i++){
        %>
        <tr>
            <td align="left"><%= selectedItems.get(i) %></td>
            <%itemprice = (Integer)costDict.get(selectedItems.get(i)); %>
            <%incrementCost(itemprice); %>
            <td>$<%= itemprice %></td>
            
        <td>
            <form action="CheckoutController" method="get">
                <input type="hidden" name="item" value="<%= selectedItems.get(i) %>" />
                <input type="submit" value="Remove from Cart" name="remove">
            </form>
        </td>
            
            
        </tr>
        
        <%
        }
        %>   
        </table>
        
        <br>
        <table BORDER="1"  WIDTH="50%"   CELLPADDING="1" CELLSPACING="1">  
        <tr>
            <td align="right">Total:</td>
            <td>$<%= calculateCost() %></td>
        </tr>
        
        <br>
        <br>
        <tr>
            <td align="right">Proceed to Payment Options</td>
            <td>
            <form action="PaymentController" method="get">
                <input type="submit" value="Pay" name="pay">
            </form>
            </td>
        </tr>
        
      
        </table>  

    </div>                                
        </form>
    </body>
</html>
