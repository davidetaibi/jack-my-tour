<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta name="description" content="Jack My Tour application">
    <meta name="author" content="Matas Turskis">
    <title>Jack My Tour</title>

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


<body ng-app onload="calcRoute()">


<%@ page import="java.util.Arrays" %>
    <div class="container">

        <div ng-include="'header.html'"></div>
   
   <%! String[] rests; %>     
  
    </div>

    <main>

        <div class="container">
            <div class="row">
                <div class="col-sm-5 col-md-4 mobilemargin">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Do this
                        </div>
                        <div class="panel-body">
                            <div class="col-xs-3">
                            <div class="line">
                                <div class="dot"><div class="horizline"></div><span>10:00</span></div>
                                <div class="dot"><div class="horizline"></div><span>11:00</span></div>
                                <div class="dot"><div class="horizline"></div><span>12:00</span></div>
                                <div class="dot"><div class="horizline"></div><span>13:00</span></div>
                                <div class="dot"><div class="horizline"></div><span>14:00</span></div>
                                <div class="dot"><div class="horizline"></div><span>15:00</span></div>
                                <div class="dot"><div class="horizline"></div><span>16:00</span></div>
                            </div>
                            
                            </div>
                            <ul id="draggablePanelList" class="list-unstyled col-xs-9">
                            <li class="panel panel-primary">
                                <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                <div class="panel-body item">
                                    <h3>Item1</h3>
                                    <p class="item_description">Description: blah blah blah blah blah blah blah <a href="">Read more...</a></p>
                                </div>
                            </li>
                            
                               <% // String Array rests cretes an array of all possible stop on your journey
								   rests = request.getParameterValues("rests");
								   if (rests != null) 
								   {
								      for (int i = 0; i < rests.length; i++) 
								      {%>
								    <li class="panel panel-primary">
                                		<span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                		<div class="panel-body item">
                                    		<h3>Restaurant/bar</h3>
                                    	<p class="item_description">Description: <% out.println("<b>"+rests[i]+"<b>");%></p>
                                    	     <% }
								   }
								   //String Array rests into a normal string
								   String str1 = Arrays.toString(rests);               
					                //replace starting "[" and ending "]" and ","
					                str1 = str1.substring(1, str1.length()-1).replaceAll(",", "!!");



								   
								%>
                                	</div>
                            		</li>
								         
								         
								 
                           
                            <li class="panel panel-primary">
                                <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                <div class="panel-body item">
                                    <h3>Item2</h3>
                                    <p class="item_description">Description: blah blah blah blah blah blah blah
                                    blah blah blah blah blah blah blah blah blah blah blah blah blah blah</p>
                                </div>
                            </li>
                            
                            <li class="panel panel-primary">
                                <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                <div class="panel-body item">
                                    <h3>Item3</h3>
                                    <p class="item_description">Description: blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah</p>
                                </div>
                            </li>
                                
                            <li class="panel panel-primary">
                                <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                <div class="panel-body item">
                                    <h3>Item4</h3>
                                    <p class="item_description">Description: blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah</p>
                                </div>
                            </li>    

                            </ul>
                        </div>
                        <div class="panel-footer">
                        <span>Add </span>
                        <span class="glyphicon glyphicon-plus smaller"></span>
                        </div>
                    </div>
                </div>



                <div class="col-sm-7 col-md-8" id="map-canvas">
                    <p>map</p>
                </div>

            </div>
        </div>


    </main>
    <div class="container footer">

        <div ng-include="'footer.html'"></div>

    </div>

    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.4/angular.min.js"></script>

    <script src="https://maps.googleapis.com/maps/api/js">
    </script>
      <script>
        
var arrayOfAddress = ['Via Laurin, 4 39100 Bolzano BZ', ' Piazza Domenicani, 3', 'Via Dottor Streiter, 8d', 'Piazza della Vittoria 39100 Bolzano BZ', 'Piazza Gries, 21 39100 Bolzano BZ'];
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;
var geocoder;

//TEST STUFF
    //testing addresses
    var restTest = "<%= str1 %>";
    var restyTesty = "<%= rests %>";
    console.log("hey");
    console.log(restTest);


function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  
  var mapOptions = {
    zoom:7,
    
  };
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  directionsDisplay.setMap(map);

    
    
      // Try HTML5 geolocation
      if(navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          var pos = new google.maps.LatLng(position.coords.latitude,
                                           position.coords.longitude);
	   // creation of marker on the map
          var marker = new google.maps.Marker({
              position: pos,
              map: map,
              title: 'Hello World!'
          });

          map.setCenter(pos);
        }, function() {
          handleNoGeolocation(true);
        });
      } else {
        // Browser doesn't support Geolocation
        handleNoGeolocation(false);
      }
    }
        
// pushing items to new array called waypoints
var waypts = [];
for ( i=1; i<arrayOfAddress.length-1; i++){
    waypts.push({
          location:arrayOfAddress[i],
          stopover:true});
}
        
var wValue = waypts.valueOf();
console.log(wValue);

function calcRoute() {
  var start = arrayOfAddress[0];
  var end = arrayOfAddress[arrayOfAddress.length-1];
  var request = {
      origin:start,
      destination:end,
      waypoints: waypts,
      optimizeWaypoints: true,
      travelMode: google.maps.TravelMode.DRIVING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });
}

google.maps.event.addDomListener(window, 'load', initialize);


  
    </script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
    <script type="text/javascript" src="draggable.js"></script>
    <script type="text/javascript" src="closable.js"></script>

</body>

</html>