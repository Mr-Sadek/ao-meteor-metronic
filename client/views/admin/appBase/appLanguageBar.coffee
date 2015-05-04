Template.appLanguageBar.events
  "click a": (e) ->
    e.preventDefault()

    id = e.currentTarget.getAttribute('id')

    switch id
      when 'languageDE' then TAPi18n.setLanguage('de')
      when 'languageDE' then TAPi18n.setLanguage('en')
      else TAPi18n.setLanguage('de')



Template.appLanguageBar.helpers
  'currentLanguageTag': () ->
    TAPi18n.getLanguage().toUpperCase()