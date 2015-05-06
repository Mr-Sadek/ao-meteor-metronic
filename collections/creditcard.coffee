# collections/creditcard.coffee

# data schema
creditCardSchema = SimpleSchema.build SimpleSchema.timestamp,
  'code':
    type: String
    index: true

  'description':
    type: String
    # optional: true # optional field, not mandatory

# register the collection and attach the schema to the collection object
CreditCard = new Mongo.Collection 'creditcard'
CreditCard.attachSchema creditCardSchema

# export
@CreditCardCollection = CreditCard
