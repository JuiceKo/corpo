document.addEventListener('DOMContentLoaded', (event) => {
    const radios = document.querySelectorAll('input[type=radio][name="formulaire[forme_juridique]"]');
    const textField = document.getElementById('autre_option-text');

    radios.forEach((radio) => {
        radio.addEventListener('change', function() {
            if (this.value == 'Autre') {
                textField.disabled = false;
            } else {
                textField.disabled = true;
            }
        });
    });
});