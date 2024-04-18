document.addEventListener('DOMContentLoaded', function() {
    const voirLinks = document.querySelectorAll('.voir-link');

    voirLinks.forEach(voirLink => {
        voirLink.addEventListener('click', function(event) {
            const adherentId = this.dataset.adherentId;
            const selectedYear = document.querySelector(`#form-year-${adherentId}`).value;
            const corporationId = this.dataset.corporationId;

            const url = `/corporations/${corporationId}/adherents/${adherentId}/formulaires/${selectedYear}`;
            window.location.href = url;
        });
    });
});
;

