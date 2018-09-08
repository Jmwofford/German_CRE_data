require 'json'
require 'csv'
require 'net/http'
require 'uri'

uri = URI.parse("https://maps.googleapis.com/maps/api/js/ViewportInfoService.GetViewportInfo?1m6^&1m2^&1d51.79363520135163^&2d12.024722050638047^&2m2^&1d52.83488208283146^&2d14.879753822437578^&2u10^&4sen-US^&5e0^&6sm^%^40434000000^&7b0^&8e0^&callback=_xdc_._g4jmpx^&token=56146")
request = Net::HTTP::Get.new(uri)
request["Referer"] = "https://www.realogis.de/suchen/gewerbehalle-kaufen.html"
request["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36"
request["Dnt"] = "1"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end
p response

# json = JSON.parse(response.body)

# => "The Google Maps JavaScript API must be downloaded directly from Google's servers. Learn more: https://developers.google.com/maps/documentation/javascript/tutorial#Loading_the_Maps_API"

# needsScriptTag and API key 

# <script async defer
#       src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap">
#     </script>