# lib/simple_schema.coffee
# Note: this is a super-class, and Javascript requires that superclasses are loaded before the using-class.
# The lib folder is loaded before other folders, which means the collections should not be placed in the lib folder.

_.extend SimpleSchema,
  # this method will collect one schema from several passed objects
  # and return it
  build: (objects...) ->
    result = {}
    for obj in objects
      _.extend result, obj
    return new SimpleSchema result

  # If we add this object to the schema,
  # the model will have two fields that will be computed
  # automatically
  timestamp:
    createdAt:
      type: Date
      denyUpdate: true
      autoValue: ->
        if @isInsert
          return new Date
        if @isUpsert
          return {$setOnInsert: new Date}
        @unset()
    updatedAt:
      type: Date
      autoValue: ->
        new Date

  visibleAt:
    visibleAt:
      type: Date
      optional: true
      index: true
      autoValue: ->
        if @isInsert
          return new Date
        if @isUpsert
          return {$setOnInsert: new Date}
    invisibleAt:
        type: Date
        optional: true
    invisible:
      type: Boolean
      optional: true