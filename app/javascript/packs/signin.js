$( document ).on('turbolinks:load', function() {
    $("#user_login").validate({
      rules: {
        "session[email]": {
          required: true,
        },
        "session[password]": {
          required: true,
        }
      }
    });
  });