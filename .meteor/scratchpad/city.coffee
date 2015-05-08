# collections/city.coffee

# data schema
CitySchema = SimpleSchema.build SimpleSchema.timestamp,
  'code':
    type: String
    index: true

  'name':
    type: String
# optional: true # optional field, not mandatory

# register the collection and attach the schema to the collection object
City = new Mongo.Collection 'city'
City.attachSchema CitySchema

# export
@CityCollection = City
