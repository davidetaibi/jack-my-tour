$('.panel-collapse:not("#collapseMap")').collapse('show');
$('.panel-collapse:not("#collapseMap, #collapseOne")').collapse('hide');


$('.panel-collapse:not("#collapseMap")').each(function () {
    $(this).on('show.bs.collapse', function (index) {
        if ($('#collapseMap').hasClass('in')) {
            $('.panel-collapse:not("#collapseMap")').not(this).collapse('hide');

        };
    });
});

$('#collapseMap')
    .on('show.bs.collapse', function () {
        $('.panel-collapse:not("#collapseMap")').collapse('hide');
    })

.on('shown.bs.collapse', function () {
    $('#collapseOne').collapse('show');
})

.on('hide.bs.collapse', function () {
    $('.panel-collapse:not("#collapseMap")').collapse('show');
})

.on('hidden.bs.collapse', function () {
    $('.panel-collapse:not("#collapseMap, .in")').collapse('show');
});