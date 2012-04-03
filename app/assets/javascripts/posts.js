$(document).ready(function () { 
  //var converter = new Markdown.Converter();
  var converter = new Markdown.getSanitizingConverter();
  var updatePreview = function () {
    var md = $('#post_body').val();
    var html = converter.makeHtml(md);
    $('#preview').html(html);
  }
  $('#post_body').live('keyup', function () {
    updatePreview();
  });
  $('#post_body').live('click', function () {
    updatePreview();
  });
});
