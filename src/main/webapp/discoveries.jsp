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
                    <h4 class="title">Archived Discovery Report Form:</h4>
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
                        <span id="select_instructions">Hold down the Ctrl (Windows-Linux) / Command (Mac) button to select multiple courses.</span>
                    </fieldset>
                </td>
            </tr>
        </table>        
    </body>
</html>

