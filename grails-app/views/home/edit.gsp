<%@ page import="grails.converters.XML" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title></title>
</head>
<body>

<h1>Kund</h1>

    ${contact.id}<br>
    ${contact.name}<br>

    <h3>Fakturera</h3>

    <g:form action="invoice" class="form-inline">
        <g:select name="itemId" from="${items}" optionKey="id" optionValue="descr"/>
        <g:hiddenField name="contactId" value="${contact.id}"/>
        <g:submitButton name="test" value="Ok" class="btn"/>
    </g:form>

</body>
</html>