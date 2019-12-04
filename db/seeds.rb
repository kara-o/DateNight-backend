neighborhoods = [
  'Capitol Hill',
  'Downtown',
  'South Lake Union',
  'Queen Anne / Magnolia',
  'West Seattle',
  'U District',
  'Ballard / Fremont / Wallingford',
  'Greenwood / Greenlake / Phinney Ridge',
]

prices = [
  '$ ( $30 and under per person ) ',
  '$$ ( $31 to $50 per person ) ',
  '$$$ ( $51 to $100 per person )',
  '$$$$ ( Over $100 per person )'
]

Admin.destroy_all
User.destroy_all
Contact.destroy_all
Request.destroy_all
Neighborhood.destroy_all
PriceRange.destroy_all
ItineraryItem.destroy_all
ItineraryPackage.destroy_all
ItineraryPackageItem.destroy_all

neighborhoods.each do |neighborhood|
  Neighborhood.create(name: neighborhood)
end

prices.each do |price|
  PriceRange.create(max_amount: price)
end

Admin.create(email: 'admin@datenight.com', password: '123')

User.create(email: 'karajo.odle@gmail.com', password: '123', confirmed_at: '2019-12-04 06:32:55.476764', first_name: 'Kara', last_name: 'Odle', phone: '2069102789')