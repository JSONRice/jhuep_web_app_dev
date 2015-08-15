<%-- 
    Document   : new_user
    Created on : Aug 6, 2015, 9:30:24 PM
    Author     : matth_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Gift Shop</title>
        <link href="css/hw.css" rel="stylesheet" type="text/css" />
        <link href="css/master.css" rel="stylesheet" type="text/css" />        
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/indexErrorHandler.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <form id="form" action="loginpage" method="post">
            <table>
                <tr>
                    <td>
                        <h1 class="main-title">Gift Shop</h1>            
                    </td>
                </tr>                
                <tr class="empty-row"/>
                <tr>
                    <td>
                        <fieldset id="credentials">
                            <legend>New User Info</legend>
                            <label for="username">Username:</label>
                            <input type="text" id="username" name="username" required/>
                            <br/> 
                            <label for="passwd">Password:</label> 
                            <input type="password" name="passwd" required/> 
                            <br/> 
                            <label for="firstName">First Name:</label> 
                            <input type="text" name="firstName" required/> 
                            <br/> 
                            <label for="lastName">Last Name:</label> 
                            <input type="text" name="lastName" required/> 
                            <br/> 
                            <label for="email">Email: </label> 
                            <input type="text" name="email" required/> 
                            
                            <br/><br/>
                            <div id="submitbuttons">
                                <input id="submit" type="submit" name="submitnewuser" value="submit"/>      
                            </div>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
