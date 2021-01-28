$( document ).on('turbolinks:load', function() {
    $("#new_category").validate({
      rules: {
        "category[name]": {
          required: true,
          minlength: 5
        }
      }
    });
  });
  