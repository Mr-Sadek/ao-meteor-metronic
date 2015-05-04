Creditcards = new (Mongo.Collection)('creditcard')

Creditcards.attachSchema new SimpleSchema(
    code:
      type: String
      index: 1
      unique: true
    company:
      type: String
      optional: true
)