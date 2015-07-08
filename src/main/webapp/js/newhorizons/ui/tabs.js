/* 
    Created on : Jul 5, 2015, 11:07:34 PM
    Description: Tabs jQuery functions for CSS.
    Author     : jsnrice
*/

$(function () {

    $('ul.tabs li').click(function () {
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $("#" + tab_id).addClass('current');
    });

});
