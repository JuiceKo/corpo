document.addEventListener('DOMContentLoaded', function() {
    const selectElements = document.querySelectorAll('.year-select');
    selectElements.forEach(selectElement => {
        selectElement.addEventListener('change', function() {
            const corporationId = selectElement.dataset.corporationId;
            const adherentId = selectElement.dataset.adherentId;
            const selectedYear = this.value;
            const url = `/corporations/${corporationId}/adherents/${adherentId}/formulaires/${selectedYear}`;
            window.location.href = url;
        });
    });
});