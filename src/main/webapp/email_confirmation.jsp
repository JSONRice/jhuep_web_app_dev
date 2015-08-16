<%-- 
    Document   : email_confirmation.jsp
    Created on : Jul 22, 2015, 4:27:15 PM
    Author     : Sajjad Syed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
String emailstatus = (String)request.getAttribute("emailstatus");
%>


<html>
    <head>
        <title>Email Confirmation</title>        
        <link href="css/hw.css" rel="stylesheet" type="text/css" />
        <link href="css/master.css" rel="stylesheet" type="text/css" />  
        <link href="css/ratings.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <table>
            <tr>
                <td>
                    <h3>Email Status:</h3>
                </td>
            </tr>                
            <tr>                
                <td>            
                    <h4><%= emailstatus %></h4>
                </td>
            </tr>
        </table>
    </body>
</html>
</html>


