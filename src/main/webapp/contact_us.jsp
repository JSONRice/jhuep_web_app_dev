<%-- 
    Document   : contact_us
    Created on : Jul 3, 2015, 4:27:15 PM
    Author     : jsnrice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Contact Us</title>        
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
                    <h1 class="main-title">Contact Us</h1>
                </td>
            </tr>                
            <tr>                
                <td>            
                    <h1 class="title">Provide Feedback for the Team:</h1>
                </td>
            </tr>
            <tr>
                <td>
                    <!-- TODO: swap out the MainController for a FeedbackController or EmailController -->
                    <form name="feedback" id="feedback" action="MainController" method="post">
                        <fieldset id="contactinfo">
                            <legend>Contact Information</legend>
                            <label for="name">Name</label> 
                            <input type="text" name="name" autofocus>
                            <br/>
                            <label for="email">E-Mail</label>
                            <input type="email" name="email"
                                   title="Format must be: someuser@host.dom"> 
                            <br/>
                            <br/>
                            <input type="submit" id="submission" value="Send Feedback">                        
                        </fieldset>
                    </form> 
                </td>
            </tr>
        </table>
    </body>
</html>


