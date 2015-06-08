<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.*"%>
<%@ page import="develop.com.jackmytour.core.*"%>
<%@ page import="develop.com.jackmytour.core.Utils"%>
<%@ page import="java.util.Arrays" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
   <% ArrayList<Item> selectedRestaurants = (ArrayList
                            <Item>) request.getAttribute("selectedRestaurants");
   
   ArrayList<Item> selectedDrinks= (ArrayList
           <Item>) request.getAttribute("selectedDrinks");
   
   ArrayList<Item> selectedSports = (ArrayList
           <Item>) request.getAttribute("selectedSports");
   
   
   ArrayList<Item> selectedMusics = (ArrayList
           <Item>) request.getAttribute("selectedMusics");
   

   
   ArrayList<String> addresses = (ArrayList
           <String>) request.getAttribute("addresses");
   
   System.out.println("Addresses size: " + addresses.size());
   
   for(String ad : addresses) {
	   System.out.println(ad);
   }
   
   String location = (String) session.getAttribute("location");
   
   System.out.println("Location= "+ location);
   

   
  
   %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <title>Jack My Tour</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
     <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/fontawesome/4.3.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:700,600,400&subset=latin,latin-ext" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/awesome-bootstrap-checkbox/v0.2.3/awesome-bootstrap-checkbox.min.css" />
    <link rel="stylesheet" href="css/styles.css">



    <!--[if IE]>
        <script src="https://cdn.jsdelivr.net/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://cdn.jsdelivr.net/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body ng-app onload="initialize()"  >

   

    <div class="container">

        <div ng-include="'header.html'"></div>

    </div>

    <main>

        <div class="container">
            <div class="row">
            
           
						
                <div class="panel-group col-xs-12" id="accordion" role="tablist" aria-multiselectable="true">
                <% boolean firstRound=true; 
				String from = (String) session.getAttribute("from");
                String to = (String)   session.getAttribute("to");
                   
                   List <Date> dates= Utils.getDaysBetweenDatesPlusOne(from, to);

                   int x = 0;
					for(Date day:dates){
						
						
						%>
                    <div class="panel panel-default servus">
                        <div class="panel-heading heading-vertical" role="tab" id="headingOne">
                            <h4 class="panel-title title-vertical">
        <a data-toggle="collapse" data-parent="#accordion" href="#<%=x%>" aria-expanded="true" aria-controls="<%=x%>">
           <span class="date"><% out.write(Utils.formatDate(day)); %></span>
        </a>
      </h4>
                        </div>
                        <div id="<%=x%>" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body body-vertical">
                                <div class="lala">
                                    <div class="panel panel-default day">
                                        <div class="panel-body day-body">
                                            <div id="line" class="col-xs-2">
                                                <div class="line">
                                                    <div class="dot">
                                                        <div class="horizline"></div><span>10:00</span>
                                                    </div>
                                                    <div class="dot">
                                                        <div class="horizline"></div><span>11:00</span>
                                                    </div>
                                                    <div class="dot">
                                                        <div class="horizline"></div><span>12:00</span>
                                                    </div>
                                                    <div class="dot">
                                                        <div class="horizline"></div><span>13:00</span>
                                                    </div>
                                                    <div class="dot">
                                                        <div class="horizline"></div><span>14:00</span>
                                                    </div>
                                                    <div class="dot">
                                                        <div class="horizline"></div><span>15:00</span>
                                                    </div>
                                                    <div class="dot">
                                                        <div class="horizline"></div><span>16:00</span>
                                                    </div>
                                                </div>

                                            </div>
                                            <% if(firstRound){ %>
                                            <ul class="list-unstyled col-xs-9">
                                               								   
                               <% // String Array rests cretes an array of all possible stop on your journey
								   
								   if (selectedRestaurants != null) 
								   {
								      for (Item res : selectedRestaurants) 
								      {%>
                                               
                                                <li class="panel panel-primary">
                                                    <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                                    <div class="panel-body item">
                                                        <img id="icon" src="images/icons/food.png" alt="food">
                                                        <h3 class="name"><% out.println(res.getName());%></h3>
                                                        <p class="address" id="<%out.println(res.getAddress());%>">Address: <% out.println(res.getAddress());%> <a href=""></a>
                                                        </p>
                                                    </div>
                                                </li>
                                                
                                                <%}
								   
								   } 
                               if (selectedDrinks != null) {
                                                for (Item drink : selectedDrinks) 
								      {%>
                                               
                                                <li class="panel panel-primary">
                                                    <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                                    <div class="panel-body item">
                                                       <img id="icon" src="images/icons/drink.png" alt="drinks">
                                                        <h3 class="name"><% out.println(drink.getName());%></h3>
                                                        <p class="address" id="<%out.println(drink.getAddress());%>">Address: <% out.println(drink.getAddress());%> <a href=""></a>
                                                        </p>
                                                    </div>
                                                </li>
                                                
                                                <%}}
                                                
                              				if (selectedMusics != null) {
                               					for (Item music : selectedMusics) 
								      {%>
                                               
                                                <li class="panel panel-primary">
                                                    <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                                    <div class="panel-body item">
                                                        <img id="icon" src="images/icons/music.png" alt="music">
                                                        <h3 class="name"><% out.println(music.getName());%></h3>
                                                        <p class="address"  id="<%out.println(music.getAddress());%>">Address: <% out.println(music.getAddress());%> <a href=""></a>
                                                        </p>
                                                    </div>
                                                </li>
                                                
                                                <%} }
                                                
                              				 if (selectedSports != null) {
                              					for (Item sport : selectedSports) 
								      {%>
                                               
                                                <li class="panel panel-primary">
                                                    <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                                    <div class="panel-body item">
                                                        <img id="icon" src="images/icons/sport.png" alt="sports">
                                                        <h3 class="name"><% out.println(sport.getName());%></h3>
                                                        <p class="address"  id="<%out.println(sport.getAddress());%>">Address: <% out.println(sport.getAddress());%> <a href=""></a>
                                                        </p>
                                                    </div>
                                                </li>
                                                
                                                <%} 
                              					 
                              					}%>

                                            </ul>
                                            <% } else { %><ul class="list-unstyled col-xs-9"></ul><%} %>
                                        </div>
                                        <div class="panel-footer">
                                            <span data-toggle="modal" data-target="#myModal">Add </span>
                                            <span class="glyphicon glyphicon-plus smaller"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

<% x++; firstRound= false; } //end for each %>
                    <div class="panel panel-default" id="lastmap">
                        <div class="panel-heading heading-vertical" role="tab" id="headingMap">
                            <h4 class="panel-title title-vertical">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseMap" aria-expanded="true" aria-controls="collapseMap">
          Map
        </a>
      </h4>
                        </div>
                        <div id="collapseMap" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingMap">
                            <div class="panel-body body-vertical">
                                <div class="lala">
                                    <div id="map-canvas">
                                        <p>Map</p>
                                    </div>
                                    <button class="btn btn-primary btn-lg" id="updaterout" onclick="UpdateR()">Update rout</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="myModalLabel">Add personal event</h4>
                            </div>
                            <div class="modal-body">
                                <form class="row">
                                        <div class="form-group col-xs-12">
                                    <label for="item-name">Name:</label>
                                        <input type="text" name="item-name" id="item-name">
                                    </div>
                                        
                                    <div class="form-group col-xs-12">
                                        <label for="item-address">Address:</label>
                                        <input type="text" name="item-address" id="item-address"></div>
                                    
                                    <div class="form-group col-xs-12">
                                        <div class="col-xs-6  personal-time">
                        <label for="time">From:</label>
                        <input type="time" class="form-control" id="time"></div>
                                       <div class="col-xs-6 personal-time">
                                        <label for="time">To:</label>
                        <input type="time" class="form-control" id="time"></div>
                    </div>
    
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Create</button>
                            </div>
                        </div>
                    </div>
                </div></div>
                <div class="row">
		<form class="col-xs-4 col-xs-offset-4" id="pdf" method="post" action="pdfGenerator">
        <INPUT class="btn btn-primary btn-lg btn-block" TYPE=submit name=submit Value="Generate pdf guide" id="ag">
        </form>
            </div>
            
        </div>
        
    </main>
    <div class="container footer">

        <div ng-include="'footer.html'"></div>

    </div>

    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.4/angular.min.js"></script>


<script type="text/javascript">
var directionDisplay;
var directionsService = new google.maps.DirectionsService();
var map;
var jsArray = [];

function initialize() {
	
	this.jsArray.length = 0;
	
    <%for(int i=0;i<addresses.size();i++){%>
    	jsArray.push("<%= addresses.get(i)%>");
    
    <%}%>
    
    directionsDisplay = new google.maps.DirectionsRenderer();
    var chicago = new google.maps.LatLng(41.850033, -87.6500523);
    var myOptions = {
        zoom: 6,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: chicago
    };
    map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
    directionsDisplay.setMap(map);
    calcRoute();
}


function calcRoute() {
	var waypoints = [];
    var location = "<%= location %>";
    
	var origin;
	var destination;
	
	if(jsArray.length == 2) {
		origin = jsArray[0]+","+location;
    	destination = jsArray[1]+","+location;
        var request = {
                origin: origin,
                destination: destination,
                optimizeWaypoints: true,
                travelMode: google.maps.DirectionsTravelMode.WALKING
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                    var route = response.routes[0];
                    //var summaryPanel = document.getElementById("directions_panel");
                    //summaryPanel.innerHTML = "";
                    // For each route, display summary information.
                     for (var i = 0; i < route.legs.length; i++) {
                        var routeSegment = i + 1;
                        /* summaryPanel.innerHTML += "<b>Route Segment: " + routeSegment + "</b><br />";
                        summaryPanel.innerHTML += route.legs[i].start_address + " to ";
                        summaryPanel.innerHTML += route.legs[i].end_address + "<br />";
                        summaryPanel.innerHTML += route.legs[i].distance.text + "<br /><br />"; */
                    }
                } else {
                    //alert("directions response " + status);
                } 
            });
    	
    }else if(jsArray.length > 2) { 
    	
    	origin = jsArray.shift()+","+location;
    	destination = jsArray.pop()+","+location;
    	
    	for(var i =0; i<jsArray.length; i++) {
        	//alert(jsArray[i]);
        	// here the waypoint objects array,to be passed in the google request, is populated
        	waypoints.push({location:jsArray[i]+","+location,stopover:true});
        }
        
        var request = {
                origin: origin,
                destination: destination,
                waypoints: waypoints,
                optimizeWaypoints: true,
                travelMode: google.maps.DirectionsTravelMode.WALKING
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                    var route = response.routes[0];
                    //var summaryPanel = document.getElementById("directions_panel");
                    //summaryPanel.innerHTML = "";
                    // For each route, display summary information.
                     for (var i = 0; i < route.legs.length; i++) {
                        var routeSegment = i + 1;
                        /* summaryPanel.innerHTML += "<b>Route Segment: " + routeSegment + "</b><br />";
                        summaryPanel.innerHTML += route.legs[i].start_address + " to ";
                        summaryPanel.innerHTML += route.legs[i].end_address + "<br />";
                        summaryPanel.innerHTML += route.legs[i].distance.text + "<br /><br />"; */
                    }
                } else {
                    alert("directions response " + status);
                } 
            });
        
    	
    }
      

}


function calcRoute2(dayArray) {
	var waypoints = [];
    var location = "<%= location %>";
    
	var origin;
	var destination;
	var marker;
	
	if(dayArray.length == 1) { 
		origin = location;
    	destination = dayArray[0]+","+location;
        var request = {
                origin: origin,
                destination: destination,
                optimizeWaypoints: true,
                travelMode: google.maps.DirectionsTravelMode.WALKING
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                    var route = response.routes[0];
                    //var summaryPanel = document.getElementById("directions_panel");
                    //summaryPanel.innerHTML = "";
                    // For each route, display summary information.
                     for (var i = 0; i < route.legs.length; i++) {
                        var routeSegment = i + 1;
                        /* summaryPanel.innerHTML += "<b>Route Segment: " + routeSegment + "</b><br />";
                        summaryPanel.innerHTML += route.legs[i].start_address + " to ";
                        summaryPanel.innerHTML += route.legs[i].end_address + "<br />";
                        summaryPanel.innerHTML += route.legs[i].distance.text + "<br /><br />"; */
                    }
                } else {
                    //alert("directions response " + status);
                } 
            });
	}
	
	if(dayArray.length == 2) {
		origin = dayArray[0]+","+location;
    	destination = dayArray[1]+","+location;
        var request = {
                origin: origin,
                destination: destination,
                optimizeWaypoints: true,
                travelMode: google.maps.DirectionsTravelMode.WALKING
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                    var route = response.routes[0];
                    //var summaryPanel = document.getElementById("directions_panel");
                    //summaryPanel.innerHTML = "";
                    // For each route, display summary information.
                     for (var i = 0; i < route.legs.length; i++) {
                        var routeSegment = i + 1;
                        /* summaryPanel.innerHTML += "<b>Route Segment: " + routeSegment + "</b><br />";
                        summaryPanel.innerHTML += route.legs[i].start_address + " to ";
                        summaryPanel.innerHTML += route.legs[i].end_address + "<br />";
                        summaryPanel.innerHTML += route.legs[i].distance.text + "<br /><br />"; */
                    }
                } else {
                    //alert("directions response " + status);
                } 
            });
    	
    }else if(dayArray.length > 2) { 
    	
    	origin = dayArray.shift()+","+location;
    	destination = dayArray.pop()+","+location;
    	
    	for(var i =0; i<dayArray.length; i++) {
        	//alert(jsArray[i]);
        	// here the waypoint objects array,to be passed in the google request, is populated
        	waypoints.push({location:dayArray[i]+","+location,stopover:true});
        }
        
        var request = {
                origin: origin,
                destination: destination,
                waypoints: waypoints,
                optimizeWaypoints: true,
                travelMode: google.maps.DirectionsTravelMode.WALKING
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                    var route = response.routes[0];
                    //var summaryPanel = document.getElementById("directions_panel");
                    //summaryPanel.innerHTML = "";
                    // For each route, display summary information.
                     for (var i = 0; i < route.legs.length; i++) {
                        var routeSegment = i + 1;
                        /* summaryPanel.innerHTML += "<b>Route Segment: " + routeSegment + "</b><br />";
                        summaryPanel.innerHTML += route.legs[i].start_address + " to ";
                        summaryPanel.innerHTML += route.legs[i].end_address + "<br />";
                        summaryPanel.innerHTML += route.legs[i].distance.text + "<br /><br />"; */
                    }
                } else {
                    //alert("directions response " + status);
                } 
            });
        
    	
    }
      

}
</script>
<script type="text/javascript">
	//alert("ma dai");
	var arrayToBePushed = [];
	var form = $("#pdf");
	
	form.submit(function() {
	
	//var arrayToBePushed = [];	
		
	$(".servus").each(function(index,parent) {
		//object to be pushed
		//var day;
		var items = [];
		var date = $(parent).find(".date").text()
		//alert(date);
		$(parent).find("li.panel.panel-primary").each(function(index,child) {
			//alert("servus");
			var name = $(this).find(".name").text();
			var address = $(this).find(".address").attr("id");
			item = {name: name,address: address};
			items.push(item);
			//alert(name);
			//alert(address);
		});
		arrayToBePushed.push({date:date,items:items});
			
		
	});callServlet();arrayToBePushed = [];});
	

	
	function callServlet() {
		
		//var word = "servus";
		for(var i =0; i<arrayToBePushed.length; i++) {
	
		var day = arrayToBePushed[i];
		var date = day.date;
		//alert(date);
		var arrayItem = day.items; 

			for(var j = 0; j<arrayItem.length;j++) {
				var item = arrayItem[j];
				//alert(item.name);
				//alert(item.address);
			}
		}
		
		//var data = JSON.stringify(arrayToBePushed);
		
		//$.download('pdfGenerator','data='+data);

		//$.post('pdfGenerator', {word:word, mode:"insert"});
 		$.ajax({
            url:"exportTrip",
            type:"post",
            //dataType:'json',
            data : JSON.stringify(arrayToBePushed),
            //contentType: 'application/pdf',
            //mimeType: 'application/pdf',
            success: function(data) { 
            	//window.location = data;
                //alert('Hi');
             },
         error: function(jqXHR, textStatus, errorThrown,data) {
             alert("error occurred: " + textStatus + " " + errorThrown);
             window.location.href = data;
         } 

        });
	}
	
</script>

<script type="text/javascript">

$('.panel-collapse:not("#collapseMap")').each(function () {
    $(this).on('show.bs.collapse', function (index) {
        if ($('#collapseMap').hasClass('in')) {
        	var CurrentItems = new Array();
        	$(this).find("li.panel.panel-primary").each(function(index,child) {
    			//alert("servus");
    			var address = $(this).find(".address").attr("id");
    			CurrentItems.push(address);
    			
        	});
        	calcRoute2(CurrentItems);
        };
    });
});

</script>



<script type="text/javascript">

function UpdateR(){
	var currentday = $('.in:not("#collapseMap")');
		if ($('#collapseMap').hasClass('in')) {
        	var CurrentItems = new Array();
        	currentday.find("li.panel.panel-primary").each(function(index,child) {
    			//alert("servus");
    			var address = $(this).find(".address").attr("id");
    			CurrentItems.push(address);
    			
        	});
        	calcRoute2(CurrentItems);
		};
	
};
</script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/sortable.js"></script>
    <script type="text/javascript" src="js/closable.js"></script>
    <script type="text/javascript" src="js/agenda-tab.js"></script>


</body>

</html>