<%-- 
    Document    : error
    Description : generic error page for invalid id's
    Created on  : Sep 10, 2015, 9:51:09 PM
    Author      : jsnrice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/hw.css" rel="stylesheet" type="text/css" />        
        <title>Error</title>
    </head>
    <body>
        <%@ include file="banner.jsp" %>        
        <h5 class="error">Invalid ID of '${idStr}' was entered. Please go back and enter an ID between 1-999.</h5>
    </body>
</html>
