/*** 
 * The following requires the jquery.countdown.js dependency
 */
$(function () {
    $('#clock').countdown('2015/07/14', function (event) {
        var $this = $(this).html(event.strftime(''
                + '<span class="time">%w</span> weeks '
                + '<span class="time">%d</span> days '
                + '<span class="time">%H</span> hr '
                + '<span class="time">%M</span> min '
                + '<span class="time">%S</span> sec'));
    });
});

