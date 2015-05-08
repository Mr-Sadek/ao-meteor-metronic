# collections/address.coffee
# https://schema.org/PostalAddress

# data schema
AddressSchema = SimpleSchema.build SimpleSchema.timestamp,
  'type':
    type: String
    # PostalAddress
    # Home, Mailing, Business, Billing

  'streetAddress':
    type: String
    optional: true # optional field, not mandatory

  'postOfficeBoxNumber':
    type: String
    optional: true # optional field, not mandatory

  'postalCode':
    type: String
    optional: true # optional field, not mandatory

  'addressLocality':
    type: String
    optional: true # optional field, not mandatory

  'addressRegion':
    type: String
    optional: true # optional field, not mandatory

  'addressCountry':
    type: String
    optional: true # optional field, not mandatory

# register the collection and attach the schema to the collection object
Address = new Mongo.Collection 'Address'
Address.attachSchema AddressSchema

# export
@AddressCollection = Address
