Meteor.startup ->
# code to run on client at startup
# The following will load the RTL templates based on the value of the orientationLeftToRightIndicator Session variable

  Session.setDefault 'orientationLeftToRightIndicator', 'left'

  cssList =
    [
      {
        id: "headLinkCss_bootstrap"
        css:
          "left": "/assets/metronic/theme_rtl/assets/global/plugins/bootstrap/css/bootstrap.min.css"
          "right": "/assets/metronic/theme_rtl/assets/global/plugins/bootstrap/css/bootstrap-rtl.min.css"
      },
      {
        id: "headLinkCss_bootstrap-switch"
        css:
          left: "/assets/metronic/theme_rtl/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
          right: "/assets/metronic/theme_rtl/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
      },
      {
        id: "headLinkCss_tasks"
        css:
          left: "/assets/metronic/theme_rtl/assets/admin/pages/css/tasks.css"
          right: "/assets/metronic/theme_rtl/assets/admin/pages/css/tasks-rtl.css"
      },
      {
        id: "style_components"
        css:
          left: "/assets/metronic/theme_rtl/assets/global/css/components-rounded.css"
          right: "/assets/metronic/theme_rtl/assets/global/css/components-rounded-rtl.css"
      },
      {
        id: "headLinkCss_plugins"
        css:
          left: "/assets/metronic/theme_rtl/assets/global/css/plugins.css"
          right: "/assets/metronic/theme_rtl/assets/global/css/plugins-rtl.css"
      },
      {
        id: "headLinkCss_layout"
        css:
          left: "/assets/metronic/theme_rtl/assets/admin/layout4/css/layout.css"
          right: "/assets/metronic/theme_rtl/assets/admin/layout4/css/layout-rtl.css"
      },
      {
        id: "style_color"
        css:
          left: "/assets/metronic/theme_rtl/assets/admin/layout4/css/themes/light.css"
          right: "/assets/metronic/theme_rtl/assets/admin/layout4/css/themes/light-rtl.css"
      },
      {
        id: "headLinkCss_custom"
        css:
          left: "/assets/metronic/theme_rtl/assets/admin/layout4/css/custom.css"
          right: "/assets/metronic/theme_rtl/assets/admin/layout4/css/custom-rtl.css"
      }
    ]

  #  console.log(cssList)
  #  _.each cssList, (elem) -> console.log(elem.css.left)

  Deps.autorun ->
    orientation = Session.get('orientationLeftToRightIndicator')
    # orientation = 'right'
    _.each cssList, (elem) ->
      $('link#' + elem.id).attr 'href', elem.css[orientation]
#   $('link#headLinkCss_bootstrap').attr 'href', '/assets/metronic/theme_rtl/assets/global/plugins/bootstrap/css/bootstrap.min.css'

    Metronic.init()
    Layout.init()