Template.appPageBreadcrumb.helpers
  breadcrumbStart: () ->
    breadcrumbArray = Router.current().route.options.breadcrumb
    if breadcrumbArray.length == 1
      []
    else
      breadcrumbArray = breadcrumbArray[0...-1]
      breadcrumbArray
      # This excludes the last element in the array

  breadcrumbEnd: () ->
    breadcrumbArray = Router.current().route.options.breadcrumb
    if breadcrumbArray.length == 1
      []
    else
      breadcrumbArray = breadcrumbArray[-1..]
      breadcrumbArray
      # This includes only the last element in the array

  href: (routeName, text) ->
    if routeName == '#'
      console.log(text + routeName)
      ''
    else
      Router.routes[routeName].path()