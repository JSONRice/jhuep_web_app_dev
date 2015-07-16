<%-- 
    Document   : discoveries
    Created on : Jul 3, 2015, 4:32:24 PM
    Author     : jsnrice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Discoveries</title>
        <link href="css/hw.css" rel="stylesheet" type="text/css" />
        <link href="css/master.css" rel="stylesheet" type="text/css" />        
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/newhorizons/ui/checkboxrequired.js" type="text/javascript"></script>        
        <script src="js/indexErrorHandler.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <form name="discoveriesform" id="form" action="javascript:alert('Need to develop form submit based off of module 7')" method="post">
            <table>
                <tr>
                    <td>
                        <h1 class="main-title">Discoveries</h1>            
                    </td>
                </tr>                
                <tr>                
                    <td>            
                        <span class="title">Archived Discovery Report Form:</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fieldset id="planetselections" >
                            <legend>Select Planet or Moon</legend>
                            <select name="planets" id="planets" multiple required>
                                <option value="moon" id="moon">The Moon</option>
                                <option value="mars" id="mars">Mars</option>
                                <option value="jupiter" id="jupiter">Jupiter</option> 
                                <option value="saturn" id="saturn">Saturn</option>
                                <option value="uranus" id="uranus">Uranus</option>			                        
                                <option value="pluto" id="pluto">Pluto</option>                            
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
                            <input type="checkbox" name="moonsurvey" value="moonsurvey">Moon Survey</input>
                            <br/>
                            <input type="checkbox" name="ringdata" value="ringdata">Ring Data</input>                     
                            <br/>
                            <input type="checkbox" name="images" value="images">Images (If Available)</input>
                            <br/>
                        </fieldset>	
                    </td>
                </tr>
                <tr class="empty-row"/>                
                <tr>
                    <td>
                        <input type="submit" value="Submit"/>
                    </td>
                </tr>            
            </table>    
        </form>
    </body>
</html>

