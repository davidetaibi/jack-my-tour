<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,600,400&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/awesome-bootstrap-checkbox/v0.2.3/awesome-bootstrap-checkbox.min.css" />
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.4/angular.min.js"></script>
    <script type="text/javascript" src="datepicker.js"></script>
    
    <!--[if IE]>
        <script src="https://cdn.jsdelivr.net/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://cdn.jsdelivr.net/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body ng-app>
    
 
    <div class="container">
    
        <div ng-include="'header.html'"></div>
        
    </div>

    
    <main class="container-fluid startpage">
        <div class="row-fluid" id="row1">
            <div class="col-xs-12 startpage">
                <img class="img-responsive" src="images/DSC_7227_2.jpg">
            </div> 
            
        </div>
        
         <div class="row">
            <form action="search" method="post" class="form-inline col-sm-10 col-sm-offset-1 col-lg-8 col-lg-offset-2">
                
                <label id="question">Where and when?</label>
                
                <fieldset class="row">
                    <div class="form-group col-sm-5" id="group-location">
                        <label for="location">Location:</label>
                        <input type="text" name="location" class="form-control" id="location" placeholder="Bolzano">
                    </div>
                  

                    <div class="form-group col-sm-4"  id="group-date1">
                        <label for="from">From:</label>
                        <input type="text" class="form-control" id="from" name="from">
                    </div>
                    
                    <div class="form-group col-sm-4"  id="group-date2">
                        <label for="to">To:</label>
                        <input type="text" class="form-control" id="to" name="to">
                    </div>
                    
                     <div class="form-group col-sm-6">
                        <label for="term">Key word:</label>
                        <input type="text" name="term" class="form-control" id="term" placeholder="example:chinese">
                    </div>       
                </fieldset>
                
                <label id="question">What?</label>
                
                <fieldset class="row">
                    <div class="checkbox checkbox-warning col-xs-6 col-sm-4 col-md-3">
                        <input id="Music" type="checkbox" name="tabs" value="Music" checked>
                        <label  for="Music"> Music </label>
                    </div>

                    <div class="checkbox checkbox-warning col-xs-6 col-sm-4 col-md-3">
                        <input id="Food" type="checkbox" name="tabs" value="Food" checked>
                        <label for="Food"> Food </label>
                    </div>

                    <div class="checkbox checkbox-warning col-xs-6 col-sm-4 col-md-3">
                        <input  id="Sports" type="checkbox" name="tabs" value="Sports" checked>
                        <label for="Sports"> Sports </label>
                    </div>

                    <div class="checkbox checkbox-warning col-xs-6 col-sm-4 col-md-3">
                        <input  id="Drinks" type="checkbox" name="tabs" value="Drinks" checked>
                        <label for="Drinks"> Drinks </label>
                    </div>

                </fieldset>
                    
                <div class="col-xs-12 col-sm-offset-4 col-sm-4 col-md-offset-4 col-md-4 text-center">
                    
                    <input type="submit" value="Search" role="button" class="btn btn-primary btn-lg btn-block"/>
                </div>
            </form>
        </div>
        
        <div class="row-fluid">
        
        <div class="col-xs-12 description">
        

            
<div class="row centerText">
    
    <div class="col-sm-4 extraP">
        <span class="glyphicon glyphicon-map-marker bigger"></span>
        
        <p class="extraP">Start with your exact location to see what is going on for the day, or plan ahead and search for a city that you are traveling to. </p>
    </div>
    <div class="col-sm-4 extraP">
        <span class="glyphicon glyphicon-road bigger"></span>
        <p class="extraP"> Jack My Tour will help you create an agenda for your travels. Just plug in your location, date, and time and let us do the work for you!</p>
    </div>
    <div class="col-sm-4 extraP">
        <span class="glyphicon glyphicon-info-sign bigger"></span>      
      <p class="extraP">We provide you with the most up to day information to provide you with the best touring experiece possible!</p>
      
    </div>
  </div>  
            </div>
        
            </div>
            
            

     </main>
    
        <div class="container footer" >
    
        <div ng-include="'footer.html'"></div>
        
    </div>
    
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    

</body>

</html>