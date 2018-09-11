require 'mechanize'
require 'csv'
require 'json'

agent = Mechanize.new
# url =('https://gewerbeimmobilien.jll.de/ergebnis/geopoint-10.342%2051.049_267.116/gewerbe-hallen/tenuretype-miete')
url = ('https://gewerbeimmobilien.jll.de/ergebnis/geopoint-9.656%2051.467_204.697/gewerbe-hallen/tenuretype-miete')
page = agent.get url

listing_title = page.search('.blurHolder').first.search('h3').first.text
# first listing

all_listing_titles = page.search('.blurHolder').children.search('h3').text
# all listings
prop_title = page.search('.SearchTile-inner').first.parent.values.first

listing_address = page.search('.blurHolder').first.search('dd').first.text
# first address

all_listing_addresses = page.search('.blurHolder').children.search('dd').children.text
# all addresses

pp "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ LISTING TITLES @@@@@@@@@@@@@@@@@@@@@@@"+all_listing_titles+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
pp "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ LISTING ADRESSES @@@@@@@@@@@@@@@@@@@@@@"+all_listing_addresses+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"



# ---------------------------- THIS WORKS **** DO NOT TOUCH **** -------FIND WAY TO MAP THROUGH ALLL DATA--NOT JUST .FIRST----------



# locate_webpage = page.search('h3').children.to_json.split("-")
# listing_title = page.search('.blurHolder').children.search('h3').text
# listing_address = page.search('.blurHolder').children.search('dd').text

# filtered_res= pp locate_webpage = page.search('h3').children.to_json.split("-").sort
# 		 pp filtered_res
		 	


