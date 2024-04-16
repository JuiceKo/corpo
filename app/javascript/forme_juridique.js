import $ from 'jquery';

$(document).ready(function() {
    $('#autre-option').change(function() {
        if ($(this).is(':checked')) {
            $('.text-field').prop('disabled', false);
        } else {
            $('.text-field').prop('disabled', true);
        }
    });

    $('form').submit(function() {
        if ($('#autre-option').is(':checked')) {
            var autreValeur = $('.text-field').val();
            $('input[name="coiffeur[forme_juridique]"]').val(autreValeur);
        }
    });
});