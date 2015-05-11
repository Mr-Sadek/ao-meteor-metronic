# collections/city.coffee

# data schema
CitySchema = SimpleSchema.build SimpleSchema.timestamp,
  'legalName':
    # The official name of the organization, e.g. the registered company name.
    type: String
    index: true

  'address':
    # Physical address of the item.
    # FK to the address collection
    type: String
# optional: true # optional field, not mandatory

# register the collection and attach the schema to the collection object
City = new Mongo.Collection 'city'
City.attachSchema CitySchema

# export
@CityCollection = City
