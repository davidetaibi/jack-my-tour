<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.ArrayList" %>
        <%@ page import="java.util.Iterator" %>
        <%@ page import="develop.com.jackmytour.core.Restaurant" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta name="description" content="Jack My Tour application">
    <meta name="author" content="Matas Turskis">
    <title>Jack My Tour</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>

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

<body ng-app  onload="calcRoute()">

<%@ page import="java.util.Arrays" %>
   <% ArrayList<Restaurant> selectedRestaurants = (ArrayList
                            <Restaurant>) request.getAttribute("selectedRestaurants"); %>    

    <div class="container">

        <div ng-include="'header.html'"></div>

    </div>

    <main>

        <div class="container">
            <div class="row">
                <div class="panel-group col-xs-12" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading heading-vertical" role="tab" id="headingOne">
                            <h4 class="panel-title title-vertical">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            Monday <span>2015-04-20</span>
        </a>
      </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body body-vertical">
                                <div class="lala">
                                    <div class="panel panel-default day">
                                        <div class="panel-body day-body">
                                            <div class="col-xs-3">
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
                                            <ul id="draggablePanelList" class="list-unstyled col-xs-9">
                                               								   
                               <% // String Array rests cretes an array of all possible stop on your journey
								   
								   if (selectedRestaurants.size() != 0) 
								   {
								      for (Restaurant res : selectedRestaurants) 
								      {%>
                                               
                                                <li class="panel panel-primary">
                                                    <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                                    <div class="panel-body item">
                                                        <h3><% out.println(res.getName());%></h3>
                                                        <p class="item_description">Address: <% out.println(res.getAddress());%> <a href=""></a>
                                                        </p>
                                                    </div>
                                                </li>
                                                
                                                <%}} %>

                                            </ul>
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



                    <div class="panel panel-default">
                        <div class="panel-heading heading-vertical" role="tab" id="headingTwo">
                            <h4 class="panel-title title-vertical">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Tuesday <span>2015-04-21</span>
        </a>
      </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body body-vertical">
                                <div class="lala">
                                    <div class="panel panel-default day">
                                        <div class="panel-body day-body">
                                            <div class="col-xs-3">
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
                                            <ul id="draggablePanelList" class="list-unstyled col-xs-9">
                                                <li class="panel panel-primary">
                                                    <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                                    <div class="panel-body item">
                                                        <h3>Item1</h3>
                                                        <p class="item_description">Description: blah blah blah blah blah blah blah <a href="">Read more...</a>
                                                        </p>
                                                    </div>
                                                </li>

                                                <li class="panel panel-primary">
                                                    <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                                    <div class="panel-body item">
                                                        <h3>Item2</h3>
                                                        <p class="item_description">Description: blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah</p>
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
                                    </div>.</div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading heading-vertical" role="tab" id="headingThree">
                            <h4 class="panel-title title-vertical">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Wednesday <span>2015-04-22</span>
        </a>
      </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body body-vertical">
                                <div class="lala">
                                    <div class="panel panel-default day">
                                        <div class="panel-body day-body">
                                            <div class="col-xs-3">
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
                                            <ul id="draggablePanelList" class="list-unstyled col-xs-9">
                                                <li class="panel panel-primary">
                                                    <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                                    <div class="panel-body item">
                                                        <h3>Item1</h3>
                                                        <p class="item_description">Description: blah blah blah blah blah blah blah <a href="">Read more...</a>
                                                        </p>
                                                    </div>
                                                </li>

                                                <li class="panel panel-primary">
                                                    <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                                    <div class="panel-body item">
                                                        <h3>Item2</h3>
                                                        <p class="item_description">Description: blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah</p>
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
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading heading-vertical" role="tab" id="headingFour">
                            <h4 class="panel-title title-vertical">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
          Thursday <span>2015-04-23</span>
        </a>
      </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                            <div class="panel-body body-vertical">
                                <div class="lala">
                                    <div class="panel panel-default day">
                                        <div class="panel-body day-body">
                                            <div class="col-xs-3">
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
                                            <ul id="draggablePanelList" class="list-unstyled col-xs-9">
                                                <li class="panel panel-primary">
                                                    <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                                    <div class="panel-body item">
                                                        <h3>Item1</h3>
                                                        <p class="item_description">Description: blah blah blah blah blah blah blah <a href="">Read more...</a>
                                                        </p>
                                                    </div>
                                                </li>

                                                <li class="panel panel-primary">
                                                    <span class="pull-right clickable" data-effect="remove"><i class="fa fa-times"></i></span>
                                                    <div class="panel-body item">
                                                        <h3>Item2</h3>
                                                        <p class="item_description">Description: blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah</p>
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
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
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
    <script type="text/javascript">
        var map;

        function initialize() {
            var mapOptions = {
                center: new google.maps.LatLng(48.209331, 16.381302),
                zoom: 4
            };
            map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="sortable.js"></script>
    <script type="text/javascript" src="closable.js"></script>
    <script type="text/javascript" src="agenda-tab.js"></script>


</body>

</html>