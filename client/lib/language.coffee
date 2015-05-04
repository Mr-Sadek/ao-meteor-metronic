getUserLanguage = ->
# Put here the logic for determining the user language
  'de'

Meteor.startup ->
  Session.set 'showLoadingIndicator', true
  TAPi18n.setLanguage(getUserLanguage()).done(->
    Session.set 'showLoadingIndicator', false

  ).fail (error_message) ->
# Handle the situation
    console.log error_message
