document.addEventListener('DOMContentLoaded', function() {
    var totalAmountField = document.getElementById('total-amount-field');
    var checkboxes = document.querySelectorAll('.amount-checkbox');
    var multiplyField = document.getElementById('amount-to-multiply');
    var multiplyResultField = document.getElementById('Multiply-amount-field');

    checkboxes.forEach(function(checkbox) {
        if (!checkbox.classList.contains('hasEventListener')) {
            checkbox.classList.add('hasEventListener');
            checkbox.addEventListener('change', function() {
                console.log(this.id + ' checkbox has been clicked'); // Add this line
                var amount = parseFloat(this.dataset.amount);
                var total = parseFloat(totalAmountField.value) || 0;

                if (this.checked) {
                    total += amount;
                } else {
                    total -= amount;
                }

                totalAmountField.value = total.toFixed(2);
            });
        }
    });

    multiplyField.addEventListener('input', function() {
        var multiplyField = document.getElementById('amount-to-multiply');
        var multiplyAmount = parseFloat(multiplyField.dataset.multiplyAmount);
        var multiplyValue = parseFloat(multiplyField.value) || 0;
        var multiplyResult = multiplyValue * multiplyAmount;
        var total = parseFloat(totalAmountField.value) || 0;

        total -= parseFloat(multiplyResultField.value) || 0;
        total += multiplyResult;

        multiplyResultField.value = multiplyResult.toFixed(2);
        totalAmountField.value = total.toFixed(2);
    });
});