
require 'net/http'
require 'uri'
require 'json'
require 'csv'
require 'mechanize'

agent = Mechanize.new

url = "https://www.realogis.de/suchen/gewerbehalle-kaufen.html"

page = agent.get url

listing_info = page.search(".nb-maklerTool-objectList-item-headline").children.text
# finds Title of Listing

find_listing_attr = page.search('.nb-maklerTool-objectList-item-detailsItem-value').children.text	
# find listings attr within div on webFinder
 	

