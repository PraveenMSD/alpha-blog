$( document ).on('turbolinks:load', function() {
    $("#new_user").validate({
      rules: {
        "user[email]": {
          required: true
        },
        "user[password]": {
          required: true
        },
        "user[password_confirmation]": {
          required: true,
          equalTo: "#user_password"
        },
        "user[phone_number]": {
            required: true,
            number: true,
            minlength: 10,
            maxlength: 10
        },
        "user[city]": {
            required: true
        },
        "user[state]": {
            required: true
        },
        "user[zip_code]": {
            required: true
        },
        "user[country_code]": {
            required: true,
        }
      }
    });
  });