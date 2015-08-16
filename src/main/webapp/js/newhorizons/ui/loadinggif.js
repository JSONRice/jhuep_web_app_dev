/*******************************************************************************
 * @author jsnrice
 * @description Applied AJAX to spin a gif on a form. To use just add a div anywhere
 * in your form with the id of "loader" and ensure your submit button has an id of
 * "submit" or "submission" or you can change the id from submit in here to whatever you want.
 *  You can also change the loader gif in here.
 **/
$(function () {
    console.log("loadinggif.js called. Storing loadergif.");
    $("#loadergif").hide();
    
    $("#loader").prepend("<center id='loadergifframe'><div id='loadergif' style='display: none;'><img src='images/ajax-loader2.gif'/></div><center>");

    $('#submission, #submit').click(function () {
        console.log("submitting form and loading spinner gif");
        var pass = true;
        //some validations

        if (pass === false) {
            return false;
        }
        $("#loadergif").show();
        return true;
    });
});

