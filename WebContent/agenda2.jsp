<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Calendar"%>
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
   	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
	<meta http-equiv="pragma" content="no-cache" />

	<!-- The following line is a work around to fix a bug in FireFox browser.
		 If some CSS or JS is changed it is not loaded, but the old version is loaded from the local cache.
		 So, uncomment the line when you move the JS code at the bottom into a JS file and reference it there.
	-->
	<!-- <script type="text/javascript" src='js/my.js?x=<?php echo rand(0,100) ?>'></script> -->
    
    <title>Jack My Tour</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

	<script src="Web2Cal/js/sampleData.js" type="text/javascript"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.js"></script>
	<script src="Web2Cal/js/Web2Cal-Basic-2.0-min.js" type="text/javascript"></script>
	<script src="Web2Cal/js/web2cal.default.template.js" type="text/javascript"></script>
	<script src="Web2Cal/js/web2cal.support.js" type="text/javascript"></script>
	<link rel="stylesheet" href="Web2Cal/css/web2cal.css"/>


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

        <div ng-include="'header.jsp'"></div>

    </div>

    <main>

        <div class="container">
            <div class="row">
            
           
				<div id="calendarContainer"></div>			
                <div class="panel-group col-xs-12" id="accordion" role="tablist" aria-multiselectable="true">
                <% boolean firstRound=true; 
				String from = (String) session.getAttribute("from");
				StringBuilder sb = new StringBuilder();
				sb.append(from);
                String to = (String)   session.getAttribute("to");
                   
                   List <Date> dates= Utils.getDaysBetweenDatesPlusOne(from, to);

                   int x = 0;
// 					for(Date day:dates){
						
						
						%>
<!--                     <div class="panel panel-default servus"> -->
<!--                         <div class="panel-heading heading-vertical" role="tab" id="headingOne"> -->
<!--                             <h4 class="panel-title title-vertical"> -->
<%--         <a data-toggle="collapse" data-parent="#accordion" href="#<%=x%>" aria-expanded="true" aria-controls="<%=x%>"> --%>
<%--            <span class="date"><% out.write(Utils.formatDate(day)); %></span> --%>
<!--         </a> -->
<!--       </h4> -->
<!--                         </div> -->
<%--                         <div id="<%=x%>" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne"> --%>
<!--                             <div class="panel-body body-vertical"> -->
<!--                                 <div class="lala"> -->
<!--                                     <div class="panel panel-default day"> -->
<!--                                         <div class="panel-body day-body"> -->
<!--                                             <div id="line" class="col-xs-2"> -->
<!--                                                 <div class="line"> -->
<!--                                                     <div class="dot"> -->
<!--                                                         <div class="horizline"></div><span>10:00</span> -->
<!--                                                     </div> -->
<!--                                                     <div class="dot"> -->
<!--                                                         <div class="horizline"></div><span>11:00</span> -->
<!--                                                     </div> -->
<!--                                                     <div class="dot"> -->
<!--                                                         <div class="horizline"></div><span>12:00</span> -->
<!--                                                     </div> -->
<!--                                                     <div class="dot"> -->
<!--                                                         <div class="horizline"></div><span>13:00</span> -->
<!--                                                     </div> -->
<!--                                                     <div class="dot"> -->
<!--                                                         <div class="horizline"></div><span>14:00</span> -->
<!--                                                     </div> -->
<!--                                                     <div class="dot"> -->
<!--                                                         <div class="horizline"></div><span>15:00</span> -->
<!--                                                     </div> -->
<!--                                                     <div class="dot"> -->
<!--                                                         <div class="horizline"></div><span>16:00</span> -->
<!--                                                     </div> -->
<!--                                                 </div> -->

<!--                                             </div> -->
<%--                                             <% if(firstRound){ %> --%>
<!--                                             <ul class="list-unstyled col-xs-9"> -->
                                               								   
                               <% // String Array rests cretes an array of all possible stop on your journey
								   
// 								   if (selectedRestaurants != null) 
// 								   {
// 								      for (Item res : selectedRestaurants) 
// 								      {
								      %>
                                               
<!--                                                 <li class="panel panel-primary"> -->
<!--                                                     <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span> -->
<!--                                                     <div class="panel-body item"> -->
<!--                                                         <img id="icon" src="images/icons/food.png" alt="food"> -->
<%--                                                         <h3 class="name"><% out.println(res.getName());%></h3> --%>
<%--                                                         <p class="address" id="<%out.println(res.getAddress());%>">Address: <% out.println(res.getAddress());%> <a href=""></a> --%>
<!--                                                         </p> -->
<!--                                                     </div> -->
<!--                                                 </li> -->
                                                
                                                <%
//                                      }
// 								   } 
//                                if (selectedDrinks != null) {
//                                                 for (Item drink : selectedDrinks) 
// 								      {
								      %>
                                               
<!--                                                 <li class="panel panel-primary"> -->
<!--                                                     <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span> -->
<!--                                                     <div class="panel-body item"> -->
<!--                                                        <img id="icon" src="images/icons/drink.png" alt="drinks"> -->
<%--                                                         <h3 class="name"><% out.println(drink.getName());%></h3> --%>
<%--                                                         <p class="address" id="<%out.println(drink.getAddress());%>">Address: <% out.println(drink.getAddress());%> <a href=""></a> --%>
<!--                                                         </p> -->
<!--                                                     </div> -->
<!--                                                 </li> -->
                                                
<%--                                                 <%}} --%>
                                  <%
//                               				if (selectedMusics != null) {
//                                					for (Item music : selectedMusics) 
// 								      {
								      %>
                                               
<!--                                                 <li class="panel panel-primary"> -->
<!--                                                     <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span> -->
<!--                                                     <div class="panel-body item"> -->
<!--                                                         <img id="icon" src="images/icons/music.png" alt="music"> -->
<%--                                                         <h3 class="name"><% out.println(music.getName());%></h3> --%>
<%--                                                         <p class="address"  id="<%out.println(music.getAddress());%>">Address: <% out.println(music.getAddress());%> <a href=""></a> --%>
<!--                                                         </p> -->
<!--                                                     </div> -->
<!--                                                 </li> -->
                                                
<%--                                                 <%} } --%>
                                       <%         
//                               				 if (selectedSports != null) {
//                               					for (Item sport : selectedSports) 
// 								      {
								      %>
                                               
<!--                                                 <li class="panel panel-primary"> -->
<!--                                                     <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span> -->
<!--                                                     <div class="panel-body item"> -->
<!--                                                         <img id="icon" src="images/icons/sport.png" alt="sports"> -->
<%--                                                         <h3 class="name"><% out.println(sport.getName());%></h3> --%>
<%--                                                         <p class="address"  id="<%out.println(sport.getAddress());%>">Address: <% out.println(sport.getAddress());%> <a href=""></a> --%>
<!--                                                         </p> -->
<!--                                                     </div> -->
<!--                                                 </li> -->
                                                
<%--                                                 <%}  --%>
                              					 
<%--                               					}%> --%>

<!--                                             </ul> -->
<%--                                             <% } else { %><ul class="list-unstyled col-xs-9"></ul><%} %> --%>
<!--                                         </div> -->
<!--                                         <div class="panel-footer"> -->
<!--                                             <span data-toggle="modal" data-target="#myModal">Add </span> -->
<!--                                             <span class="glyphicon glyphicon-plus smaller"></span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->

<%-- <% x++; firstRound= false; } //end for each %> --%>
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
                                    <button class="btn btn-primary btn-lg" id="updaterout" onclick="UpdateR()">Update route</button>
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
	
    <%try{
    	String startAddress= (String)session.getAttribute("StartAddress");
    	if(!startAddress.isEmpty()){
    		startAddress=session.getAttribute("location")+", "+startAddress;
    %>
    jsArray.push("<%=startAddress%>");   
    <%
    	}	
    }
    catch(Exception e){
    	e.printStackTrace();
    }
    for(int i=0;i<addresses.size();i++){%>
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

<script> 
// window.location.reload(true);
var iCal;

jQuery(document).ready(function(){ 
	
//* All calendar OPTIONS are put here, before creating the object!!!!!
//* To disable "Create Event", in web2cal.default.template.js is commented the line in <var load = function...] where the code for the pop-up is appended.
//* To enable "Update Event" when an event is dragged on the calendar, just call our updateEvent(). It calls the Web2Cal's func updateEvent() and updates our list of events.  
	var from_pieces = '<%=from%>'.split("/");
	Web2Cal.defaultSettings['date'] = new Date(from_pieces[2], from_pieces[0]-1, from_pieces[1]);
// 	Web2Cal.defaultSettings["newEventTemplate"] = "tisho"; //You don't disable "Create Event" by specifying different callback func.
	iCal = new Web2Cal( "calendarContainer",
       { 
            loadEvents: function(startDate, endDate, viewName){ 
                            /* Get events from any source. This can be a PHP/Java/.NET/Facebook or any other source. Once you have the data, invoke ical.render(data).*/
                           //var data = { eventId:521, eventName:"Pick up pizza", eventDesc:"from Joe's", date: "2015/11/26"}
                           //ical.render( eventSource.getEvents() );
                           //iCal.render( getCalendarData() );
                           
                          
            				 iCal.render( getJackMyTourEvents() );
                        } 
                        <%//System.out.println("from & to from the session onject according to Java: \n"+
                          //				from + "\n" +
                       	  //			to);%>
//            ,onNewEvent: function(event, groups, allDay){ alert("onNewEvent called") } 
           ,onUpdateEvent: function(event){ /*updateEvent(event);*/ }
       });
       //iCal.controlWidth = '50%';
    
    iCal.build();
    
//     var grp = document.getElementsByClassName("grp");
//     var iDiv = document.createElement('div');
//     iDiv.className = 'clear';
//     grp.appendChild(iDiv);
}); 

function getJackMyTourEvents() {
	
	
	
	var groups = new Array();
 var food_events = new Array();
 <%
 	int restaurants_counter = 0;
	
	   if (selectedRestaurants != null) 
	   {
		   
		   //long duration_food = Long.valueOf(request.getParameter("food-duration"));
		   //long duration_food = 540000; //1:30
		   %>
		   alert("alive");
<%-- 		   var duration_restaurants = <%= duration_food %>;     --%>
		   
		<%	
	      for (Item res : selectedRestaurants) {
	    	  restaurants_counter++;
	    	  System.out.println("Restaurants :" + restaurants_counter);%>
	    	  var event_name = <%= "\"" + res.getName() + "\""%>;
	    	  var event_number = <%= restaurants_counter %>;
	    	  var event_address = <%= "\"" + res.getAddress() + "\"" %>;
	    	  <% if(res.getPhoneNumber() == null) {%>
	    	  var event_phone = <%= new Integer("1234567") %>;
	    	  <% ; } else { %>
	    	  var event_phone = <%= new Integer(res.getPhoneNumber()) %>;	  
	    	  <% ; } %>
	    	  var duration_restaurants = <%= res.getDuration() %>;
	    	  
	    	  <%
	    		//Here we update the JSP lists which we obtained in this file (i.e. they are database entries??)
	    	  	//before having the algorithm, update the List of Items in JSP with this:
	    	  	//Note that in Java we store the dates in Calendar objects and manipulate Date objs by converting withCalendar.getTime()
// 	    	  	System.out.println("startDate from selectedRestaurants: " + res.getStartTime().getTime());
// 	    	  	String[] yymmdd = from.split("/");
// 	    	  	System.out.println(from);
				
				Calendar startTime = res.getStartTime();
	    	  	startTime.set(res.getStartTime().get(Calendar.YEAR), 
	    	  				  res.getStartTime().get(Calendar.MONTH), 
	    	  				  res.getStartTime().get(Calendar.DAY_OF_MONTH), 
	    	  								   9,   0); //params are: year, month, date, hour, minute
	    	  	System.out.println("startTime from selectedRestaurants: " + startTime.getTime());
	    	  	//Calendar -> Date use Calendar.getTime()
	    	  	//  OR Clendar.getDisplayName(field, style, locale) : String
	    	  	//  OR Calendar.get(field) : int
	    	  	//Date -> Calendar use Calendar.setTime(Date)
// 	    	  	System.err.println("eventStart = " + eventStart.getTime() + " / \n.toString() = " + eventStart.getTime().toString());
				res.setStartTime(startTime);	    	  	
	    	  	res.setEndTime(Utils.addDate(startTime, Long.parseLong(res.getDuration())));
			  %>
			  
	    	  
	    	  //var date = <should take not the 'from' variable but the one assigned from the algorithm.
	    	  //var date = '< %=from%>';
	    	  var date = '<%=String.format("%02d", res.getStartTime().get(Calendar.MONTH)+1)%>' + '/' + 
	    	  			 '<%=String.format("%02d", res.getStartTime().get(Calendar.DAY_OF_MONTH))%>' + '/' +
	    	  			 '<%=res.getStartTime().get(Calendar.YEAR)%>'
			  	    	
// 	    	  alert("var date = " + date + "\nvar date2 = " + date2);
	    	  alert("date = " + date);
	    	  var event_start_DATE = createDateTime(9, 0, 0, date);
	    	  var event_start_DATE_msecs = event_start_DATE.getTime();
	    	  var event_start = new UTC(event_start_DATE_msecs);
	    	 
	    	  alert("duration_restaurants = " + duration_restaurants);
	    	  var event_end_ADDED = dateAdd(event_start_DATE_msecs, duration_restaurants);
	    	  var event_end_DATE = createDateTime(event_end_ADDED.getHours(), event_end_ADDED.getMinutes(), 0, date);
	    	  var event_end = new UTC(event_end_DATE.getTime());
	    	  
	    	  
	    	  
	    	  
	    	  
//	    	  alert("event start: " + event_start + "\n" +
//	    			"event_end_DATE.getHours() = " + event_end_DATE.getHours() + "\n" +
//	    			"event_end_DATE.getMinutes() = " + event_end_DATE.getMinutes() + "\n" +
//	    			"event end: " + event_end);

			alert("--| FOOD |--\n"+
				  "event_name: " + event_name + "\n"+
				  "event_number: " + event_number + "\n"+
				  "event_address: " + event_address + "\n"+
				  "event_phone: " + event_phone + "\n"+
				  "event_start: " + event_start + "\n"+
				  "event_end: " + event_end);
	    	  food_events.push(createEvent(event_name, event_number, event_address, "Phone: "+event_phone, event_start, event_end, "Change the start time and end time and THIS description", false));
	    	  //alert("Phone: <" + event_phone + ">");
	    	  
	    	 
	    	  
	      <%
	      }
		%>
		
// 		alert("food_events.length = " + food_events.length);
		
		   // events.push(createEvent("Default event", event_number+1, "Default place", "Default_John Smith, Sue, James, Dan, Lisa", createDateTime(9, 0, 0), createDateTime(12, 0, 0), "Default descrption", false));
//	     events.push(createEvent("Another Event 300", 9, "yoga aud", "John Smith", createDateTime(9, 0, 2), createDateTime(12, 30, 2), "Yoga is good for health", false));
	    //alert(events.length);
	    var group_food = {
	        name: "Restaurants",
	        groupId: "100",
			show:true,
	        events: food_events 
	    };
	    groups.push(group_food);
		
	<%
	   }
	%> 
	

//  var events = new Array();
 
//	events.push(createEvent("Morning Yoga", 10, "Yoga Auditorium", "Instructor1", createDateTime(15, 0, 1), createDateTime(19, 30, 1), "Morning Yoga is good for health"));
//  events.push(createEvent("Event <b>HTML</b> 2", 11, "Event Location 2", "Instructor2", createDateTime(8, 0, -1), createDateTime(10, 30, -1), "Event Description ..."));
//  events.push(createEvent("<div style='color:red'>Event 3</div>", 12, "Event Location 3", "Instructor3", createDateTime(11, 0, 0), createDateTime(15, 45, 0), "Event Description ..."));
//  events.push(createEvent("Customizable with Templates....", 13, "Event Location 4", "Instructor4", createDateTime(6, 0), createDateTime(10, 0), "Event Description ..."));
//  events.push(createEvent("Event 5", 14, "Event Location 5", "Instructor5", createDateTime(7, 0), createDateTime(10, 0), "Event Description ..."));
 
//  events.push(createEvent("Event 6", 15, "Event Location 6", "Instructor6", createDateTime(16, 0, -2), createDateTime(20, 0, -2), "Event Description ..."));
//  events.push(createEvent("Event 7", 16, "Event Location 7", "Instructor7", createDateTime(10, 0, -3), createDateTime(15, 0, -3), "Event Description ..."));
//  events.push(createEvent("Event 8", 17, "Event Location 8", "Instructor8", createDateTime(9, 0, -5), createDateTime(11, 15, -5), "Event Description ..."));
//  events.push(createEvent("Event 9", 18, "Event Location 9", "Instructor9", createDateTime(9, 0, 1), createDateTime(11, 15, 1), "Event Description ..."));
 

//  var group = {
//      name: "Category 2",
//      groupId: "200",
//      events: events 
//  }; 
// d.push(group);


//==============================================================================================
	
	//paste here

		
	   // events.push(createEvent("Default event", event_number+1, "Default place", "Default_John Smith, Sue, James, Dan, Lisa", createDateTime(9, 0, 0), createDateTime(12, 0, 0), "Default descrption", false));
//  events.push(createEvent("Another Event 300", 9, "yoga aud", "John Smith", createDateTime(9, 0, 2), createDateTime(12, 30, 2), "Yoga is good for health", false));
 //alert(events.length);

 
 //////////////////////////////////////////////////////////////////////
 <%
//  long duration_drinks = Long.valueOf(request.getParameter("drinks-duration"));
//	long duration_sports = Long.valueOf(request.getParameter("sports-duration"));
	%>
	
//	 var duration_sports = < %= duration_sports %>;
//  var duration_drinks = < %= duration_drinks %>;
//////////////////////////////////////////////////////////////////////

 return groups;

}

/*
* param date - the date in milliseconds to which we want to add or subtract some time
* param units - specifies the the amount of time in milliseconds to be added or subtracted to the date.
*/
function dateAdd(date, units) {
	alert("hello from dateAdd!! Date passed = " + date +
			"\nDate added = " + (date+units));
	return new Date(date+units);
	  
}

function updateEvent(event) {
// 	alert("Event start time: " + event.startTime +
// 			"\nEvent end time: " + event.endTime);

	alert("In updateEvent():\nevent id = " + event.eventId + 
		  "\nevent start = " + event.startTime +
		  "\nevent end = " + event.endTime);
	
	
                $.ajax({
                    type: "post",
                    url: "testme", //this is my servlet
                    data: "input=" +$('#ip').val()+"&output="+$('#op').val(),
                    success: function(msg){      
                            alert("Event updated with AJAX!");
                    }
                });
           
	
	iCal.updateEvent(event);
	
	
}

</script> 



    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/sortable.js"></script>
    <script type="text/javascript" src="js/closable.js"></script>
    <script type="text/javascript" src="js/agenda-tab.js"></script>


</body>

</html>