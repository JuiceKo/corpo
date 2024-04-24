/* COPAMA */

document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.radio-button').forEach(function(radioButton) {
        radioButton.addEventListener('change', function() {
            var selectedValue = this.value;
            document.getElementById('total-amount-field').value = selectedValue;
        });
    });
});