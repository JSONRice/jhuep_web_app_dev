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
        <link href="css/ratings.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/indexErrorHandler.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <script>
            // Remove this after testing rate widget:
            $(function () {
                $("#submission").click(function () {
                    var rating = $("input[name=rating]:checked").val();
                    alert("User gave a rating of: " + rating);
                });
            });
        </script>
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
                    <form name="feedback" id="feedback" action="#" method="post">
                        <fieldset id="contactinfo">
                            <legend>Contact Information</legend>
                            <label for="name">Name</label> 
                            <input type="text" name="name" autofocus>
                            <br/>
                            <label for="email">E-Mail</label>
                            <input type="email" name="email"
                                   title="Format must be: someuser@host.dom"> 
                            <br/>
                            <span style="float: left; width: 8em;">Please rate:</span>
                            <span class="rating">
                                <input type="radio" id="star5" id="rating" name="rating" value="5" /><label for="star5" title="Very Satisfied">5 stars</label>
                                <input type="radio" id="star4" id="rating" name="rating" value="4" /><label for="star4" title="Satisfied">4 stars</label>
                                <input type="radio" id="star3" id="rating" name="rating" value="3" /><label for="star3" title="Undecided">3 stars</label>
                                <input type="radio" id="star2" id="rating" name="rating" value="2" /><label for="star2" title="Disatisfied">2 stars</label>
                                <input type="radio" id="star1" id="rating" name="rating" value="1" /><label for="star1" title="Very Disatisfied">1 star</label>
                            </span>                            
                            <!--
                            <label for="rating">Rating:</label>
                            <div class="rating">
                                <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                            </div>
                            -->
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


