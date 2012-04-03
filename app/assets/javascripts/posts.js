$(document).ready(function () { 
  var $loading = $('.loading');
  var $preview = $('a.preview');
  $loading.hide();

  $preview.live('click', function() {
    $preview.hide();
    $loading.show();
    $.ajax({
      url: '/convert',
      data: {markdown: escape($('#post_body').val())},
      success: function(data) {
        $('#preview').html(data);
        $loading.hide();
        $preview.show();
      }
    });
    return false;
  });
});
