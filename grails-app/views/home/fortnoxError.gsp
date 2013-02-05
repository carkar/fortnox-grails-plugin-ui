<%--
  Created by IntelliJ IDEA.
  User: calle
  Date: 12/19/12
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title></title>
</head>
<body>
<div class="alert alert-error">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <h4>Fortnox svarade med ett fel!</h4>
    Nånting gick fel i kommunikationen med Fortnox API.
</div>

<h3>HTTP Response</h3>
<pre>${exception.cause.error.reponseXml.encodeAsHTML()}</pre>

<h3>HTTP Request</h3>
<pre>${exception.cause.error.requestBody.encodeAsHTML()}</pre>

</body>
</html>