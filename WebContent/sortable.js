 $(function() {
    $( "ul" ).sortable({
      connectWith: "ul",
        scroll : false,
        placeholder: "placeholder",
    }).disableSelection();
  });