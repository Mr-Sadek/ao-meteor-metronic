###
AdminController = RouteController.extend(
  layoutTemplate: 'appLayout'
  , @layout 'appLayout'
  , @render 'home'
  , @render 'appLeftMenuLayout', {to: 'appLeftMenuLayout'}
  , action: ->
    @render()
)###

mainYieldTemplates =
  'appLeftMenuLayout':
    'to': 'appLeftMenuLayout'

AdminController = RouteController.extend
  yieldTemplates: mainYieldTemplates





