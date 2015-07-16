/* 
 * @Description Ensure that at least one of the checkboxes on the discoveries page is selected.
 * @Author Jason Rice
 */

$(function () {
    var checkedAtLeastOne = false;

    $('#form').on('submit', function (e) {

        $('input[type="checkbox"]').each(function () {
            if ($(this).is(":checked")) {
                checkedAtLeastOne = true;
            }
        });

        if (checkedAtLeastOne === false) {
            e.preventDefault();
            var errormsg = 'Please select at least one checkbox.';
            $('#checkboxerror').html(errormsg);            
            return false;
        }
        else {
            // clear errors:
            $('#checkboxerror').html('');
            return true;
        }
    });
});

