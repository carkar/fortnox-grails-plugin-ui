<%@ page import="grails.converters.XML" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title>Artikel</title>
</head>
<body>
<g:form action="itemSave">
    <fieldset>
    <g:hiddenField name="id" value="${item?.id}"/>
    <legend>Kontakt</legend>
    <label>Namn</label>
    <g:textField name="descr" value="${item?.descr}"/>

    <span class="help-block">Example block-level help text here.</span>

    <button type="submit" class="btn">Spara</button> <g:link action="itemList" class="btn">Avbryt</g:link>
    <fieldset>
</g:form>
</body>
</html>