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
        <link href="css/hw.css" rel="stylesheet" type="text/css" />        
        <link href="css/master.css" rel="stylesheet"   type="text/css" />        
        <link href="css/tabs.css"   rel="stylesheet"   type="text/css" />        
        <script src="js/jquery.js"                     type="text/javascript"></script>
        <script src="js/newhorizons/ui/tabs.js"        type="text/javascript"></script>        
        <script src="js/jquery-ui/jquery-ui.js"        type="text/javascript"></script>
        <script src="js/indexErrorHandler.js"          type="text/javascript"></script>
        <script src="js/jquery-ui/jquery.countdown.js" type="text/javascript"></script>        
        <script src="js/newhorizons/ui/countdown.js"   type="text/javascript"></script>
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
                            <li class="tab-link" data-tab="tab-2">LORRI Uploads</li>
                            <li class="tab-link" data-tab="tab-3">Mission Metrics</li>
                        </ul>
                        <div id="tab-1" class="tab-content current">
                            <!-- TODO: develop a Java controller or service to get the most up to date picture and place it in here: -->
                            <!-- The picture should come from this site: http://pluto.jhuapl.edu/whereisnh/PlutoFlyby/ -->
                            <img class="data_feed_img trajectory_img" src="http://pluto.jhuapl.edu/whereisnh/PlutoFlyby/nhpf20150701_0144.svg" alt="NEWHORIZONS fly-by of Pluto"/>
                        </div>                        
                        <div id="tab-2" class="tab-content">
                            <!-- TODO: develop a Java controller or service to get the most up to date picture and place it in here: -->
                            <!-- The picture should come from this site: http://pluto.jhuapl.edu/soc/Pluto-Encounter/data/pluto/ -->                            
                            <pre><b>The latest LORRI (Long Range Reconnaissance Imager) images from NEWHORIZONS:</b></pre>
                            <!-- TODO: this entire LORRI info section can be acquired through REST from the LORRI imagary pages: -->
                            <div class="info">
                                Description:	OpNav Campaign 4, LORRI 1X1
                                <br/>
                                Time:	2015-07-03 23:31:25 UTC
                                <br/>                                
                                Exposure:	150 msec
                                <br/>                                
                                Target:	HYDRA
                                <br/>                                
                                Range:	12.6M km
                                <br/>                                
                                Binning:	1x1
                                <br/>                                
                                Image Name:	lor_0298272204_0x630_sci_3
                            </div>
                            <br/>
                            <img class="lorri_img data_feed_img" src="http://pluto.jhuapl.edu/soc/Pluto-Encounter/data/pluto/level2/lor/jpeg/029820/lor_0298204679_0x630_sci_1.jpg" alt="Latest LORRI upload"/>
                        </div>
                        <div id="tab-3" class="tab-content">
                                <pre>NEWHORIZONS Mission Metrics:</pre>
                                <pre><span>Time Until Destination Arrival:</span><br/><br/><div id="clock" class="time"></div></pre>
                                <pre><span>Expected Time of Arrival (ETA):</span><br/><br/><div id="eta" class="time">Tue, 14 Jul 2015 11:49:57 UTC</div></pre>
                                <pre><span>Set Coordinates:</span></pre>
                                <br/><br/>
                                <img class="mission_metrics_img data_feed_img" src="images/missiontrajectorypath.jpg"/>
                        </div>
                    </div>
                </td>
            </tr>
        </table>        
    </body>
</html>

