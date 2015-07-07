<%-- 
    Document    : banner
    Description : Provides a basic banner for JSP pages. Use as an include-directive. 
                  Styling is up to the page hosting the banner.
    Created on  : Jun 13, 2015, 9:07:08 PM
    Author      : jsnrice
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- favicon of NEWHORIZONS: -->
<link href="images/newhorizons.png" rel="shortcut icon" />   
<script src="js/newhorizons/ui/twitter.js" type="text/javascript"></script>

<div id="heading">
    <img src="images/newhorizons.png" style="position: absolute;" alt="JHU Logo" />
    <jsp:include page="twitter_feed.jsp"/>    
    <jsp:include page="navbar.jsp"/>
</div>
