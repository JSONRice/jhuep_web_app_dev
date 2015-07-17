<%-- 
    Document   : gift_shop
    Created on : Jul 3, 2015, 4:30:17 PM
    Author     : jsnrice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- COMMENTING OUT SINCE MEMORY IS NOT ALLOCATED (e.g. Make Controller)
jsp:useBean id="user" class="resources.newhorizons.domain.UserSessionBean" scope="session"/
jsp:setProperty name="user"  property="name" value="NewHorizonUser"/
-->
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
        <table>
            <tr>
                <td>
                    <h1 class="main-title">Gift Shop</h1>            
                </td>
            </tr>                
            <tr>                
                <td>            
                    <h1 class="title">Coming Soon!</h1>

                </td>
            </tr>
            <!--
            <tr><td>Welcome ${user.name}!</td></tr>
            -->
        </table>
    </body>
</html>
