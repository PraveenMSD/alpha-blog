$( document ).on('turbolinks:load', function() {
  $("#new_article").validate({
    rules: {
      "article[title]": {
        required: true,
      },
      "article[description]": {
        required: true,
        minlength: 5
      }
    }
  });
});