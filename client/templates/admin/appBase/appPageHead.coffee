Template.appPageHead.helpers
  'h1': () ->
    Router.current().route.options.h1 || ''

  'h2': () ->
    Router.current().route.options.h2 || ''