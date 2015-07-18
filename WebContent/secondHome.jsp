<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="include.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>Apache Shiro Tutorial Webapp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Add some nice styling and functionality.  We'll just use Twitter Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">
    <style>
        body{padding:0 20px;}
    </style>
</head>
<body>

    <h1>Apache Shiro Tutorial Webapp</h1>

    <p>Hi <shiro:guest>Guest</shiro:guest><shiro:user>
        <%
            //This should never be done in a normal page and should exist in a proper MVC controller of some sort, but for this
            //tutorial, we'll just pull out Stormpath Account data from Shiro's PrincipalCollection to reference in the
            //<c:out/> tag next:

            request.setAttribute("account", org.apache.shiro.SecurityUtils.getSubject().getPrincipals().oneByType(java.util.Map.class));

        %>
        <c:out value="${account.givenName}"/></shiro:user>!
        ( <shiro:user><a href="<c:url value="/logout"/>">Log out</a></shiro:user>
        <shiro:guest><a href="<c:url value="/login.jsp"/>">Log in</a></shiro:guest> )
    </p>

    <p>Welcome to the Apache Shiro Tutorial Webapp.  This page represents the home page of any web application.</p>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</body>
</html>
