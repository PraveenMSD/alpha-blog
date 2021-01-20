$( document ).on('turbolinks:load', function() {
    $("#user_base").validate({
      rules: {
        "user[username]": {
          required: true,
        },
        "user[email]": {
          required: true,
        },
        "user[password]": {
          required: true,
        }
      }
    });
  });