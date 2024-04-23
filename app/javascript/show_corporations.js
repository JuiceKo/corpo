document.addEventListener('DOMContentLoaded', function() {
    const showAllAdherentsCheckbox = document.getElementById('show_all_adherents');

    showAllAdherentsCheckbox.addEventListener('change', function() {
        document.getElementById('filter-form').submit();
    });
});