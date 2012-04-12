$(document).ready(function () { 
  var $loading_bar = $('.loading');
  var $preview_button = $('a.preview');
  var $preview_box = $('#preview');
  var show_button = function() {
    $loading_bar.hide();
    $preview_button.show();
  };
  var show_loading = function() {
    $preview_button.hide();
    $loading_bar.show();
  };
  var load_preview = function(data) {
    $preview_box.html(data);
  };

  show_button();

  $preview_button.live('click', function() {

    var generate_toc = $('#post_rendering_options_generate_toc').is(':checked');
    show_loading();

    $.ajax({
      url: '/convert',
      type: 'post',
      data: { 
        markdown:     $('#post_body').val(),
        generate_toc: generate_toc
      }
    }).done(function(data) {    load_preview(data);    })
      .fail(function(data) {    load_preview('fail');  })
      .always(function(data) {  show_button();         });
    return false;
  });
});
