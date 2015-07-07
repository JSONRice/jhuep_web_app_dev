<%-- 
    Document   : data_feeds
    Created on : Jul 3, 2015, 4:31:21 PM
    Author     : jsnrice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Data Feeds</title>
        <link href="css/oform.css" rel="stylesheet" type="text/css" />
        <link href="css/hw.css" rel="stylesheet" type="text/css" />
        <link href="css/master.css" rel="stylesheet" type="text/css" />        
        <link href="css/tabs.css" rel="stylesheet" type="text/css" />        
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/newhorizons/ui/tabs.js" type="text/javascript"></script>        
        <script src="js/jquery-ui/jquery-ui.js" type="text/javascript"></script>
        <script src="js/indexErrorHandler.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <table>
            <tr>
                <td>
                    <h1 class="main-title">Data Feeds</h1>
                </td>
            </tr>                
            <tr>                
                <td>            
                    <h1 class="title">Select a Data Feed Tab</h1>
                </td>
            </tr>                
            <tr>                
                <td>            
                    <div class="tabs-container">
                        <ul class="tabs">
                            <li class="tab-link current" data-tab="tab-1">Trajectory</li>                            
                            <li class="tab-link" data-tab="tab-2">Mission Metrics</li>
                            <li class="tab-link" data-tab="tab-3">LORRI Uploads</li>
                        </ul>
                        <div id="tab-1" class="tab-content current">
                            <!-- TODO: develop a Java controller or service to get the most up to date picture and place it in here: -->
                            <!-- The picture should come from this site: http://pluto.jhuapl.edu/whereisnh/PlutoFlyby/ -->
                            <img class="trajectory_img" src="http://pluto.jhuapl.edu/whereisnh/PlutoFlyby/nhpf20150701_0144.svg" alt="NEWHORIZONS fly-by of Pluto"/>
                        </div>                        
                        <div id="tab-2" class="tab-content">
                            <!-- TODO: develop a Java controller or service to get the most up to date picture and place it in here: -->
                            <!-- The picture should come from this site: http://pluto.jhuapl.edu/soc/Pluto-Encounter/data/pluto/ -->                            
                            <pre><b>The latest LORRI (Long Range Reconnaissance Imager) images from NEWHORIZONS:</b></pre>
                            <br/>
                            <img class="lorri_img" src="http://pluto.jhuapl.edu/soc/Pluto-Encounter/data/pluto/level2/lor/jpeg/029820/lor_0298204679_0x630_sci_1.jpg" alt="Latest LORRI upload"/>
                        </div>
                        <div id="tab-3" class="tab-content">
                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.                
                        </div>
                    </div>
                </td>
            </tr>
        </table>        
    </body>
</html>

