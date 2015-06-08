$(function() {
    $( "#from" ).datepicker({
      defaultDate: "+1w",
      changeMonth: false,
      numberOfMonths: 1,
      onClose: function( selectedDate ) {
        $( "#to" ).datepicker( "option", "minDate", selectedDate );
      }
    });
    $( "#to" ).datepicker({
      defaultDate: "+1w",
      changeMonth: false,
      numberOfMonths: 1,
      onClose: function( selectedDate ) {
        $( "#from" ).datepicker( "option", "maxDate", selectedDate );
        var date1 = $("#from").datepicker('getDate');
        var date2 = $("#to").datepicker('getDate');
        var dayDiff = Math.ceil((date2 - date1) / (1000 * 60 * 60 * 24)); 
       
        var i=0;
        var DateArray = new Array();
        
        for(; date1 <= date2; date1.setDate(date1.getDate() + 1)) {
    	   
    	   var day = date1.getDate();
           var month = date1.getMonth()+1;
           var year = date1.getFullYear();
           var date = year+"/"+month+"/"+day;
           DateArray[i] = date;
           i++;
    	}
      }
    });
    
    

  });