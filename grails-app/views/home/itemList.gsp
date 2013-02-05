<%@ page contentType="text/html;charset=UTF-8" %>
<%
    def colorsMapping = [green: "success", yellow: "warning", "red": "error", "grey": "info"]
%>
<html>
<head>
    <meta name='layout' content='main'/>
    <title></title>
</head>
<body>

<h1>Artiklar <g:link class="pull-right btn" action="itemForm">Skapa ny</g:link></h1>

<table class="table">
    <tr>
        <th>ID</th>
        <th alt="">Namn</th>
        <th>Pris</th>
    </tr>

    <g:each in="${items}" var="item">
        <tr>
            <td><g:link action="itemForm" id="${item.id}">${item.id}</g:link></td>
            <td><g:link action="itemForm" id="${item.id}">${item.descr}</g:link></td>
            <td><g:each in="${item.price.lists}" var="price">
                ${price.key}, ${price.value}kr<br>
            </g:each></td>

        </tr>
    </g:each>


</table>
</body>
</html>