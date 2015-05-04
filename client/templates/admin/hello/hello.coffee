Session.setDefault "counter", 0

Template.hello.helpers
  counter: ->
    Session.get("counter")

Template.hello.helpers
  ltr: ->
    Session.get 'orientationLeftToRightIndicator'

Template.hello.events
  "click button": ->
    Session.set("counter", Session.get("counter") + 1)
    Session.set 'orientationLeftToRightIndicator',
      if Session.get('orientationLeftToRightIndicator') == 'left' then ('right') else ('left')
    console.log('orientationLeftToRightIndicator: ' + Session.get('orientationLeftToRightIndicator'))