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

Admin.destroy_all
User.destroy_all
Request.destroy_all
Neighborhood.destroy_all
PriceRange.destroy_all

neighborhoods.each do |neighborhood|
  Neighborhood.create(name: neighborhood)
end

prices.each do |price|
  PriceRange.create(max_amount: price)
end

Admin.create(email: 'karajo.odle@gmail.com', password: '123456')