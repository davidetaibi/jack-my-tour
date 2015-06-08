 $(function() {
    $( "ul" ).sortable({
      connectWith: "ul",
        scroll : false,
        placeholder: "placeholder",
        /*sort: function() {
        console.log("Drag fired!");
        $(".panel-heading").hover(function () {
            $(this).parent(".panel-default").children('.panel-collapse:not("#collapseMap")').collapse('show');
        });
        }*/
    }).disableSelection();
  });