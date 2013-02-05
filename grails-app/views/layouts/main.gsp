<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
    body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
    }
    </style>

    <r:require modules="bootstrap"/>
    <g:layoutHead/>
    <r:layoutResources />
</head>
<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <g:link class="brand" action="index">Fortnox API</g:link>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li><g:link action="contactList">Kontakter</g:link></li>
                    <li><g:link action="invoiceList">Fakturor</g:link></li>
                    <li><g:link action="itemList">Artiklar</g:link></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>

<div class="container">
    <g:if test="${flash.message}">
    <div class="alert alert-info">${flash.message}</div>
    </g:if>

    <g:layoutBody/>
    <hr>
    <footer>
        <p>© Fortnox API | MATCHi AB 2012</p>
    </footer>
</div> <!-- /container -->

<g:javascript library="application"/>
<r:layoutResources />
</body>
</html>