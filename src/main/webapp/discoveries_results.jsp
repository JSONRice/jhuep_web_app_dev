<%-- 
    Document   : discoveries_results
    Created on : Aug 11, 2015, 8:45:27 PM
    Author     : jsnrice
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="resources.newhorizons.model.PlanetaryEntity"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="discoveriesBean" class="resources.newhorizons.domain.DiscoveriesBean" scope="session"/>
<jsp:setProperty name="discoveriesBean" property="*"/>
<%
    session.setAttribute("discoveriesBean", discoveriesBean);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Discoveries Results</title>
        <link href="css/hw.css" rel="stylesheet" type="text/css" />
        <link href="css/master.css" rel="stylesheet" type="text/css" />        
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/newhorizons/ui/checkboxrequired.js" type="text/javascript"></script>        
        <script src="js/indexErrorHandler.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <table>
            <tr>
                <td>
                    <h1 class="main-title">Discoveries</h1>            
                </td>
            </tr>                
            <tr>
                <td>
                    <h1 class="sub-title">NEWHORIZONS Planetary Data Discovery Report</h1>
                </td>
            </tr>
            <tr>
                <td>
                    <h4 class="sub-title"><i>Courtesy of NASA</i></h4>
                </td>
            </tr>
        </table>         
        <table class="grid">
            <%
                ArrayList<PlanetaryEntity> planetaryEntities = discoveriesBean.getPlanetaryEntityData();
                if (planetaryEntities != null) {
                    int length = planetaryEntities.size();
                    for (int i = 0; i < length; i++) {
            %>
            <tr>
                <td class="grid-border">Name: <%= planetaryEntities.get(i).getName()%></td>
            </tr>
            <tr>
                <td class="grid-border">Parameter Data:</td>
            </tr>            
            <tr>
                <td class="grid-border"><pre><%= planetaryEntities.get(i).getParameterData()%></pre></td>
            </tr>
            <tr>
                <td class="grid-border">Atmosphere Data:</td>
            </tr>            
            <tr>
                <td class="grid-border"><pre><%= planetaryEntities.get(i).getAtmosphereData()%></pre></td>
            </tr>
            <tr class="empty-row"></tr>
            <%
                    }
                }
                else {
            %>
            <tr>
                <td class="grid-border"><i>Warning: no database records found. Please check parameters or reach out to web team.</i></td>
            </tr>
            <%
                }
            %>
        </table>        
    </body>
</html>

