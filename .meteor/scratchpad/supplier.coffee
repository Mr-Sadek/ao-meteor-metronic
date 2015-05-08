# collections/supplier.coffee

# data schema
SupplierSchema = SimpleSchema.build SimpleSchema.timestamp,
  'code':
    type: String
    index: true

  'name':
    type: String
    index: true
# optional: true # optional field, not mandatory

# register the collection and attach the schema to the collection object
Supplier = new Mongo.Collection 'Supplier'
Supplier.attachSchema SupplierSchema

# export
@SupplierCollection = Supplier
