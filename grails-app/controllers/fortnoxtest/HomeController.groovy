package fortnoxtest

import com.matchi.fortnox.authorization.Authentication
import com.matchi.fortnox.domain.Contact
import com.matchi.fortnox.domain.Invoice
import com.matchi.fortnox.domain.InvoiceRow
import com.matchi.fortnox.domain.Item
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap




class HomeController {

    def fortnoxContactService
    def xmlHelper
    def fortnoxItemService
    def fortnoxInvoiceService
    def grailsApplication

    def index() { }

    def contactSave() {
        def auth = createAuthentication()
        def contact = new Contact()
        if (params.id) {
            contact = fortnoxContactService.get(params.id, auth)
        }

        contact.name = params.name
        contact.email = params.email
        contact.custtype = params.getInt("custtype")

        log.info(contact.name)

        fortnoxContactService.set(contact, auth)

        redirect(action: "contactList")
    }

    def contactList() {
        def auth = createAuthentication()
        [contacts: fortnoxContactService.list(auth)]
    }

    def contactForm() {
        def auth = createAuthentication()
        if (params.id) {
            [contact: fortnoxContactService.get(params.id, auth)]
        } else {
            [contact: new Contact()]
        }
    }

    def invoiceList() {
        def auth = createAuthentication()
        render(view: "invoiceList", model: [invoices: fortnoxInvoiceService.list(auth)])
    }

    def invoiceForm() {
        def auth = createAuthentication()
        def invoice = new Invoice()
        def contacts = fortnoxContactService.list(auth)

        if (params.id) {
            invoice = fortnoxInvoiceService.get(auth, params.id)
            if (invoice)
                invoice.id = params.id
        }

        5.times {
            invoice.invoicerows << new InvoiceRow()
        }

        def items = fortnoxItemService.list(auth)

        render(view: "invoiceForm", model: [invoice: invoice, items: items, contacts: contacts])
    }

    def invoiceSave() {
        def auth = createAuthentication()
        def invoice = new Invoice()

        if (params.id) {
            invoice = fortnoxInvoiceService.get(auth, params.id)
            invoice.id = params.id

            log.info(invoice.contact.name)
        }

        List<InvoiceRow> rows = params.rows?.values()?.findAll {
            it instanceof GrailsParameterMap
        }.collect { invoiceParams ->
            def val = new InvoiceRow()
            bindData(val, invoiceParams, [include:
                    ['prodno', 'descr', 'amount', 'unit', 'price', 'vat']])
            val
        }.findAll {
            println it
            it.discount = 0
            return (it.descr != null && !"".equals(it.descr)) || (it.prodno != null && !"".equals(it.prodno))
        }

        bindData(invoice, params, [include:
                ['remark', 'tdate', 'ddate', 'edate']])


        def contact = fortnoxContactService.get(params.contact, auth)


        log.info("Invoice contact is: " + contact)
        invoice.status = null
        invoice.invoicerows = rows
        invoice.contact = new Contact(id: contact.id, name: contact.name)

        log.info("" + invoice.invoicerows.size() + " - " +params.contact)

        fortnoxInvoiceService.set(invoice, auth)


        flash.message = "Faktura sparad"
        redirect(action: "invoiceList")
    }

    def invoiceCancel() {
        def auth = createAuthentication()
        def result = fortnoxInvoiceService.cancel(auth, params.id)

        flash.message = "Faktura sparad"
        redirect(action: "invoiceList")

    }

    def itemList() {
        def auth = createAuthentication()
        def items = fortnoxItemService.list(auth)

        [items:items]
    }

    def itemForm() {
        def auth = createAuthentication()
        if (params.id) {
            [item: fortnoxItemService.get(params.id, auth)]
        } else {
            [contact: new Item()]
        }
    }

    def itemSave() {
        def auth = createAuthentication()
        def item = new Item()
        item.id = "300"
        if (params.id) {
            item = fortnoxItemService.get(params.id, auth)
        }

        item.descr = params.descr
        item.type = "1" // service
        item.unit = "st"


        fortnoxItemService.set(item, auth)

        flash.message = "Artikel sparad"

        redirect(action: "itemList")
    }

    def fortnoxError() {
    }

    private def createAuthentication() {
        def db    = grailsApplication.config.grails.plugins.fortnox.ui.db
        def token = grailsApplication.config.grails.plugins.fortnox.ui.token
        return new Authentication(db: db, token: token)
    }
}
