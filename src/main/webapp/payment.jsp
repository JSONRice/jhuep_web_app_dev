<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<jsp:useBean id="user" scope="session" class="resources.newhorizons.domain.UserSessionBean"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <title>Payment</title>
            <link href="css/hw.css" rel="stylesheet" type="text/css" />
            <link href="css/master.css" rel="stylesheet" type="text/css" />        
            <script src="js/jquery.js" type="text/javascript"></script>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        </head>
        <body>
        <jsp:include page="banner.jsp"/>



        <div id="Summary">
            <br>

            <table BORDER="1"  WIDTH="50%"   CELLPADDING="1" CELLSPACING="1">  
                <tr>
                    <td>
                        <h3>Your Purchase Order is:</h3>
                    </td>
                </tr> 


                <th>Your Items</th>
                <th>Cost</th>

                <%
                    // returns the values of items selected in list box.
                    for (int i = 0; i < user.getSelectedItemsList().size(); i++) {
                %>
                <tr>
                    <td align="left"><%= user.getSelectedItemsList().get(i)%></td>

                    <%int itemprice = user.getItemPrice(user.getSelectedItemsList().get(i));%>
                    <td>$<%= itemprice%></td>

                </tr>

                <%
                    }
                %>
                
                <tr>
                    <td align="left"><b>Total:</b></td>
                    <td bgcolor="green"><b>$<%= user.getSelectedItemsTotalCost()%></b></td>
                </tr>
                
            </table>

            <br>
        </form>

        <!--- This is where SSL functionality needs to be implemented -->

        <br>
        <form action="PaymentComplete" method="post">


            <table BORDER="1"  WIDTH="50%"   CELLPADDING="1" CELLSPACING="1">
                <tr><td>Payment Information</td></tr>
                <tr>
                    <td>
                        <input type="radio" name="creditType" value="V" checked>Visa
                        <input type="radio" name="creditType" value="M" >Master Card
                        <input type="radio" name="creditType" value="D" >Discover
                    </td>            
                </tr>        
                <tr>
                    <td>Credit Number: 
                        <input type=text pattern="[0-9]{13,16}" name="number"  required/></td>
                </tr>
                <tr>
                    <td>Credit Expiration:
                        <select name="month" size="1" required>
                            <option value="01" >01 - January</option>
                            <option value="02" >02 - February</option>
                            <option value="03" >03 - March</option>
                            <option value="04" >04 - April</option>
                            <option value="05" >05 - May</option>
                            <option value="06" >06 - June</option>
                            <option value="07" >07 - July</option>
                            <option value="08" >08 - August</option>
                            <option value="09" >09 - September</option>
                            <option value="10" >10 - October</option>
                            <option value="11" >11 - November</option>
                            <option value="12" >12 - December</option>

                        </select>
                        <select name="year" size="1" required>
                            <option value="2015" >2015</option>
                            <option value="2016" >2016</option>
                            <option value="2017" >2017</option>
                            <option value="2018" >2018</option>
                            <option value="2019" >2019</option>
                            <option value="2020" >2020</option>
                            <option value="2021" >2021</option>
                            <option value="2022" >2022</option>
                            <option value="2023" >2023</option>
                            <option value="2024" >2024</option>
                            <option value="2025" >2025</option>
                            <option value="2026" >2026</option>
                        </select>
                    </td>
                </tr>
                <tr><td><input id="submit" type="submit" value="Confirm Payment"></td></tr>
            </table>               
        </form>        
</body>
</html>
