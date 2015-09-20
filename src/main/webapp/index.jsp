<%-- 
    Document    : index
    Description : main page that user is first routed.
    Created on  : Sep 10, 2015, 6:35:00 PM EST
    Author      : jsnrice
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JHUEP RIA AJAX Online Banking Customer Lookup</title>
        <link href="css/hw.css" rel="stylesheet" type="text/css" />
        <script src="js/ajax-utils.js" type="text/javascript"></script>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
        <%@ include file="banner.jsp" %>
        <div id="pageContent" class="content">
            <form name="order" id="signup" action="bank" method="post">
                <fieldset id="bankingfields">
                    <legend>Click to Acquire Highest Balance Customer (HBC)</legend>
                    <input type="button" value="Query for HBC" onclick='hbcReport("hbc", "hbc-results")'>
                </fieldset>
                <div id="hbc-results" class="results"></div>                
            </form>
        </div>
    </body>
</html>

