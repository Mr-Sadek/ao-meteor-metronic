# collections/Organization.coffee

# data schema
OrganizationSchema = SimpleSchema.build SimpleSchema.timestamp,

# http://schema.org/Thing

  name:
    # The name of the item.
    type: String
    optional: true
  alternateName:
    # An alias for the item.
    type: String
    optional: true
  url:
    # URL of the item.
    type: String
    optional: true
  description:
    # A short description of the item.
    type: String
    optional: true
  image:
    # A short description of the item.
    type: Object
    optional: true

  'legalName':
    # The official name of the organization, e.g. the registered company name.
    type: String
    index: true

  'email':
    type: String

  'address':
    # Physical address of the item.
    # FK to the address collection
    type: AddressSchema
# optional: true # optional field, not mandatory

# register the collection and attach the schema to the collection object
Organization = new Mongo.Collection 'organization'
Organization.attachSchema OrganizationSchema

# export
@OrganizationCollection = Organization

#modifier =
#  legalName: 'Online Travel Services AG'
#  email: 'support@onlinetravel.ch'
#  address:
#    addressCountry: 'ch'
#
#OrganizationCollection.insert(modifier)
