<%-- 
    Document   : gift_shop_logged_in
    Created on : Jul 17, 2015, 9:44:28 PM
    Author     : jsnrice
--%>

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
        <form id="form" action="#" method="post">
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
                            <legend>Items:</legend>
                            <input type="checkbox" 
                                   name="mug" value="mug">Stellar Mug
                            <br/>
                            <input type="checkbox" 
                                   name="shirt" value="shirt">Stellar Shirt
                            <br/>
                            <input type="checkbox" 
                                   name="mousepad" value="mousepad">Stellar Mouse Pad
                            <br/>
                            <input type="checkbox" 
                                   name="telescope" value="telescope">Deep Reaching Telescope
                            <br/>
                            <input type="checkbox" 
                                   name="coaster" value="coaster">Planet Coaster
                            <br/>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
