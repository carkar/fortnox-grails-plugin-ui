<%@ page import="grails.converters.XML" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title></title>
</head>
<body>
<g:form action="contactSave">
    <fieldset>
    <g:hiddenField name="id" value="${contact.id}"/>
    <legend>Kontakt</legend>
    <label>Namn</label>
    <g:textField name="name" value="${contact.name}"/>
    <label>Epost</label>
    <g:textField name="email" value="${contact.email}"/>

    <label class="radio">
        <input type="radio" name="custtype" id="custtype1" value="2" ${contact.custtype.equals("2")?"checked":""}>
        Privatperson
    </label>
    <label class="radio">
        <input type="radio" name="custtype" id="custtype2" value="1" ${contact.custtype.equals("1")?"checked":""}>
        Företag
    </label>

    <button type="submit" class="btn">Spara</button> <g:link action="contactList" class="btn">Avbryt</g:link>
    <fieldset>
</g:form>
</body>
</html>