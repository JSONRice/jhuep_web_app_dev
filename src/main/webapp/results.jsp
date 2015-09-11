<%-- 
    Document    : results
    Description : computed results page routed from servlet.
    Created on  : Sep 10, 2015, 6:35:00 PM EST
    Author      : jsnrice
--%>
<%@page import="resources.domain.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JHUEP RIA AJAX Online Banking Customer Lookup</title>
        <link href="css/hw.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
        <%@ include file="banner.jsp" %>
        <div id="pageContent" class="content">
            <fieldset id="customerfields">
                <%
                    Customer customer = (Customer) request.getAttribute("customer");
                    /**
                     * Remember if the customer was not found then the returned customer attribute
                     * will be null so then grab the id attribute from the servlet and issue a warning:
                     **/
                    String id = (String) request.getAttribute("id");
                    if (customer == null) {
                %>
                <span class="warning">Customer with id of '<%= id %>' does not exist. Go back to rerun query.</span>
                <%
                } else {
                %>
                <legend>Customer Info</legend>
                First Name: ${customer.firstName}
                <br/>
                Last Name: ${customer.lastName}
                <br/>
                Balance: <span class="balance">${customer.balance}</span>
                <% } %>
            </fieldset>

        </div>
    </body>
</html>

