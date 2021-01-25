$( document ).on('turbolinks:load', function() {
    $("#user_base").validate({
      rules: {
        "user[username]": {
          required: true
        },
        "user[email]": {
          required: true
        },
        "user[password]": {
          required: true
        },
        "user[confirm_password]": {
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

  

