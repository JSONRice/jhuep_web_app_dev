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
                            <legend>Items for Sale:</legend>
                            <div id="mug" class="item">
                                <input type="checkbox" 
                                       name="mug" value="mug">
                                 <input type="image" name="mug" src="images/mug.jpg" 
                                       class="itemimage" alt="Stellar Mug" title="Stellar Mug"/>
                                <br/>
                                <span>$10 Stellar Mug</span>
                            </div>
                            <br/>
                            <br/>                                                        
                            <div id="shirt" class="item">
                                <input type="checkbox" 
                                       name="shirt" value="shirt">
                                 <input type="image" name="mug" src="images/shirt.jpg" 
                                       class="itemimage" alt="Stellar Shirt" title="Stellar Shirt"/>
                                <br/>
                                <span>$15 Stellar Shirt</span>
                            </div>
                            <br/>
                            <br/>                            
                            <div id="mousepad" class="item">
                                <input type="checkbox" 
                                       name="mousepad" value="mousepad">
                                 <input type="image" name="mousepad" src="images/mousepad.jpg" 
                                       class="itemimage" alt="Stellar Mouse Pad" title="Stellar Mouse Pad"/>
                                <br/>
                                <span>$5 Stellar Mouse Pad</span>
                            </div>
                            <br/>
                            <br/>
                            <div id="telescope" class="item">
                            <input type="checkbox" 
                                   name="telescope" value="telescope">
                                <input type="image" name="coaster" src="images/telescope.jpg" 
                                       class="itemimage" alt="Deep Reaching Telescope" title="Deep Reaching Telescope"/>
                                <br/>
                                <span>$250 Deep Reaching Telescope</span>
                            </div>
                            <br/>
                            <br/>
                            <div id="coaster" class="item">
                                <input type="checkbox" 
                                       name="coaster" value="coaster">
                                <input type="image" name="coaster" src="images/coaster.jpg" 
                                       class="itemimage" alt="Planet Coaster" title="Planet Coaster"/>
                                <br/>
                                <span>$7 Planet Coaster</span>
                            </div>

                            <br/>
                            <br/>
                            <div id="submitbuttons">
                                <input type="submit" value="Checkout"/> 
                                <br/>
                                <input type="image" src="images/cart.png" 
                                       style="width:40px;height:40px" alt="Shopping Cart" title="Shopping Cart"/>
                            </div>                            
                        </fieldset>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
