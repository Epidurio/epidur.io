
$('#input-tags2').selectize({
    maxItems: 3
});

$('#input-tags').selectize({
    delimiter: ',',
    persist: false,
    create: function(input) {
        return {
            value: input,
            text: input
        }
    }
});
