window.updateShowButton = function(selectElement) {
    var selectedYear = selectElement.value;
    var showButtons = document.getElementsByClassName('show-button');
    for (var i = 0; i < showButtons.length; i++) {
        var showButton = showButtons[i];
        var href = showButton.getAttribute('href');
        var newHref = href.replace(/selected_year=\d+/, 'selected_year=' + selectedYear);
        showButton.setAttribute('href', newHref);
    }
}

