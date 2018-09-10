require 'mechanize'
require 'csv'
require 'json'

agent = Mechanize.new
url =('https://gewerbeimmobilien.jll.de/ergebnis/geopoint-10.342%2051.049_267.116/gewerbe-hallen/tenuretype-miete')

page = agent.get url 

locate_webpage = page.search('h3').children.to_json.split("-")

filtered_res= pp locate_webpage = page.search('h3').children.to_json.split("-").sort
		 pp filtered_res
		 	


