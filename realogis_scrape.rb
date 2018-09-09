# require 'net/http'
# require 'uri'
# require 'json'
# require 'csv'
# require 'mechanize'

# agent = Mechanize.new

# url = "https://www.realogis.de/suchen/gewerbehalle-kaufen.html"

# page = agent.get url

# # find_listing = page.search('nb-maklerTool-objectList-item-detailsItem')

# find_listing = page.search('.nb-maklerTool-objectList-item-detailsItem').children.to_json

# json = JSON.parse(find_listing)

# pp json
# throws error about Authorization...Downloaded APIKEY for Google...unsure how to implement

# APIKey: AIzaSyD8r6c57kriG13zQBS3M2k49zGd9P2QBP0

# script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8r6c57kriG13zQBS3M2k49zGd9P2QBP0&callback=initMap"
#   type="text/javascript"></script>

# uri = URI.parse("https://maps.googleapis.com/maps/api/js/ViewportInfoService.GetViewportInfo?1m6^&1m2^&1d53.05702057550015^&2d8.973358338414869^&2m2^&1d54.068562788194185^&2d11.81220261274973^&2u10^&4sen-US^&5e0^&6sm^%^40434000000^&7b0^&8e0^&callback=_xdc_._yy9s27^&token=106959")
# request = Net::HTTP::Post.new(uri)
# request["Referer"] = "https://www.realogis.de/suchen/gewerbehalle-kaufen.html"
# request["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36"
# request["Dnt"] = "1"

# req_options = {
#   use_ssl: uri.scheme == "https",
# }

# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)
# end

# p response

# 	items = json["data"].first["items"]

# 	array = items.map do |item|
# 		[item["lat"], item["lon"], "https://www.logivest.de/gewerbeimmobilien/" + item["id"].to_s]
# end

# p array.first

# CSV.open('Land For Sale LGVST.csv','wb') do |csv|
# 	csv << ["lat","lon", "url"]
# 	array.each do |land_listing|
# 		csv << land_listing
# 	end
# end


require 'net/http'
require 'uri'
require 'json'
require 'csv'
require 'mechanize'

agent = Mechanize.new

url = "https://www.realogis.de/suchen/gewerbehalle-kaufen.html"

page = agent.get url


find_listing = page.search('.nb-maklerTool-objectList-item-detailsItem-label')
 	
 	pp find_listing.children.text

find_listing_value = page.search('.nb-maklerTool-objectList-item-detailsItem-value')

	pp find_listing_value.children.text.to_s.split("/")