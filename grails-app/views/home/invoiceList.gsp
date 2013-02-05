<%@ page contentType="text/html;charset=UTF-8" %>
<%
    def colorsMapping = [green: "success", yellow: "warning", "red": "error", "grey": "info"]
%>
<html>
<head>
    <meta name='layout' content='main'/>
    <title>Artiklar</title>
</head>
<body>

<h1>Fakturor <g:link class="pull-right btn" action="invoiceForm">Skapa ny</g:link></h1>

<table class="table">
    <tr>
        <th>ID</th>
        <th alt="">Typ</th>
        <th>Total</th>
        <th class="hidden-phone">Faktura datum</th>
        <th class="hidden-tablet hidden-phone">Förfallodatum</th>
        <th>Betald</th>
        <th>Kund</th>
    </tr>

    <g:each in="${invoices}" var="invoice">
        <tr class="${colorsMapping.get(invoice.color)}">
            <td><g:link action="invoiceForm" id="${invoice.id}">${invoice.id}</g:link></td>
            <td>${invoice.type} (${invoice.color})</td>
            <td>${invoice.total}</td>
            <td class="hidden-phone">${invoice.tdate}</td>
            <td class="hidden-tablet hidden-phone">${invoice.edate}</td>
            <td>${invoice.endpay}</td>
            <td>${invoice.contact_name}</td>
        </tr>
    </g:each>

</table>
</body>
</html>