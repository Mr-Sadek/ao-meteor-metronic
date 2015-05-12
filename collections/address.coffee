# collections/address.coffee
# https://schema.org/PostalAddress

# data schema
AddressSchema = new SimpleSchema
  # @type: "PostalAddress"

  'streetAddress':
    type: String
    optional: true

  'postOfficeBoxNumber':
    type: String
    optional: true

  'postalCode':
    type: String
    optional: true

  'addressLocality':
    type: String
    optional: true

  'addressRegion':
    type: String
    optional: true

  'addressCountry':
    type: String
    optional: true
    index: true

# A person or organization can have only one address.
# If one needs more than one address, then one has to use departments, or
# contact points, each of which can have an address.

# The @ThingSchema is used as a type property in other Schemas.
# For us to be able to use this Schema outside of this file/class, one
# needs to make the Schema public.
# This is achieved by prepending the variable with a '@' character.
@AddressSchema = AddressSchema