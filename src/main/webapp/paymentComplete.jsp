



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>

<jsp:useBean id="user" scope="session" class="resources.newhorizons.domain.UserSessionBean"></jsp:useBean>




    <!DOCTYPE html>
    <html>
        <head>
            <title>Payment</title>
            <link href="css/hw.css" rel="stylesheet" type="text/css" />
            <link href="css/master.css" rel="stylesheet" type="text/css" />        
            <script src="js/jquery.js" type="text/javascript"></script>
            <script src="js/indexErrorHandler.js" type="text/javascript"></script>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        </head>
        <body>
        <jsp:include page="banner.jsp"/>



        <div id="Summary">
            <br>

            <table BORDER="1"  WIDTH="50%"   CELLPADDING="1" CELLSPACING="1">  
                <tr>
                    <td>
                        <h3>Your Purchase Order is complete:</h3>
                    </td>
                </tr> 


                <th>Your Items</th>
                <th>Cost</th>

                <%
                    // returns the values of items selected in list box.
                    for (int i = 0; i < user.getSelectedItemsList().size(); i++) {
                %>
                <tr>
                    <td align="left"><%= user.getSelectedItemsList().get(i)%></td>

                    <%int itemprice = user.getItemPrice(user.getSelectedItemsList().get(i));%>
                    <td>$<%= itemprice%></td>

                </tr>

                <%
                    }
                %>   
            </table>

            <br>
            <table BORDER="1"  WIDTH="50%"   CELLPADDING="1" CELLSPACING="1">  
                <tr>
                    <td align="right">Total:</td>
                    <td>$<%= user.getSelectedItemsTotalCost()%></td>
                </tr>
            </table>
        </form>

        <% user.resetItems();%>


</body>
</html>
