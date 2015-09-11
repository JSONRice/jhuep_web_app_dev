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
        <script src="js/jquery.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
        <%@ include file="banner.jsp" %>
        <div id="pageContent" class="content">
            <form name="order" id="signup" action="bank" method="post">
                <fieldset id="bankingfields">
                    <legend>Enter User Id For Quick Lookup</legend>
                    <input type="text" name="id" 
                           value="" autofocus required/>
                </fieldset>
                <input type="submit" id="submission" name="computeUser" value="Submit">
            </form>
        </div>
    </body>
</html>

