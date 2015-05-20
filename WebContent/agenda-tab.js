$('.panel-collapse:not("#collapseMap")').collapse('show');
$('.panel-collapse:not("#collapseMap, #0")').collapse('hide');


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
        $('#agendarow').css("margin-left", "-15px");
    })

.on('shown.bs.collapse', function () {
    $('#0').collapse('show');
})

.on('hide.bs.collapse', function () {
    $('.panel-collapse:not("#collapseMap")').collapse('show');
    $('#agendarow').css("margin-left", "-50px");
})

.on('hidden.bs.collapse', function () {
    $('.panel-collapse:not("#collapseMap, .in")').collapse('show');
});