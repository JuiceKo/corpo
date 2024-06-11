document.addEventListener('turbo:load', function() {
    const showAllAdherentsCheckbox = document.getElementById('show_all_adherents');

    if (showAllAdherentsCheckbox) {
        showAllAdherentsCheckbox.addEventListener('change', function() {
            document.getElementById('combined-form').submit();
        });
    }
});