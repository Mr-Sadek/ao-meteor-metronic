Blaze.addBodyClass = (fn) ->
  if $.isArray(fn)
    return fn.forEach(Blaze.addBodyClass)

  if typeof fn != 'function'
    return Meteor.startup(->
      $('body').addClass fn
    )

  Meteor.startup ->
    Deps.autorun ->
      $('body').removeClass(fn._prev).addClass fn._prev = fn()

Blaze.addNodeAttribute = (node, attr, value) ->
  return Meteor.startup(->
    $(node).prop attr, value
  )

  Meteor.startup ->
    Deps.autorun ->
      $(node).removeAttr(attr).prop attr, value
