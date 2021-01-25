import intlTelInput from 'intl-tel-input';
import 'intl-tel-input/build/css/intlTelInput.css';

$( document ).on('turbolinks:load', function() {
    const input = document.querySelector("#user_phone_number");
    intlTelInput(input, {
        allowDropdown:true,
        autoPlaceholder:'polite'
    });

});

