neighborhoods = [
  'Capitol Hill / First Hill',
  'Downtown',
  'International District',
  'Waterfront / Belltown',
  'Lake Union / Eastlake',
  'Leschi / Madrona / Madison Park',
  'Queen Anne / Magnolia',
  'West Seattle',
  'U District',
  'Pioneer Square',
  'Fremont / Wallingford',
  'Greenwood / Greenlake / Phinney Ridge',
  'Ballard',
  'Columbia City / Beacon Hill'
]

prices = [
  '$',
  '$$',
  '$$$',
  '$$$$'
]

User.destroy_all
# Request.destroy_all
# Cuisine.destroy_all
# Neighborhood.destroy_all
# Price.destroy_all

# cuisines.each do |cuisine|
#   Cuisine.create(category: cuisine)
# end 

neighborhoods.each do |neighborhood|
  Neighborhood.create(name: neighborhood)
end

prices.each do |price|
  PriceRange.create(max_amount: price)
end

# prices.each do |price|
#   Price.create(amount: price)
# end

# User.create(username: 'kara', first_name: 'kara', last_name: 'odle', email: 'kara@flatiron.com', password: '123')
# User.create(username: 'admin', first_name: 'admin', last_name: 'admin', email: 'karajo.odle@gmail.com', password: '123', admin: true)