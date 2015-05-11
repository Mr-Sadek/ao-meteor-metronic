# collections/Organization.coffee

# data schema
OrganizationSchema = SimpleSchema.build SimpleSchema.timestamp,
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

modifier =
  legalName: 'Online Travel Services AG'
  email: 'support@onlinetravel.ch'
  address:
    addressCountry: 'ch'

OrganizationCollection.insert(modifier)

#selector =
#  legalName: 'Online Travel Services AG'
#
#modifier =
#  $set:
#    legalName: 'Online Travel Services AG'
#    email: 'support@onlinetravel.ch'
#    address: [{addressCountry: 'ch'}]
#
#OrganizationCollection.upsert(selector, modifier)
