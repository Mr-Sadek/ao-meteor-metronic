# Metronic requires special treatment of IE version 8, 9 ,10

# Create a new div in memory to test against. Assume
# the browser is > IE9 by default.
div = document.createElement('div')
isIe = false
# Inject a conditional IE9 comment and see if it is found.
div.innerHTML = '<!--[if IE]><injm></injm><![endif]-->'
# Since the content of the comment is ignored
# in other browsers, this will return false in everything
# but older IE browsers.
if div.getElementsByTagName('injm').length
  isIe = true
# console.log("Is this an Internet Explorer?")
# console.log(isIe)

Meteor.startup ->
  # search for the meta tag appended by the conditional inclusion comment
  if $('meta[name=\'is-ie\']').length
    # if it's there, load the script with jQuery
    # $.getScript '/my-package/public/html5shiv.js'
    console.log('is-ie')

  # <body class="page-header-fixed page-sidebar-closed-hide-logo">
  Blaze.addBodyClass ->
    "page-header-fixed"
  Blaze.addBodyClass ->
    "page-sidebar-closed-hide-logo"
  Blaze.addNodeAttribute "html","lang", ->
    "en"



