neighborhoods = [
  'Capitol Hill',
  'Downtown',
  'Belltown',
  'South Lake Union',
  'Queen Anne / Magnolia',
  'West Seattle',
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

pkg1 = ItineraryPackage.create(title: 'SLU Steak and Waterfront Night', neighborhood_id: 4, blurb: "Start off with a delicious steak dinner at Daniel's Broiler, followed by a short walk up the street, along the lake, to White Swan Public House for a fun after-dinner drink.  Enjoy delicious food and views tonight!", price_range_id: 3)
pkg2 = ItineraryPackage.create(title: 'Hip and Eclectic SLU Night', neighborhood_id: 4, blurb: "Enjoy a night of delicious food in hip, modern, and eclectic places.", price_range_id: 3)

ItineraryPackageItem.create(duration: 75, address:'809 Fairview Pl N, Seattle, WA 98109', place: "Daniel's Broiler South Lake Union", blurb: "Enjoy amazing views of Lake Union while eating a delicious steak.  You can't beat that.", itinerary_package_id: pkg1.id, make_res_link: 'https://www.opentable.com/r/daniels-broiler-lake-union-seattle?avt=eyJ2IjoxLCJtIjoxLCJwIjoxfQ&corrid=288747a4-071f-45f2-ac31-0cfc5eb588df&p=2&sd=2019-12-07+19%3A00', map_iframe_url: "https://www.google.com/maps/embed/v1/place?key=AIzaSyCOyujenXkNqsCLNFS0JJS7aZ36oaeUhWs&q=Daniel's%20Broiler%20South%20Lake%20Union%20", map_url: "https://maps.google.com/maps?ll=47.626596,-122.33494&z=16&t=m&hl=en-US&gl=US&mapclient=embed&cid=4641471617575734008")
ItineraryPackageItem.create(duration: 45, address: "1001 Fairview Ave N, Seattle, WA 98109", place: "The White Swan Public House", blurb: "This rustic cozy place offers waterfront views while enjoying drinks from their craft cocktail bar, or seafood from the kitchen! ", itinerary_package_id: pkg1.id, make_res_link: "https://www.opentable.com/r/the-white-swan-public-house-seattle?avt=eyJ2IjoxLCJtIjoxLCJwIjowfQ&corrid=c17c2fd4-7a1b-4275-9b4c-aed27e96c637&p=2&sd=2019-12-07%2019%3A00", map_iframe_url: "https://www.google.com/maps/embed/v1/place?key=AIzaSyCOyujenXkNqsCLNFS0JJS7aZ36oaeUhWs&q=White%20Swan%20Public%20House%20", map_url: "https://maps.google.com/maps?ll=47.629124,-122.33172&z=16&t=m&hl=en-US&gl=US&mapclient=embed&cid=11461591599171149612")
ItineraryPackageItem.create(duration: 75, address: "2202B 8th Ave, Seattle, WA 98121", place: "Wild Ginger", blurb: "Wild Ginger has been in Seattle since 1989!  It serves delicious Southeast Asian cuisine in a hip and modern location.  Enjoy great food and cocktails.", itinerary_package_id: pkg2.id, make_res_link: "https://www.opentable.com/r/wild-ginger-mckenzie-seattle?avt=eyJ2IjoxLCJtIjoxLCJwIjowfQ&corrid=288747a4-071f-45f2-ac31-0cfc5eb588df&p=2&sd=2019-12-07+19%3A00", map_iframe_url: "https://www.google.com/maps/embed/v1/place?key=AIzaSyCOyujenXkNqsCLNFS0JJS7aZ36oaeUhWs&q=Wild%20Ginger%20SLU%20", map_url: "https://maps.google.com/maps?ll=47.61755,-122.339318&z=16&t=m&hl=en-US&gl=US&mapclient=embed&cid=16806004370106637583")
ItineraryPackageItem.create(duration: 45, address: "429 Westlake Ave N, Seattle, WA 98109", place: "Re:public", blurb: "An eclectic restaurant serving a great late night menu (if you're still hungry!) along with a wide variety of craft cocktails.", itinerary_package_id: pkg2.id, make_res_link: "https://www.opentable.com/r/republic-seattle?avt=eyJ2IjoxLCJtIjoxLCJwIjowfQ&corrid=f4bb1c33-2100-4ca8-bdac-0b0e737006cc&p=2&sd=2019-12-07+19%3A00", map_iframe_url: "https://www.google.com/maps/embed/v1/place?key=AIzaSyCOyujenXkNqsCLNFS0JJS7aZ36oaeUhWs&q=%20Re:public", map_url: "https://maps.google.com/maps?ll=47.622911,-122.338649&z=16&t=m&hl=en-US&gl=US&mapclient=embed&cid=1735863275466340839")
# ItineraryPackageItem.create(duration: , address: "", place: "", blurb: "", itinerary_package_id:, make_res_link: "", map_iframe_url: "", map_url: "")
# ItineraryPackageItem.create(duration: , address: "", place: "", blurb: "", itinerary_package_id:, make_res_link: "", map_iframe_url: "", map_url: "")
# ItineraryPackageItem.create(duration: , address: "", place: "", blurb: "", itinerary_package_id:, make_res_link: "", map_iframe_url: "", map_url: "")
# ItineraryPackageItem.create(duration: , address: "", place: "", blurb: "", itinerary_package_id:, make_res_link: "", map_iframe_url: "", map_url: "")
# ItineraryPackageItem.create(duration: , address: "", place: "", blurb: "", itinerary_package_id:, make_res_link: "", map_iframe_url: "", map_url: "")
# ItineraryPackageItem.create(duration: , address: "", place: "", blurb: "", itinerary_package_id:, make_res_link: "", map_iframe_url: "", map_url: "")
# ItineraryPackageItem.create(duration: , address: "", place: "", blurb: "", itinerary_package_id:, make_res_link: "", map_iframe_url: "", map_url: "")
# ItineraryPackageItem.create(duration: , address: "", place: "", blurb: "", itinerary_package_id:, make_res_link: "", map_iframe_url: "", map_url: "")
# ItineraryPackageItem.create(duration: , address: "", place: "", blurb: "", itinerary_package_id:, make_res_link: "", map_iframe_url: "", map_url: "")
# ItineraryPackageItem.create(duration: , address: "", place: "", blurb: "", itinerary_package_id:, make_res_link: "", map_iframe_url: "", map_url: "")


# 5	60	5309 22nd Ave NW suite a, Seattle, WA 98107	Sawyer	Beautiful new restaurant in Ballard in a renovated 1920s sawmill.  Menu is designed for family sharing with a focus on ‘technique, whimsy, and comfort’.	3	https://www.opentable.com/r/sawyer-seattle?avt=eyJ2IjoxLCJtIjoxLCJwIjowfQ&corrid=f4da6181-a0eb-4f95-b2a9-e2d021f2a133&p=2&sd=2019-12-07+19%3A00	https://www.google.com/maps/embed/v1/place?key=AIzaSyCOyujenXkNqsCLNFS0JJS7aZ36oaeUhWs&q=Sawyer%20	https://maps.google.com/maps?ll=47.667005,-122.385039&z=16&t=m&hl=en-US&gl=US&mapclient=embed&cid=14605843249532055262	2019-12-04 22:06:56.393791	2019-12-04 22:06:56.393791
# 6	60	6414 32nd Ave NW, Seattle, WA 98107	Samara	A farm-to-table bistro that is also cozy neighborhood gem.	4	https://resy.com/cities/sea/samara?date=2019-12-13&seats=2	https://www.google.com/maps/embed/v1/place?key=AIzaSyCOyujenXkNqsCLNFS0JJS7aZ36oaeUhWs&q=Samara%206414%2032nd%20Ave%20NW,%20Seattle,%20WA%2098107	https://maps.google.com/maps?ll=47.67566,-122.39819&z=16&t=m&hl=en-US&gl=US&mapclient=embed&cid=6979283905745290040	2019-12-04 22:31:08.117955	2019-12-04 22:31:08.117955
# 7	75	Seattle	Carnivore	'Seattle's one and only 100% paleo restaurant. Organic, Local, Sustainably Sourced. No dairy (except ghee) no sugars or processed anything.'	4	https://resy.com/cities/sea/carnivore?date=2019-12-13&seats=2	https://www.google.com/maps/embed/v1/place?key=AIzaSyCOyujenXkNqsCLNFS0JJS7aZ36oaeUhWs&q=Carnivore%20Seattle	https://maps.google.com/maps?ll=47.666559,-122.383755&z=16&t=m&hl=en-US&gl=US&mapclient=embed&cid=2962256137994433144	2019-12-04 22:33:33.439843	2019-12-04 22:33:33.439843
# 8	75	5605 22nd Ave NW, Seattle, WA 98107	Gather Kitchen and Bar	Gather Kitchen + Bar offers a globally inspired, family-style menu that includes vegetarian, seafood, and meat dishes. Exposed brick and an open kitchen create a relaxed, lively vibe.	4	https://resy.com/cities/sea/gather-kitchen-and-bar?date=2019-12-13&seats=2	https://www.google.com/maps/embed/v1/place?key=AIzaSyCOyujenXkNqsCLNFS0JJS7aZ36oaeUhWs&q=Gather%20Kitchen%20SEattle	https://maps.google.com/maps?ll=47.669542,-122.384984&z=16&t=m&hl=en-US&gl=US&mapclient=embed&cid=18349644714002634967	2019-12-04 22:35:07.95718	2019-12-04 22:35:07.95718
# 9	75	2230 1st Ave, Seattle, WA 98121	Umi Sake House	A gorgeous and unique interior, Umi features the highest quality seafood available in the Northwest, a large izakaya-style tapas menu, and boasting a sake list of over 60 imported Japanese bottles.	5	https://www.opentable.com/umi-sake-house?avt=eyJ2IjoxLCJtIjoxLCJwIjowfQ&corrid=f4da6181-a0eb-4f95-b2a9-e2d021f2a133&p=2&sd=2019-12-07+19%3A00	https://www.google.com/maps/embed/v1/place?key=AIzaSyCOyujenXkNqsCLNFS0JJS7aZ36oaeUhWs&q=Umi%20Sake%20House%20	https://maps.google.com/maps?ll=47.613307,-122.346041&z=16&t=m&hl=en-US&gl=US&mapclient=embed&cid=13654945144811541709	2019-12-04 22:39:14.312043	2019-12-04 22:39:14.312043
# 10	60	2228 2nd Ave, Seattle, WA 98121	Rocco's	Rustic chic pizza spot with oh-so-delicious pizza using local, organic and artisan products whenever possible.	6	https://www.opentable.com/r/roccos-seattle?avt=eyJ2IjoxLCJtIjoxLCJwIjowfQ&corrid=28445a06-c8a5-4ac1-adc7-75edf192168f&p=2&sd=2019-12-07+19%3A00	https://www.google.com/maps/embed/v1/place?key=AIzaSyCOyujenXkNqsCLNFS0JJS7aZ36oaeUhWs&q=Rocco's%20	https://maps.google.com/maps?ll=47.614016,-122.345114&z=16&t=m&hl=en-US&gl=US&mapclient=embed&cid=18288314072026309866	2019-12-04 22:43:07.004763	2019-12-04 22:43:07.004763
# 11	75	2000 2nd Ave, Seattle, WA 98121	Shaker + Spear	Shaker + Spear is all about seafood paired with fresh, regional ingredients.	7	https://www.opentable.com/shaker-and-spear?avt=eyJ2IjoxLCJtIjoxLCJwIjowfQ&corrid=ade7032f-4825-4453-8405-779128f9d821&p=2&sd=2019-12-07+19%3A00	https://www.google.com/maps/embed/v1/place?key=AIzaSyCOyujenXkNqsCLNFS0JJS7aZ36oaeUhWs&q=Shaker%20+%20Spear%20	https://maps.google.com/maps?ll=47.612048,-122.34172&z=16&t=m&hl=en-US&gl=US&mapclient=embed&cid=1888944664574886690	2019-12-04 22:48:08.17613	2019-12-04 22:48:08.17613
# 12	45	2000 2nd Ave #100, Seattle, WA 98121	PennyRoyal	No reservations here - but we think it's worth checking this place out!  It comes recommended from next door Shaker + Spear!	7	N/A	https://www.google.com/maps/embed/v1/place?key=AIzaSyCOyujenXkNqsCLNFS0JJS7aZ36oaeUhWs&q=pennyroyal%20bar%20	https://maps.google.com/maps?ll=47.611906,-122.34177&z=16&t=m&hl=en-US&gl=US&mapclient=embed&cid=10988350811640182650	2019-12-04 22:49:37.236108	2019-12-04 22:49:37.236108