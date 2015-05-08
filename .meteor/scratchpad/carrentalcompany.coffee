# collections/carrentalcompany.coffee

# TODO: A car rental company is really just a special type of supplier.
# Perhaps this is not a sensible data structure.
# On the other hand, the codes that are used for matching a car rental company
# when importing cars from a GDS are given

# data schema
CarRentalCompanySchema = SimpleSchema.build SimpleSchema.timestamp,
  'code':
    type: String
    index: true

  'name':
    type: String
# optional: true # optional field, not mandatory

# register the collection and attach the schema to the collection object
CarRentalCompany = new Mongo.Collection 'city'
CarRentalCompany.attachSchema CarRentalCompanySchema

# export
@CarRentalCompanyCollection = CarRentalCompany
