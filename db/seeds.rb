cuisines = [
  'All Cuisines',
  'American',
  'Italian',
  'Steakhouse',
  'Seafood',
  'French',
  'Indian',
  'Mexican',
  'Japanese',
  'Chinese',
  'German',
  'Spanish',
  'Pizzeria',
  'Barbeque',
  'Greek',
  'Tapas',
  'Irish',
  'Vegetarian / Vegan',
  'Brewery',
  'Cocktail Bar',
  'Wine Bar',
  'Thai',
  'Vietnamese'
]

neighborhoods = [
  'Capitol Hill / First Hill',
  'Downtown',
  'International District',
  'Waterfront / Belltown',
  'Lake Union / Eastlake',
  'Wallingford',
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

Cuisine.destroy_all
Neighborhood.destroy_all
Price.destroy_all

cuisines.each do |cuisine|
  Cuisine.create(category: cuisine)
end 

neighborhoods.each do |neighborhood|
  Neighborhood.create(name: neighborhood)
end

prices.each do |price|
  Price.create(amount: price)
end 