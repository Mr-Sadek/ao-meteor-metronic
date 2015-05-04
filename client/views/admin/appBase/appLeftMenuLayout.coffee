Template.appLeftMenuLayout.onCreated ->
  Session.setDefault('routeActiveMenuElement', '')
  Session.setDefault('routeActiveParent', '')
  Session.setDefault('selectedOpenParent', '')

Template.appLeftMenuLayout.events
  "click a": (e) ->
    e.preventDefault()

    href = e.currentTarget.getAttribute('href')
    menuType = e.currentTarget.getAttribute('data-menu-type') || ''
    menuNameForParent = e.currentTarget.getAttribute('data-menu-parent-name') || ''
    menuNameForElement = e.currentTarget.getAttribute('data-menu-element-name') || ''

    switch menuType
      when 'root'
        Session.set('routeActiveMenuElement', menuNameForElement)
        Session.set('routeActiveParent', '')
        Session.set('selectedOpenParent', '')
        Router.go(href)
        if $('.page-sidebar').hasClass("in")
          $('.page-header .responsive-toggler').click()

      when 'parent'
# this is a parent group menu element.
# clicking on an open element ought to close it
# clicking on a new parent group out to open that new group
        if Session.get('routeActiveParent') == menuNameForParent
# if I click on the current active route's parent
          if Session.get('selectedOpenParent') == menuNameForParent
            Session.set('selectedOpenParent', '')
          else
            Session.set('selectedOpenParent', menuNameForParent)
        else
          if Session.get('selectedOpenParent')
            if Session.get('selectedOpenParent') == menuNameForParent
              Session.set('selectedOpenParent', '')
            else
              Session.set('selectedOpenParent', menuNameForParent)
          else
            Session.set('selectedOpenParent', menuNameForParent)


      when 'child'
# I have clicked on a child menu item and need to go to the respective route
        Session.set('routeActiveMenuElement', menuNameForElement)
        Session.set('routeActiveParent', menuNameForParent)
        Session.set('selectedOpenParent', menuNameForParent)
        Router.go(href)
        if $('.page-sidebar').hasClass("in")
          $('.page-header .responsive-toggler').click()

Template.appLeftMenuLayout.helpers
  'isActiveRoute': (routeName, parentName) ->
    if Session.get('routeActiveMenuElement') == routeName
      'active'
    else
      if Router.current().route.getName() == routeName
        Session.set('routeActiveMenuElement', routeName)
        Session.set('routeActiveParent', parentName)
        Session.set('selectedOpenParent', parentName)
        'active'

  'isOpenParentMenu': (parentName) ->
    if Session.get('selectedOpenParent') == parentName
      'open'

  'isActiveParentMenu': (groupName) ->
    if Session.get('routeActiveParent') == groupName
      'active'

  'isBlockParentMenuStyle': (parentName) ->
    if Session.get('selectedOpenParent') == parentName
      'display: block;'
    else
      'display: none;'

  'isArrowOpenParentMenu': (parentName) ->
    if Session.get('selectedOpenParent') == parentName
      'open'

  'menus': () ->
    ###
    <li class="start {{ isActiveRoute 'admin' '' }}">
      <a href="{{ pathFor route='admin' }}" id="admin"  data-menu-type="root"
        data-menu-element-name="admin">
        <i class="fa fa-home"></i>
        <span class="title">Home</span>
      </a>
    </li>
    <li class="{{ isOpenParentMenu 'sales' }} {{ isActiveParentMenu 'sales' }}">
      <a href="#" id="admin-group1" data-menu-type="parent" data-menu-parent-name="sales">
        <i class="icon-basket"></i>
        <span class="title">MenuGroup1</span>
        <span class="arrow {{ isArrowOpenParentMenu 'sales' }}"></span>
      </a>ß
      <ul class="sub-menu" style="{{ isBlockParentMenuStyle 'sales' }}">
        <li class="{{ isActiveRoute 'adminOrder' 'sales' }}">
          <a href="{{ pathFor route='adminOrder' }}" data-menu-type="child"
            data-menu-element-name="orders" data-menu-parent-name="sales">
            <i class="icon-home"></i>
            MenuGroup1 - Menu1
          </a>
        </li>
    ###
    menuList =
      [
        {
          liClassStart: 'start'
          liClassIsActiveRouteParam1: 'admin'
          liClassIsActiveRouteParam2: ''
          aHrefPathForRoute: 'admin'
          aId: 'admin'
          aHrefDataMenuType: 'root'
          aHrefDataMenuElementName: 'admin'
          iClassIcon: 'fa fa-home'
          menuTitle: TAPi18n.__('Dashboard')
        },
        {
          liClassStart: ''
          liOpenParentMenu: 'sales'
          liIsActiveParentMenu: 'sales'
          aHref: '#'
          aId: 'sales'
          aHrefDataMenuType: 'parent'
          aHrefDataMenuParentName: 'sales'
          iClassIcon: 'fa fa-money'
          menuTitle: TAPi18n.__('Sales')
          spanArrowIsArrowOpenParentMenu: 'sales'
          ulStyleIsBlockParentMenuStyle: 'sales'
          children:
            [
              {
                liClassIsActiveRouteParam1: 'salesOrderList'
                liClassIsActiveRouteParam2: 'sales'
                aHrefPathForRoute: 'salesOrderList'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'salesOrderList'
                aHrefDataMenuParentName: 'sales'
                iClassIcon: 'fa fa-database'
                menuTitle: TAPi18n.__('Order List')
              },
              {
                liClassIsActiveRouteParam1: 'salesOrderCreate'
                liClassIsActiveRouteParam2: 'sales'
                aHrefPathForRoute: 'salesOrderCreate'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'salesOrderCreate'
                aHrefDataMenuParentName: 'sales'
                iClassIcon: 'fa fa-cart-plus'
                menuTitle: TAPi18n.__('New Order')
              }
            ]
        },
        {
          liClassStart: ''
          liOpenParentMenu: 'product'
          liIsActiveParentMenu: 'product'
          aHref: '#'
          aId: 'product'
          aHrefDataMenuType: 'parent'
          aHrefDataMenuParentName: 'product'
          iClassIcon: 'fa fa-cubes'
          menuTitle: TAPi18n.__('Product')
          spanArrowIsArrowOpenParentMenu: 'product'
          ulStyleIsBlockParentMenuStyle: 'product'
          children:
            [
              {
                liClassIsActiveRouteParam1: 'productTransportation'
                liClassIsActiveRouteParam2: 'product'
                aHrefPathForRoute: 'productTransportation'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'productTransportation'
                aHrefDataMenuParentName: 'product'
                iClassIcon: 'fa fa-plane'
                menuTitle: TAPi18n.__('Transportation')
              },
              {
                liClassIsActiveRouteParam1: 'productCar'
                liClassIsActiveRouteParam2: 'product'
                aHrefPathForRoute: 'productCar'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'productCar'
                aHrefDataMenuParentName: 'product'
                iClassIcon: 'fa fa-car'
                menuTitle: TAPi18n.__('Car')
              },
              {
                liClassIsActiveRouteParam1: 'productCamper'
                liClassIsActiveRouteParam2: 'product'
                aHrefPathForRoute: 'productCamper'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'productCamper'
                aHrefDataMenuParentName: 'product'
                iClassIcon: 'fa fa-bus'
                menuTitle: TAPi18n.__('Camper')
              },
              {
                liClassIsActiveRouteParam1: 'productHotel'
                liClassIsActiveRouteParam2: 'product'
                aHrefPathForRoute: 'productHotel'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'productHotel'
                aHrefDataMenuParentName: 'product'
                iClassIcon: 'fa fa-bed'
                menuTitle: TAPi18n.__('Hotel')
              },
              {
                liClassIsActiveRouteParam1: 'productMiscellaneous'
                liClassIsActiveRouteParam2: 'product'
                aHrefPathForRoute: 'productMiscellaneous'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'productMiscellaneous'
                aHrefDataMenuParentName: 'product'
                iClassIcon: 'fa fa-skyatlas'
                menuTitle: TAPi18n.__('Miscellaneous')
              },
              {
                liClassIsActiveRouteParam1: 'productText'
                liClassIsActiveRouteParam2: 'product'
                aHrefPathForRoute: 'productText'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'productText'
                aHrefDataMenuParentName: 'product'
                iClassIcon: 'fa fa-align-justify'
                menuTitle: TAPi18n.__('Text')
              },
              {
                liClassIsActiveRouteParam1: 'productPackage'
                liClassIsActiveRouteParam2: 'product'
                aHrefPathForRoute: 'productPackage'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'productPackage'
                aHrefDataMenuParentName: 'product'
                iClassIcon: 'fa fa-archive'
                menuTitle: TAPi18n.__('Package')
              }
            ]
        },
        {
          liClassStart: ''
          liOpenParentMenu: 'setup'
          liIsActiveParentMenu: 'setup'
          aHref: '#'
          aId: 'setup'
          aHrefDataMenuType: 'parent'
          aHrefDataMenuParentName: 'setup'
          iClassIcon: 'fa fa-cog'
          menuTitle: TAPi18n.__('Setup')
          spanArrowIsArrowOpenParentMenu: 'setup'
          ulStyleIsBlockParentMenuStyle: 'setup'
          children:
            [
              {
                liClassIsActiveRouteParam1: 'setupCamper'
                liClassIsActiveRouteParam2: 'setup'
                aHrefPathForRoute: 'setupCamper'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'setupCamper'
                aHrefDataMenuParentName: 'setup'
                iClassIcon: 'fa fa-bus'
                menuTitle: TAPi18n.__('Camper')
              },
              {
                liClassIsActiveRouteParam1: 'setupCar'
                liClassIsActiveRouteParam2: 'setup'
                aHrefPathForRoute: 'setupCar'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'setupCar'
                aHrefDataMenuParentName: 'setup'
                iClassIcon: 'fa fa-car'
                menuTitle: TAPi18n.__('Car')
              },
              {
                liClassIsActiveRouteParam1: 'setupGeneral'
                liClassIsActiveRouteParam2: 'setup'
                aHrefPathForRoute: 'setupGeneral'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'setupGeneral'
                aHrefDataMenuParentName: 'setup'
                iClassIcon: 'fa fa-folder'
                menuTitle: TAPi18n.__('General')
              },
              {
                liClassIsActiveRouteParam1: 'setupHotel'
                liClassIsActiveRouteParam2: 'setup'
                aHrefPathForRoute: 'setupHotel'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'setupHotel'
                aHrefDataMenuParentName: 'setup'
                iClassIcon: 'fa fa-bed'
                menuTitle: TAPi18n.__('Hotel')
              },
              {
                liClassIsActiveRouteParam1: 'setupImport'
                liClassIsActiveRouteParam2: 'setup'
                aHrefPathForRoute: 'setupImport'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'setupImport'
                aHrefDataMenuParentName: 'setup'
                iClassIcon: 'fa fa-download'
                menuTitle: TAPi18n.__('Import')
              },
              {
                liClassIsActiveRouteParam1: 'setupOrder'
                liClassIsActiveRouteParam2: 'setup'
                aHrefPathForRoute: 'setupOrder'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'setupOrder'
                aHrefDataMenuParentName: 'setup'
                iClassIcon: 'fa fa-database'
                menuTitle: TAPi18n.__('Order')
              },
              {
                liClassIsActiveRouteParam1: 'setupSupplier'
                liClassIsActiveRouteParam2: 'setup'
                aHrefPathForRoute: 'setupSupplier'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'setupSupplier'
                aHrefDataMenuParentName: 'setup'
                iClassIcon: 'fa fa-arrows-alt'
                menuTitle: TAPi18n.__('Supplier')
              },
              {
                liClassIsActiveRouteParam1: 'setupTransportation'
                liClassIsActiveRouteParam2: 'setup'
                aHrefPathForRoute: 'setupTransportation'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'setupTransportation'
                aHrefDataMenuParentName: 'setup'
                iClassIcon: 'fa fa-plane'
                menuTitle: TAPi18n.__('Transportation')
              }
            ]
        },
        {
          liClassStart: ''
          liOpenParentMenu: 'statistics'
          liIsActiveParentMenu: 'statistics'
          aHref: '#'
          aId: 'statistics'
          aHrefDataMenuType: 'parent'
          aHrefDataMenuParentName: 'statistics'
          iClassIcon: 'fa fa-line-chart'
          menuTitle: TAPi18n.__('Statistics')
          spanArrowIsArrowOpenParentMenu: 'statistics'
          ulStyleIsBlockParentMenuStyle: 'statistics'
          children:
            [
              {
                liClassIsActiveRouteParam1: 'statisticsTurnover'
                liClassIsActiveRouteParam2: 'statistics'
                aHrefPathForRoute: 'statisticsTurnover'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'statisticsTurnover'
                aHrefDataMenuParentName: 'statistics'
                iClassIcon: 'fa fa-line-chart'
                menuTitle: TAPi18n.__('Turnover')
              },
              {
                liClassIsActiveRouteParam1: 'statisticsProfitMargin'
                liClassIsActiveRouteParam2: 'statistics'
                aHrefPathForRoute: 'statisticsProfitMargin'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'statisticsProfitMargin'
                aHrefDataMenuParentName: 'statistics'
                iClassIcon: 'fa fa-thumbs-up'
                menuTitle: TAPi18n.__('Profit Margin')
              }
            ]
        },
        {
          liClassStart: ''
          liOpenParentMenu: 'accounting'
          liIsActiveParentMenu: 'accounting'
          aHref: '#'
          aId: 'accounting'
          aHrefDataMenuType: 'parent'
          aHrefDataMenuParentName: 'accounting'
          iClassIcon: 'fa fa-bank'
          menuTitle: TAPi18n.__('Accounting')
          spanArrowIsArrowOpenParentMenu: 'accounting'
          ulStyleIsBlockParentMenuStyle: 'accounting'
          children:
            [
              {
                liClassIsActiveRouteParam1: 'accountingBsp'
                liClassIsActiveRouteParam2: 'accounting'
                aHrefPathForRoute: 'accountingBsp'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'accountingBsp'
                aHrefDataMenuParentName: 'accounting'
                iClassIcon: 'fa fa-check'
                menuTitle: TAPi18n.__('Bsp')
              },
              {
                liClassIsActiveRouteParam1: 'accountingCredit'
                liClassIsActiveRouteParam2: 'accounting'
                aHrefPathForRoute: 'accountingCredit'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'accountingCredit'
                aHrefDataMenuParentName: 'accounting'
                iClassIcon: 'fa fa-credit-card'
                menuTitle: TAPi18n.__('Creditor')
              },
              {
                liClassIsActiveRouteParam1: 'accountingDebit'
                liClassIsActiveRouteParam2: 'accounting'
                aHrefPathForRoute: 'accountingDebit'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'accountingDebit'
                aHrefDataMenuParentName: 'accounting'
                iClassIcon: 'fa fa-money'
                menuTitle: TAPi18n.__('Debitor')
              },
              {
                liClassIsActiveRouteParam1: 'accountingSetup'
                liClassIsActiveRouteParam2: 'accounting'
                aHrefPathForRoute: 'accountingSetup'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'accountingSetup'
                aHrefDataMenuParentName: 'accounting'
                iClassIcon: 'fa fa-gears'
                menuTitle: TAPi18n.__('Setup')
              }
            ]
        },
        {

          liClassStart: ''
          liOpenParentMenu: 'customer'
          liIsActiveParentMenu: 'customer'
          aHref: '#'
          aId: 'customer'
          aHrefDataMenuType: 'parent'
          aHrefDataMenuParentName: 'customer'
          iClassIcon: 'fa fa-users'
          menuTitle: TAPi18n.__('Customer')
          spanArrowIsArrowOpenParentMenu: 'customer'
          ulStyleIsBlockParentMenuStyle: 'customer'
          children:
            [
              {
                liClassIsActiveRouteParam1: 'customerAgent'
                liClassIsActiveRouteParam2: 'customer'
                aHrefPathForRoute: 'customerAgent'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'customerAgent'
                aHrefDataMenuParentName: 'customer'
                iClassIcon: 'fa fa-user-times'
                menuTitle: TAPi18n.__('Agent')
              },
              {
                liClassIsActiveRouteParam1: 'customerConsumer'
                liClassIsActiveRouteParam2: 'customer'
                aHrefPathForRoute: 'customerConsumer'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'customerConsumer'
                aHrefDataMenuParentName: 'customer'
                iClassIcon: 'fa fa-user'
                menuTitle: TAPi18n.__('Consumer')
              }
            ]
        },
        {

          liClassStart: ''
          liOpenParentMenu: 'internal'
          liIsActiveParentMenu: 'internal'
          aHref: '#'
          aId: 'internal'
          aHrefDataMenuType: 'parent'
          aHrefDataMenuParentName: 'internal'
          iClassIcon: 'fa fa-building'
          menuTitle: TAPi18n.__('Internal')
          spanArrowIsArrowOpenParentMenu: 'internal'
          ulStyleIsBlockParentMenuStyle: 'internal'
          children:
            [
              {
                liClassIsActiveRouteParam1: 'internalEmployee'
                liClassIsActiveRouteParam2: 'internal'
                aHrefPathForRoute: 'internalEmployee'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'internalEmployee'
                aHrefDataMenuParentName: 'internal'
                iClassIcon: 'fa fa-users'
                menuTitle: TAPi18n.__('Employee')
              },
              {
                liClassIsActiveRouteParam1: 'internalTask'
                liClassIsActiveRouteParam2: 'internal'
                aHrefPathForRoute: 'internalTask'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'internalTask'
                aHrefDataMenuParentName: 'internal'
                iClassIcon: 'fa fa-tasks'
                menuTitle: TAPi18n.__('Task')
              },
              {
                liClassIsActiveRouteParam1: 'internalProfile'
                liClassIsActiveRouteParam2: 'internal'
                aHrefPathForRoute: 'internalProfile'
                aHrefDataMenuType: 'child'
                aHrefDataMenuElementName: 'internalProfile'
                aHrefDataMenuParentName: 'internal'
                iClassIcon: 'fa fa-user-following'
                menuTitle: TAPi18n.__('My Profile')
              }
            ]
        }
      ]
    menuList

