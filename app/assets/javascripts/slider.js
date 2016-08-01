function outputUpdate(val) {
  $('#output_future_age').val(document.querySelector('#overview_future_age').value);
  
}


function bindSliderChangeEvent() {
  $("#overview_future_age").change(function() {
    //$("#overview_future_age").disable();
    $('#slider_form').submit();
  });
}


$(function() {
  bindSliderChangeEvent();
});