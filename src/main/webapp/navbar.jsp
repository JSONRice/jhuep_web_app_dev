<%-- 
    Document   : navbar
    Created on : Jul 3, 2015, 3:03:10 PM
    Author     : jsnrice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- 
    Note: the following will allow for drop down items.
    See: http://code.runnable.com/UdQdRyHniSpKAAXx/create-a-horizontal-navigation-menu-bar-using-jquery
-->

<script src="js/newhorizons/ui/navbar.js" type="text/javascript"></script>
<jsp:useBean id="user" scope="session" class="resources.newhorizons.domain.UserSessionBean"></jsp:useBean>
    <ul class="navbar">
        <li>
            <a href="index.jsp" title="Main" id="main">Main</a>
        </li>
        <li>
            <a href="information.jsp" title="About Us" id="information">Information</a>
        </li>
        <li>
            <a href="discoveries.jsp" title="Discoveries" id="discoveries">Discoveries</a>
        </li>
        <li>
            <a href="gift_shop_logged_in.jsp" title="Gift Shop" id="gift_shop">Gift Shop</a>
        </li>
        <li>
            <a href="contact_us.jsp" title="Contact Us" id="contact_us">Contact Us</a>
        </li>
    </ul>

    <div align='center'>    
        <br/>
        <%
            if (user.getFirstName() == null) {
        %>
        <span style="font-size:12pt;font-style: italic;">Not Logged In</span>
        <%
        } else {
        %>
        <span style="font-size:12pt;font-style: italic;">Welcome, ${user.firstName}</span>
        <%            
          }
        %>
    </div>
    <br/>
