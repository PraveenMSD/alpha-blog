$( document ).on('turbolinks:load', function() {
  $("#new_article").validate({
    rules: {
      "article[title]": {
        required: true
      },
      "article[description]": {
        required: true,
        minlength: 5
      }
    }
  });

  $('#likeBtn').on('click', function() {
    $.ajax({
      method: "POST",
      url: "/articles/get_count",
      data: { id: $(this).data('id') }
    })
      .done(function( data ) {
        $('#likeCount').text(data.likes);
      });
  })
});
