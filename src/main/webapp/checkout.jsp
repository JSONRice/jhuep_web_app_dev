
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
    String name = user.getFirstName() + " " + user.getLastName();
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
    public void incrementCost(int cost) {
        System.out.println("\n\nFROM checkout.jsp saveDisplayCost cost of item: " + cost);
        userCostArray.add(cost);
    }
%>


<!--This method adds up all the costs saved for
particular user in the Array. 
-->
<%!
    public int calculateCost() {
        int sum = 0;
        for (int i = 0; i < userCostArray.size(); i++) {
            sum = sum + (Integer) userCostArray.get(i);
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
            <%
                userCostArray = new ArrayList();
            %>
            <table cellspacing="5" border="0">
                <tr>
                    <td>
                        <h1 class="main-title">Checkout</h1>            
                    </td>
                </tr>                
                <tr>                
                    <td>            
                        <span class="title">Please confirm payment:</span>
                    </td>
                </tr>
                <tr class="empty-row">                
                </tr>
                <tr>
                    <td>
                        <fieldset>
                            <legend>User Info</legend>
                            <ul>
                                <li>
                                    Name: <%= name%>
                                </li>
                                <li>
                                    <br/>
                                </li>                                
                                <li>
                                    Username: <%= username%>
                                </li>
                                <li>
                                    <br/>
                                </li>
                                <li>
                                    Your e-mail confirmation will be sent to:&nbsp;&nbsp;<i><%= email%></i>
                                </li>
                            </ul>                           
                        </fieldset>
                    </td>
                </tr>
                <tr class="empty-row">                
                <tr>
                    <th class="border">Your Items</th><th class="border">Cost</th><th class="border">Remove Item</th>
                </tr>
                <%
                    // returns the values of items selected in list box.
                    for (int i = 0; i < selectedItems.size(); i++) {
                %>
                <tr>
                    <td class="border" align="left" style="padding-left: 5px;">
                        <%= selectedItems.get(i)%>
                        <%itemprice = (Integer) costDict.get(selectedItems.get(i)); %>
                        <%incrementCost(itemprice);%>
                    </td>
                    <td class="border">$<%= itemprice%></td>
                    <td class="border">
                        <form action="CheckoutController" method="get">
                            <input type="hidden" name="item" value="<%= selectedItems.get(i)%>" />
                            <center><input id="submit" type="submit" style="margin: 1px;" value="remove" name="remove"></center>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>   
                <tr class="empty-row">                
                <tr style="color:cyan">
                    <td align="right" style="font-weight:bold;">Total:</td>
                    <td style="font-weight:bold;">$<%= calculateCost()%></td>
                </tr>
                <tr>
                    <td align="right">Proceed to Payment Options</td>
                    <td>
                        <form action="PaymentController" method="get">
                            <input id="submit" type="submit" value="Pay" name="pay">
                        </form>
                    </td>
                </tr>
            </table>  
        </form>
    </body>
</html>
