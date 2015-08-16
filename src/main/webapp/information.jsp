<%-- 
    Document   : information
    Created on : Jul 3, 2015, 4:31:21 PM
    Author     : jsnrice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Information</title>
        <link href="css/hw.css" rel="stylesheet" type="text/css" />        
        <link href="css/master.css" rel="stylesheet"   type="text/css" />        
        <link href="css/tabs.css"   rel="stylesheet"   type="text/css" />        
        <script src="js/jquery.js"                     type="text/javascript"></script>
        <script src="js/newhorizons/ui/tabs.js"        type="text/javascript"></script>        
        <script src="js/jquery-ui/jquery-ui.js"        type="text/javascript"></script>
        <script src="js/jquery-ui/jquery.countdown.js" type="text/javascript"></script>        
        <script src="js/newhorizons/ui/countdown.js"   type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <table>
            <tr>
                <td>
                    <h1 class="main-title">Information</h1>
                </td>
            </tr>                
            <tr>                
                <td>            
                    <h1 class="title">Learn more about NEWHORIZONS (courtesy of NASA)</h1>
                </td>
            </tr>                
            <tr>
                <td>            
                    <div class="tabs-container">
                        <ul class="tabs">
                            <li class="tab-link current" data-tab="tab-1">Trajectory</li>                            
                            <li class="tab-link" data-tab="tab-2">LORRI</li>
                            <li class="tab-link" data-tab="tab-3">Pluto Mission</li>
                            <li class="tab-link" data-tab="tab-4">Kuiper Belt Mission</li>
                        </ul>
                        <div id="tab-1" class="tab-content current">
                            NEWHORIZONS is now past Pluto and it's satellites and currently within the Kuiper Belt en route to a larger<br/> 
                            Kuiper Belt Object (<b>KBO</b>) named PT1. Learn about the Kuiper Belt Mission by selecting the Kuiper Belt<br/>
                            Mission tab.<br/>
                            <pre style='font-weight: bold'>NEWHORIZONS position as of Aug 1, 2015:</pre>
                            <img class="data_feed_img trajectory_img" src="http://pluto.jhuapl.edu/whereisnh/PlutoFlyby/nhpf20150801_0355.svg" alt="NEWHORIZONS fly-by of Pluto"/>
                        </div>                        
                        <div id="tab-2" class="tab-content" style="height:560px; overflow: auto;">
                            <!-- See: http://pluto.jhuapl.edu/soc/Pluto-Encounter/data/pluto/ -->
                            LORRI stands for Long Range Reconnaissance Imager and is the long range camera<br/>
                            carried on board NEWHORIZONS. The following is a sample image taken by LORRI on July 3, 2015.<br/>
                            This is the clearest photo at that time of Hydra a moon of Pluto. Hydra was discovered in 2005.<br/>
                            Hydra is a small satellite and at only 55x40 Km can fit within the boundaries of Washington D.C.<br/>
                            <pre><b>LORRI (Long Range Reconnaissance Imager) upload of Hydra (bottom right) from NEWHORIZONS:</b></pre>
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
                            <img class="lorri_img data_feed_img" style="height:300px;" 
                                 src="http://pluto.jhuapl.edu/soc/Pluto-Encounter/data/pluto/level2/lor/jpeg/029820/lor_0298204679_0x630_sci_1.jpg" 
                                 alt="LORRI upload of Hydra"/>
                        </div>
                        <div id="tab-3" class="tab-content"  style="height:600px; overflow:auto">
                            <pre>Pluto Mission:</pre>
                            NEWHORIZONS was launched towards Pluto on January 16, 2006 and at that time broke the known<br/>
                            record for the fastest object ever recorded that was generated by man at a maximum recorded<br/>
                            speed of 36,373 mph or 58,536 km/h NEWHORIZONS was designed and constructed at the Johns<br/> 
                            Hopkins Applied Physics Laboratory.<br/>
                            <pre><div class="time"><span>Launch: </span>January 19, 2006 19:00 UTC</div></pre> 
                            <pre><div id="eta" class="time"><span>Arrival: </span>Tue, 14 Jul 2015 11:49:57 UTC</div></pre>
                            <pre><span><b>3D Flight Path</b></span></pre>
                            <img class="mission_metrics_img data_feed_img" src="images/pluto_pt1_rotate.gif"/>
                            <pre><span><b>2D Flight Path:</b></span></pre>
                            <img class="mission_metrics_img data_feed_img" src="images/missiontrajectorypath.jpg"/>
                        </div>
                        <div id="tab-4" class="tab-content" style="height: 560px; overflow: auto;">
                            <pre>Kuiper Belt Mission:</pre>
                            NEWHORIZONS arrived on Pluto on July, 14. It's next mission is to extend beyond the reaches<br/>
                            of our solar system into the Kuiper Belt (KB). The KB asteroid field is host to thousands if not<br/>
                            millions of asteroids known as Kuiper Belt Objects (KBO). After NEWHORIZONS passed Pluto it set<br/>
                            course for one last mission objective, and that is to reach a KBO known as PT1. PT1 is a larger KBO<br/>
                            at an estimated 30-45 Km and discovered by the Hubble telescope. This final mission is expected<br/> 
                            to occur in the middle of January 2019.<br/>
                            <pre><span>Time to Arrive at PT1:</span><br/><br/><div id="clock" class="time"></div></pre>
                                <pre><span>Hubble Observation of PT1:</span></pre>
                            <img style="height: 320px;" class="mission_metrics_img data_feed_img" src="images/pt1.gif"/>
                        </div>
                    </div>
                </td>
            </tr>
        </table>        
    </body>
</html>

