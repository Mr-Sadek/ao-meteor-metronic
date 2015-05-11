# collections/openingHours.coffee
# http://schema.org/OpeningHoursSpecification

# data schema
OpeningHoursSchema = new SimpleSchema
  'validFrom':
    # The date when the item becomes valid.
    # "validFrom": "2013-12-24"
    type: Date
    optional: true

  'validThrough':
    # The end of the validity of offer, price specification, or opening hours data.
    # "validThrough": "2013-12-25"
    type: Date
    optional: true

  'opens':
    # The end of the validity of offer, price specification, or opening hours data.
    # "validThrough": "2013-12-25"
    type: String
    optional: true

  'validThrough':
    # The end of the validity of offer, price specification, or opening hours data.
    # "validThrough": "2013-12-25"
    type: String
    optional: true

  'validThrough':
    # The end of the validity of offer, price specification, or opening hours data.
    # "validThrough": "2013-12-25"
    type: String
    optional: true

