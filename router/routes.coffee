Router.configure
# Have to set a progressDelay > 0 as the multiply:iron-router-progress seems to conflict
# with the JS from Metronic and the menu keeps collapsing just after opening after switching the
# orientation of the screen dynamically.
  progressDelay: 100

# Redirect
Router.route '/', ->
  @redirect '/admin'

# Home/Dashboard
Router.route '/admin', (->
    @layout 'appLayout'
    @render 'home'
  )
, name: 'admin'
, parentMenu: 'admin'
, childMenu: ''
, breadcrumb: [{text: 'Home', routeName: 'admin'}]
, h1: 'Dashboard'
, h2: 'Home'
# Router.current().route.options[0].text

# Sales
Router.route '/admin/sales/order', (->
    @layout 'appLayout'
    @render 'salesOrderList'
  )
, name: 'salesOrderList'
, parentMenu: 'sales'
, childMenu: 'salesOrderList'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Sales', routeName: '#'},
  {text: 'Order List', routeName: 'salesOrderList'}]
, h1: 'Order List'
, h2: ''

Router.route '/admin/sales/order/create', (->
    @layout 'appLayout'
    @render 'salesOrderCreate'
  )
, name: 'salesOrderCreate'
, parentMenu: 'sales'
, childMenu: 'salesOrderCreate'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Sales', routeName: '#'},
  {text: 'Create Order', routeName: 'salesOrderCreate'}]
, h1: 'Create Order'
, h2: ''

# product
Router.route '/admin/product/transportation', (->
    @layout 'appLayout'
    @render 'productTransportation'
  )
, name: 'productTransportation'
, parentMenu: 'product'
, childMenu: 'productTransportation'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Product', routeName: '#'},
  {text: 'Transportation', routeName: 'productTransportation'}]
, h1: 'Product - Transportation'
, h2: 'Flight, Bus, Train, Ferry, Ship'

Router.route '/admin/product/car', (->
    @layout 'appLayout'
    @render 'productCar'
  )
, name: 'productCar'
, parentMenu: 'product'
, childMenu: 'productCar'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Product', routeName: '#'},
  {text: 'Car', routeName: 'productCar'}]
, h1: 'Product - Car'
, h2: ''

Router.route '/admin/product/camper', (->
    @layout 'appLayout'
    @render 'productCamper'
  )
, name: 'productCamper'
, parentMenu: 'product'
, childMenu: 'productCamper'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Product', routeName: '#'},
  {text: 'Camper', routeName: 'productCamper'}]
, h1: 'Product - Camper'
, h2: ''

Router.route '/admin/product/hotel', (->
    @layout 'appLayout'
    @render 'productHotel'
  )
, name: 'productHotel'
, parentMenu: 'product'
, childMenu: 'productHotel'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Product', routeName: '#'},
  {text: 'Hotel', routeName: 'productHotel'}]
, h1: 'Product - Hotel'
, h2: ''


Router.route '/admin/product/misc', (->
    @layout 'appLayout'
    @render 'productMiscellaneous'
  )
, name: 'productMiscellaneous'
, parentMenu: 'product'
, childMenu: 'productMiscellaneous'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Product', routeName: '#'},
  {text: 'Miscellaneous', routeName: 'productMiscellaneous'}]
, h1: 'Product - Miscellaneous'
, h2: 'Transfer, Excursion, Tickets, ...'

Router.route '/admin/product/text', (->
    @layout 'appLayout'
    @render 'productText'
  )
, name: 'productText'
, parentMenu: 'product'
, childMenu: 'productText'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Product', routeName: '#'},
  {text: 'Text', routeName: 'productText'}]
, h1: 'Product - Text'
, h2: 'Text Elements for Orders'

Router.route '/admin/product/package', (->
    @layout 'appLayout'
    @render 'productPackage'
  )
, name: 'productPackage'
, parentMenu: 'product'
, childMenu: 'productPackage'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Product', routeName: '#'},
  {text: 'Package', routeName: 'productPackage'}]
, h1: 'Product - Package'
, h2: ''

Router.route '/admin/setup/camper', (->
    @layout 'appLayout'
    @render 'setupCamper'
  )
, name: 'setupCamper'
, parentMenu: 'setup'
, childMenu: 'setupCamper'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Setup', routeName: '#'},
  {text: 'Camper', routeName: 'setupCamper'}]
, h1: 'Setup - Camper'
, h2: ''

Router.route '/admin/setup/car', (->
    @layout 'appLayout'
    @render 'setupCar'
  )
, name: 'setupCar'
, parentMenu: 'setup'
, childMenu: 'setupCar'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Setup', routeName: '#'},
  {text: 'Car', routeName: 'setupCar'}]
, h1: 'Setup - Car'
, h2: ''

Router.route '/admin/setup/general', (->
    @layout 'appLayout'
    @render 'setupGeneral'
  )
, name: 'setupGeneral'
, parentMenu: 'setup'
, childMenu: 'setupGeneral'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Setup', routeName: '#'},
  {text: 'General', routeName: 'setupGeneral'}]
, h1: 'Setup - General'
, h2: ''

Router.route '/admin/setup/hotel', (->
    @layout 'appLayout'
    @render 'setupHotel'
  )
, name: 'setupHotel'
, parentMenu: 'setup'
, childMenu: 'setupHotel'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Setup', routeName: '#'},
  {text: 'Hotel', routeName: 'setupHotel'}]
, h1: 'Setup - Hotel'
, h2: ''

Router.route '/admin/setup/import', (->
    @layout 'appLayout'
    @render 'setupImport'
  )
, name: 'setupImport'
, parentMenu: 'setup'
, childMenu: 'setupImport'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Setup', routeName: '#'},
  {text: 'Import', routeName: 'setupImport'}]
, h1: 'Setup - Import'
, h2: ''

Router.route '/admin/setup/order', (->
    @layout 'appLayout'
    @render 'setupOrder'
  )
, name: 'setupOrder'
, parentMenu: 'setup'
, childMenu: 'setupOrder'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Setup', routeName: '#'},
  {text: 'Order', routeName: 'setupOrder'}]
, h1: 'Setup - Order'
, h2: ''

Router.route '/admin/setup/supplier', (->
    @layout 'appLayout'
    @render 'setupSupplier'
  )
, name: 'setupSupplier'
, parentMenu: 'setup'
, childMenu: 'setupSupplier'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Setup', routeName: '#'},
  {text: 'Supplier', routeName: 'setupSupplier'}]
, h1: 'Setup - Supplier'
, h2: ''

Router.route '/admin/setup/transportation', (->
    @layout 'appLayout'
    @render 'setupTransportation'
  )
, name: 'setupTransportation'
, parentMenu: 'setup'
, childMenu: 'setupTransportation'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Setup', routeName: '#'},
  {text: 'Transportation', routeName: 'setupTransportation'}]
, h1: 'Setup - Transportation'
, h2: ''

Router.route '/admin/statistics/profitmargin', (->
    @layout 'appLayout'
    @render 'statisticsProfitMargin'
  )
, name: 'statisticsProfitMargin'
, parentMenu: 'statistics'
, childMenu: 'statisticsProfitMargin'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Statistics', routeName: '#'},
  {text: 'Profit Margin', routeName: 'statisticsProfitMargin'}]
, h1: 'Statistics - Profit Margin'
, h2: ''

Router.route '/admin/statistics/turnover', (->
    @layout 'appLayout'
    @render 'statisticsTurnover'
  )
, name: 'statisticsTurnover'
, parentMenu: 'statistics'
, childMenu: 'statisticsTurnover'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Statistics', routeName: '#'},
  {text: 'Turnover', routeName: 'statisticsTurnover'}]
, h1: 'Statistics - Turnover'
, h2: ''

Router.route '/admin/accounting/bsp', (->
    @layout 'appLayout'
    @render 'accountingBsp'
  )
, name: 'accountingBsp'
, parentMenu: 'accounting'
, childMenu: 'accountingBsp'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Accounting', routeName: '#'},
  {text: 'Bsp', routeName: 'accountingBsp'}]
, h1: 'Accounting - Bsp'
, h2: ''

Router.route '/admin/accounting/credit', (->
    @layout 'appLayout'
    @render 'accountingCredit'
  )
, name: 'accountingCredit'
, parentMenu: 'accounting'
, childMenu: 'accountingCredit'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Accounting', routeName: '#'},
  {text: 'Credit', routeName: 'accountingCredit'}]
, h1: 'Accounting - Credit'
, h2: ''

Router.route '/admin/accounting/debit', (->
    @layout 'appLayout'
    @render 'accountingDebit'
  )
, name: 'accountingDebit'
, parentMenu: 'accounting'
, childMenu: 'accountingDebit'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Accounting', routeName: '#'},
  {text: 'Debit', routeName: 'accountingDebit'}]
, h1: 'Accounting - Debit'
, h2: ''

Router.route '/admin/accounting/setup', (->
    @layout 'appLayout'
    @render 'accountingSetup'
  )
, name: 'accountingSetup'
, parentMenu: 'accounting'
, childMenu: 'accountingSetup'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Accounting', routeName: '#'},
  {text: 'Setup', routeName: 'accountingSetup'}]
, h1: 'Accounting - Setup'
, h2: ''

Router.route '/admin/customer/agent', (->
    @layout 'appLayout'
    @render 'customerAgent'
  )
, name: 'customerAgent'
, parentMenu: 'customer'
, childMenu: 'customerAgent'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Customer', routeName: '#'},
  {text: 'Agent', routeName: 'customerAgent'}]
, h1: 'Customer - Agent'
, h2: 'Travel Agents'

Router.route '/admin/customer/consumer', (->
    @layout 'appLayout'
    @render 'customerConsumer'
  )
, name: 'customerConsumer'
, parentMenu: 'customer'
, childMenu: 'customerConsumer'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Customer', routeName: '#'},
  {text: 'Consumer', routeName: 'customerConsumer'}]
, h1: 'Customer - Consumer'
, h2: 'Private persons, companies, ...'

Router.route '/admin/internal/employee', (->
    @layout 'appLayout'
    @render 'internalEmployee'
  )
, name: 'internalEmployee'
, parentMenu: 'internal'
, childMenu: 'internalEmployee'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Internal', routeName: '#'},
  {text: 'Employee', routeName: 'internalEmployee'}]
, h1: 'Internal - Employee'
, h2: ''

Router.route '/admin/internal/task', (->
    @layout 'appLayout'
    @render 'internalTask'
  )
, name: 'internalTask'
, parentMenu: 'internal'
, childMenu: 'internalTask'
, breadcrumb: [{text: 'Home', routeName: 'admin'}, {text: 'Internal', routeName: '#'},
  {text: 'Task', routeName: 'internalTask'}]
, h1: 'Internal - Task'
, h2: 'Task List'





