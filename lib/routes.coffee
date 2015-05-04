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
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  }
]
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
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Sales'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Order List'),
    routeName: 'salesOrderList'
  }
]
, h1: 'Order List'
, h2: ''

Router.route '/admin/sales/order/create', (->
    @layout 'appLayout'
    @render 'salesOrderCreate'
  )
, name: 'salesOrderCreate'
, parentMenu: 'sales'
, childMenu: 'salesOrderCreate'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Sales'),
    routeName: '#'
  },
  {
    text: 'Create Order',
    routeName: 'salesOrderCreate'
  }
]
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
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Product'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Transportation'),
    routeName: 'productTransportation'
  }
]
, h1: 'Product - Transportation'
, h2: 'Flight, Bus, Train, Ferry, Ship'

Router.route '/admin/product/car', (->
    @layout 'appLayout'
    @render 'productCar'
  )
, name: 'productCar'
, parentMenu: 'product'
, childMenu: 'productCar'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Product'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Car'),
    routeName: 'productCar'
  }
]
, h1: 'Product - Car'
, h2: ''

Router.route '/admin/product/camper', (->
    @layout 'appLayout'
    @render 'productCamper'
  )
, name: 'productCamper'
, parentMenu: 'product'
, childMenu: 'productCamper'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Product'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Camper'),
    routeName: 'productCamper'
  }
]
, h1: 'Product - Camper'
, h2: ''

Router.route '/admin/product/hotel', (->
    @layout 'appLayout'
    @render 'productHotel'
  )
, name: 'productHotel'
, parentMenu: 'product'
, childMenu: 'productHotel'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Product'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Hotel'),
    routeName: 'productHotel'
  }
]
, h1: 'Product - Hotel'
, h2: ''


Router.route '/admin/product/misc', (->
    @layout 'appLayout'
    @render 'productMiscellaneous'
  )
, name: 'productMiscellaneous'
, parentMenu: 'product'
, childMenu: 'productMiscellaneous'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Product'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Miscellaneous'),
    routeName: 'productMiscellaneous'
  }
]
, h1: 'Product - Miscellaneous'
, h2: 'Transfer, Excursion, Tickets, ...'

Router.route '/admin/product/text', (->
    @layout 'appLayout'
    @render 'productText'
  )
, name: 'productText'
, parentMenu: 'product'
, childMenu: 'productText'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Product'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Text'),
    routeName: 'productText'
  }
]
, h1: 'Product - Text'
, h2: 'Text Elements for Orders'

Router.route '/admin/product/package', (->
    @layout 'appLayout'
    @render 'productPackage'
  )
, name: 'productPackage'
, parentMenu: 'product'
, childMenu: 'productPackage'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Product'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Package'),
    routeName: 'productPackage'
  }
]
, h1: 'Product - Package'
, h2: ''

Router.route '/admin/setup/camper', (->
    @layout 'appLayout'
    @render 'setupCamper'
  )
, name: 'setupCamper'
, parentMenu: 'setup'
, childMenu: 'setupCamper'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Setup'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Camper'),
    routeName: 'setupCamper'
  }
]
, h1: 'Setup - Camper'
, h2: ''

Router.route '/admin/setup/car', (->
    @layout 'appLayout'
    @render 'setupCar'
  )
, name: 'setupCar'
, parentMenu: 'setup'
, childMenu: 'setupCar'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Setup'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Car'),
    routeName: 'setupCar'
  }
]
, h1: 'Setup - Car'
, h2: ''

Router.route '/admin/setup/general', (->
    @layout 'appLayout'
    @render 'setupGeneral'
  )
, name: 'setupGeneral'
, parentMenu: 'setup'
, childMenu: 'setupGeneral'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Setup'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('General'),
    routeName: 'setupGeneral'
  }
]
, h1: 'Setup - General'
, h2: ''

Router.route '/admin/setup/creditcard', (->
    @layout 'appLayout'
    @render 'setupCreditcard'
  )
, name: 'setupCreditcard'
, parentMenu: 'setup'
, childMenu: 'setupCreditcard'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Setup'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Creditcard'),
    routeName: 'setupCreditcard'
  }
]
, h1: 'Setup - Creditcard'
, h2: ''

Router.route '/admin/setup/hotel', (->
    @layout 'appLayout'
    @render 'setupHotel'
  )
, name: 'setupHotel'
, parentMenu: 'setup'
, childMenu: 'setupHotel'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Setup'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Hotel'),
    routeName: 'setupHotel'
  }
]
, h1: 'Setup - Hotel'
, h2: ''

Router.route '/admin/setup/import', (->
    @layout 'appLayout'
    @render 'setupImport'
  )
, name: 'setupImport'
, parentMenu: 'setup'
, childMenu: 'setupImport'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Setup'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Import'),
    routeName: 'setupImport'
  }
]
, h1: 'Setup - Import'
, h2: ''

Router.route '/admin/setup/order', (->
    @layout 'appLayout'
    @render 'setupOrder'
  )
, name: 'setupOrder'
, parentMenu: 'setup'
, childMenu: 'setupOrder'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Setup'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Order'),
    routeName: 'setupOrder'
  }
]
, h1: 'Setup - Order'
, h2: ''

Router.route '/admin/setup/supplier', (->
    @layout 'appLayout'
    @render 'setupSupplier'
  )
, name: 'setupSupplier'
, parentMenu: 'setup'
, childMenu: 'setupSupplier'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Setup'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Supplier'),
    routeName: 'setupSupplier'
  }
]
, h1: 'Setup - Supplier'
, h2: ''

Router.route '/admin/setup/transportation', (->
    @layout 'appLayout'
    @render 'setupTransportation'
  )
, name: 'setupTransportation'
, parentMenu: 'setup'
, childMenu: 'setupTransportation'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Setup'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Transportation'),
    routeName: 'setupTransportation'
  }
]
, h1: 'Setup - Transportation'
, h2: ''

Router.route '/admin/statistics/profitmargin', (->
    @layout 'appLayout'
    @render 'statisticsProfitMargin'
  )
, name: 'statisticsProfitMargin'
, parentMenu: 'statistics'
, childMenu: 'statisticsProfitMargin'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Statistics'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Profit Margin'),
    routeName: 'statisticsProfitMargin'
  }
]
, h1: 'Statistics - Profit Margin'
, h2: ''

Router.route '/admin/statistics/turnover', (->
    @layout 'appLayout'
    @render 'statisticsTurnover'
  )
, name: 'statisticsTurnover'
, parentMenu: 'statistics'
, childMenu: 'statisticsTurnover'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Statistics'),
    routeName: '#'},
  {
    text: -> TAPi18n.__('Turnover'),
    routeName: 'statisticsTurnover'
  }
]
, h1: 'Statistics - Turnover'
, h2: ''

Router.route '/admin/accounting/bsp', (->
    @layout 'appLayout'
    @render 'accountingBsp'
  )
, name: 'accountingBsp'
, parentMenu: 'accounting'
, childMenu: 'accountingBsp'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Accounting'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Bsp'),
    routeName: 'accountingBsp'
  }
]
, h1: 'Accounting - Bsp'
, h2: ''

Router.route '/admin/accounting/credit', (->
    @layout 'appLayout'
    @render 'accountingCredit'
  )
, name: 'accountingCredit'
, parentMenu: 'accounting'
, childMenu: 'accountingCredit'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Accounting'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Creditor'),
    routeName: 'accountingCredit'
  }
]
, h1: 'Accounting - Credit'
, h2: ''

Router.route '/admin/accounting/debit', (->
    @layout 'appLayout'
    @render 'accountingDebit'
  )
, name: 'accountingDebit'
, parentMenu: 'accounting'
, childMenu: 'accountingDebit'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Accounting'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Debitor'),
    routeName: 'accountingDebit'
  }
]
, h1: 'Accounting - Debit'
, h2: ''

Router.route '/admin/accounting/setup', (->
    @layout 'appLayout'
    @render 'accountingSetup'
  )
, name: 'accountingSetup'
, parentMenu: 'accounting'
, childMenu: 'accountingSetup'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Accounting'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Setup'),
    routeName: 'accountingSetup'
  }
]
, h1: 'Accounting - Setup'
, h2: ''

Router.route '/admin/customer/agent', (->
    @layout 'appLayout'
    @render 'customerAgent'
  )
, name: 'customerAgent'
, parentMenu: 'customer'
, childMenu: 'customerAgent'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Customer'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Agent'),
    routeName: 'customerAgent'
  }
]
, h1: 'Customer - Agent'
, h2: 'Travel Agents'

Router.route '/admin/customer/consumer', (->
    @layout 'appLayout'
    @render 'customerConsumer'
  )
, name: 'customerConsumer'
, parentMenu: 'customer'
, childMenu: 'customerConsumer'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Customer'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Consumer'),
    routeName: 'customerConsumer'
  }
]
, h1: 'Customer - Consumer'
, h2: 'Private persons, companies, ...'

Router.route '/admin/internal/employee', (->
    @layout 'appLayout'
    @render 'internalEmployee'
  )
, name: 'internalEmployee'
, parentMenu: 'internal'
, childMenu: 'internalEmployee'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Internal'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Employee'),
    routeName: 'internalEmployee'
  }
]
, h1: 'Internal - Employee'
, h2: ''

Router.route '/admin/internal/task', (->
    @layout 'appLayout'
    @render 'internalTask'
  )
, name: 'internalTask'
, parentMenu: 'internal'
, childMenu: 'internalTask'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Internal'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('Task'),
    routeName: 'internalTask'
  }
]
, h1: 'Internal - Task'
, h2: 'Task List'

Router.route '/admin/internal/profile', (->
    @layout 'appLayout'
    @render 'internalProfile'
  )
, name: 'internalProfile'
, parentMenu: 'internal'
, childMenu: 'internalProfile'
, breadcrumb: [
  {
    text: -> TAPi18n.__('Home'),
    routeName: 'admin'
  },
  {
    text: -> TAPi18n.__('Internal'),
    routeName: '#'
  },
  {
    text: -> TAPi18n.__('My Profile'),
    routeName: 'internalTask'
  }
]
, h1: 'Internal - My Profile'
, h2: 'My Profile'





