document.addEventListener('DOMContentLoaded', function() {
    const selectAnnee = document.querySelector('#annee');
    const linkDownloadPDF = document.querySelector('#link-download-pdf');

    selectAnnee.addEventListener('change', function() {
        const selectedAnnee = selectAnnee.value;
        const href = linkDownloadPDF.getAttribute('data-original-href');
        linkDownloadPDF.setAttribute('href', href + '?annee=' + selectedAnnee);
    });
});
