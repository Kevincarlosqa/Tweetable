$(document).ready(function() {
  $('#btn-1').click(function() {
    $('#content-2').addClass('hidden');
    $('#content-1').removeClass('hidden');
  });

  $('#btn-2').click(function() {
    $('#content-1').addClass('hidden');
    $('#content-2').removeClass('hidden');
  });
});