<%-- 
    Document   : discoveries
    Created on : Jul 3, 2015, 4:32:24 PM
    Author     : jsnrice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="discoveriesBean" class="resources.newhorizons.domain.DiscoveriesBean" scope="session"/>
<jsp:setProperty name="discoveriesBean" property="*"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Discoveries</title>
        <link href="css/hw.css" rel="stylesheet" type="text/css" />
        <link href="css/master.css" rel="stylesheet" type="text/css" />        
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/newhorizons/ui/checkboxrequired.js" type="text/javascript"></script>        
        <script src="js/newhorizons/ui/loadinggif.js" type="text/javascript"></script>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">            
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <form name="discoveriesform" id="form" action="discoveries" method="post">
            <table>
                <tr>
                    <td>
                        <div id="loader"></div>                        
                        <h1 class="main-title">Discoveries</h1>            
                    </td>
                </tr>          
                <tr>                
                    <td>            
                        <span class="title" style="width:100%">NEWHORIZONS Discoveries Report Form:</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fieldset id="planetselections" >
                            <legend>Select Planet or Moon</legend>
                            <select name="planets" id="planets" multiple required>
                                <option value="The Moon" id="moon">The Moon</option>
                                <option value="Mars" id="mars">Mars</option>
                                <option value="Jupiter" id="jupiter">Jupiter</option> 
                                <option value="Saturn" id="saturn">Saturn</option>
                                <option value="Uranus" id="uranus">Uranus</option>
                                <option value="Neptune" id="neptune">Neptune</option>                                
                                <option value="Pluto" id="pluto">Pluto</option>                            
                            </select>
                            <br/>
                            <span id="select_instructions">Hold down the Ctrl (Windows-Linux) / Command (Mac) button to select multiple entities.</span>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <!-- Any JavaScript errors will be forwarded here: -->
                        <div id="checkboxerror"/>
                    </td>
                </tr>                                
                <tr>
                    <td>
                        <fieldset id="additionaloptions">
                            <legend>Celestial Features</legend>
                            <input type="checkbox" name="moonsurvey" value="moonsurvey" 
                                   ${discoveriesBean.isMoonSurveyChecked == true ? 'checked' : ''}>Moon Survey</input>
                            <br/>
                            <input type="checkbox" name="ringdata" value="ringdata" 
                                   ${discoveriesBean.isRingDataChecked == true ? 'checked' : ''}>Ring Data</input>                     
                            <br/>
                            <input type="checkbox" name="images" value="images" 
                                   ${discoveriesBean.isImagesChecked == true ? 'checked' : ''}>Images (If Available)</input>
                            <br/>
                        </fieldset>	
                    </td>
                </tr>
                <tr class="empty-row"/>                
                <tr>
                    <td>
                        <input id="submit" type="submit" name="queryDiscoveries" value="Submit"/>
                    </td>
                </tr>            
            </table>    
        </form>
    </body>
</html>

