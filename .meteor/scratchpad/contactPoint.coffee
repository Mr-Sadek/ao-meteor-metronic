# collections/contactPoint.coffee
# https://schema.org/PostalContactPoint

# data schema
ContactPointSchema = SimpleSchema.build SimpleSchema.thing
  'areaServed':
    # The location served by this contact point (e.g., a phone number intended for Europeans vs. North Americans or only within the United States).
    # "areaServed" : ["US","CA"]
    type: [String]
    optional: true

  'availableLanguage':
    # A language someone may use with the item.
    # "availableLanguage" : ["English","French"]
    type: [String]
    optional: true

  'contactOption':
    # An option available on this contact point (e.g. a toll-free number or support for hearing-impaired callers)
    # "contactOption" : ["HearingImpairedSupported","TollFree"]
    type: [String]
    optional: true

  'contactType':
    #A person or organization can have different contact points, for different purposes. For example, a sales contact point, a PR contact point and so on. This property is used to specify the kind of contact point.
    # "contactType" : "technical support"
    type: String
    optional: true

  'email':
    # Email address.
    type: String
    optional: true

  'faxNumber':
    # The fax number.
    type: String
    optional: true

  'hoursAvailable':
    # The hours during which this contact point is available.
    type: String
    optional: true

  'telephone':
    # The telephone number.
    type: String
    optional: true

# A person or organization can have only one ContactPoint.
# If one needs more than one ContactPoint, then one has to use departments, or contact points, each of which can have an ContactPoint.

# The ContactPointSchema is used as a type property in Organization and Person. For us to be able to use this Schema outside of this file/class, one needs to make the Schema public.This is achieved by prepending the variable with a '@' character.
@ContactPointSchema = ContactPointSchema