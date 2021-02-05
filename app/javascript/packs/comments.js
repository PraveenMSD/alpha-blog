$( document ).on('turbolinks:load', function() {
  $("#new_comment").validate({
    rules: {
      "comment[body]": {
        required: true
      }
    }
  });
});
