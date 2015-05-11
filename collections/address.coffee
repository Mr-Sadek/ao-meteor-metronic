# collections/address.coffee
# https://schema.org/PostalAddress

# data schema
AddressSchema = new SimpleSchema
  # @type: "PostalAddress"

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
    index: true

# A person or organization can have only one address.
# If one needs more than one address, then one has to use departments, or contact points, each of which can have an address.

# The AddressSchema is used as a type property in Organization and Person. For us to be able to use this Schema outside of this file/class, one needs to make the Schema public.This is achieved by prepending the variable with a '@' character.
@AddressSchema = AddressSchema