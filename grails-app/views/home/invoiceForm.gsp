
<%
    def colorsMapping = [green: "success", yellow: "warning", "red": "important"]
%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title></title>

</head>
<body>

<h1>Faktura</h1>

<g:form action="invoiceSave">
    <g:hiddenField name="id" value="${invoice.id?:""}"/>
    <div class="row">
        <div class="span3">
            <label>Kund</label>
            <g:select name="contact" from="${contacts}" optionKey="id" optionValue="name" value="${invoice?.contact?.id}"/>
        </div>
        <div class="span2">
            <label>Status</label>
            <span class="label label-${colorsMapping[invoice.status]}">${invoice.status}</span>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="span2">
            <label>Faktura datum</label>
            <g:textField name="tdate" class="span2" value="${invoice.tdate}"/>
        </div>
        <div class="span2">
            <label>Förfallodatum</label>
            <g:textField name="edate" class="span2" value="${invoice.edate}"/>
        </div>
        <div class="span2">
            <label>Betald</label>
            <g:textField name="ddate" class="span2" value="${invoice.ddate}"/>
        </div>
        <div class="span2">
            <label>Totalt</label>${invoice.total}
        </div>
        <div class="span2">
            <label>Varav moms</label>${invoice.totalvat} (${invoice.vat}%)
        </div>
        <div class="span2">
            <label>Totalt</label>${invoice.total}
        </div>

    </div>
    <div class="row">
        <div class="span2">
            <label>Fakturatext</label>
            <g:textArea rows="2" name="remark" class="span4" value="${invoice.remark}"/>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="span12">
            <table class="table">
                <thead>
                <tr>
                    <th>Artikel nr.</th>
                    <th>Beskrivning</th>
                    <th>Antal</th>
                    <th>Enhet</th>
                    <th>Pris</th>
                    <th>Moms</th>
                </tr>
                </thead>

                <tbody>
                <g:each in="${invoice.invoicerows}" var="row" status="idx">

                    <tr>
                        <td width="80"><g:select from="${items}"
                                                 noSelection="['': 'Ingen artikel']"
                                                 optionKey="id" optionValue="descr"
                                                 name="rows.${idx}.prodno" value="${row.prodno}"/></td>
                        <td><g:textField name="rows.${idx}.descr" class="span3" value="${row.descr}"/></td>
                        <td><g:textField name="rows.${idx}.amount" class="span1" value="${row.amount}"/></td>
                        <td><g:textField name="rows.${idx}.unit" class="span1" value="${row.unit}"/></td>
                        <td><g:textField name="rows.${idx}.price" class="span1" value="${row.price}"/></td>
                        <td><g:textField name="rows.${idx}.vat" class="span1" value="${row.vat}"/></td>
                        <td>${row.price_inc_vat}</td>
                    </tr>

                </g:each>

                </tbody>
                <tfoot>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th>${invoice.total}</th>
                </tr>
                </tfoot>
            </table>

            <g:submitButton name="btnSubmit" class="btn" value="Spara"/>
            <g:link name="btnCancel" id="${invoice.id}" class="btn" action="invoiceCancel">Makulera</g:link>
            <g:link name="btnBack" class="btn" action="invoiceList">Avbryt</g:link>

        </div>
    </div>
</g:form>
</body>
</html>