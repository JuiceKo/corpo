/* document.getElementById('download-button').addEventListener('click', function(e) {
    e.preventDefault();
    var form = document.getElementById('form-id');
    form.action = "<%= download_corporation_adherent_formulaire_path(@corporation, adherent, annee: "") %>";
    form.submit();
}); */

document.addEventListener('DOMContentLoaded', function() {
    const selectAnnee = document.querySelector('#annee');
    const linkDownloadPDF = document.querySelector('#link-download-pdf');

    selectAnnee.addEventListener('change', function() {
        const selectedAnnee = selectAnnee.value;
        const href = linkDownloadPDF.getAttribute('data-original-href');
        linkDownloadPDF.setAttribute('href', href + '?annee=' + selectedAnnee);
    });
});
