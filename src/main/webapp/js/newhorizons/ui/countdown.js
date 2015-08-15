/*** 
 * @author jsnrice
 * The following requires the jquery.countdown.js dependency
 * The countdown is currently based on PT1 the Kuiper Belt Object
 * that NEWHORIZONS is going to touch base with before it leaves our
 * solar system.
 */
$(function () {
    $('#clock').countdown('2019/01/15', function (event) {
        var $this = $(this).html(event.strftime(''        
                + '<span class="time">%Y</span> years or'
                + '<span class="time">%m</span> months'
                + '<span class="time">%d</span> days'        
                + '<span class="time">%H</span> hr'
                + '<span class="time">%M</span> min'
                + '<span class="time">%S</span> sec'));
    });
});

