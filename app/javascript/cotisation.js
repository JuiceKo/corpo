/* COPAMA */

document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.radio-button').forEach(function(radioButton) {
        radioButton.addEventListener('change', function() {
            var selectedValue = this.value;
            document.getElementById('total-amount-field').value = selectedValue;
        });
    });
});


/* Ébenistes */

document.addEventListener("DOMContentLoaded", function() {
    var amountField1 = document.getElementById('amount-to-multiply-ebe');
    var resultField1 = document.getElementById('Multiply-amount-field-ebe');

    var amountField2 = document.getElementById('amount-to-multiply-ebe-2');
    var resultField2 = document.getElementById('Multiply-amount-field-ebe-2');

    var totalField = document.getElementById('total-amount-field');

    amountField1.addEventListener('input', updateResult1);
    amountField2.addEventListener('input', updateResult2);

    function updateResult1() {
        var montantParametre4 = parseFloat(document.getElementById('montant_parametre_4').value);
        var amount1 = parseInt(amountField1.value) || 0;
        var result1 = amount1 * montantParametre4;
        resultField1.value = result1.toFixed(2) + ' €';
        updateTotal();
    }

    function updateResult2() {
        var montantParametre5 = parseFloat(document.getElementById('montant_parametre_5').value);
        var amount2 = parseInt(amountField2.value) || 0;
        var result2 = amount2 * montantParametre5;
        resultField2.value = result2.toFixed(2) + ' €';
        updateTotal();
    }

    function updateTotal() {
        var total = (parseInt(resultField1.value) || 0) + (parseInt(resultField2.value) || 0);
        totalField.value = total.toFixed(2) + ' €';
    }
});




