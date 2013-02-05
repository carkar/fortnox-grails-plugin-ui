<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title></title>
</head>
<body>

<h1>Kontakter <g:link class="pull-right btn" action="contactForm">Skapa ny</g:link></h1>

<table class="table">
    <tr>
        <th>ID</th>
        <th>Namn</th>
        <th>Epost</th>
        <th>Typ</th>
    </tr>

    <g:each in="${contacts}" var="contact">
        <tr>
            <td width="40">${contact.id}</td>
            <td width="300"><g:link action="contactForm" id="${contact.id}">${contact.name}</g:link><br></td>
            <td width="300">${contact.email}</td>
            <td><small>${contact.custtype=="1"?"Företag":(contact.custtype=="2"?"Privat":"-")}</small></td>
        </tr>
    </g:each>

</table>

</body>
</html>