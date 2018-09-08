require 'net/http'
require 'uri'
require 'mechanize'
require 'json'
require 'csv'

uri = URI.parse("https://gewerbeimmobilien.jll.de/api/search/propertysearch/geopoint-10.342^%^2051.049_204.297/gewerbe-hallen/tenuretype-miete/default_alternateresult-true")
request = Net::HTTP::Post.new(uri)
request.content_type = "application/x-www-form-urlencoded; charset=UTF-8"
request["Cookie"] = "olm-trckngckie=dPk6BRWmiN8TVdbXefjbgie8ZdigunbCSGBhGB3tw8s=; SEMItem=Keywords=^&ReferalString=http://www.jll.de/germany/de-de/dienstleistungen/Immobiliennutzer/Vermietung^&ReferalProvider=Other^&UtmCampaign=dropdown^&UtmContent=retail^&UtmMedium=referral^&UtmSource=^&UtmTerm=^&c=^&gclid=^&LandingPage=/einzelhandel/?utm_corp^%^26utm_medium^%^3dreferral^%^26utm_campaign^%^3ddropdown^%^26utm_content^%^3dretail; currentNavigationResultSet=^%^5B^%^5D; olm-sessionckie=wnO5y1USc3lQTeMIUMvISE_1x40LzUJPunz4EJiNyog=; currentNavigationResultCount=260; currentSearch=^%^2Fpropertysearch^%^2Fgeopoint-10.342^%^2051.049_204.297^%^2Fgewerbe-hallen^%^2Ftenuretype-miete^%^2Fdefault_alternateresult-true^%^2F; currentSearchPageUrl=^%^2Fergebnis^%^2Fgeopoint-10.342^%^252051.049_204.297^%^2Fgewerbe-hallen^%^2Ftenuretype-miete"
request["Origin"] = "https://gewerbeimmobilien.jll.de"
request["Accept-Language"] = "en-US,en;q=0.9"
request["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36"
request["Requestid"] = "dcely9soh"
request["Accept"] = "application/json, text/javascript, */*; q=0.01"
request["Referer"] = "https://gewerbeimmobilien.jll.de/ergebnis/geopoint-10.342^%^2051.049_204.297/gewerbe-hallen/tenuretype-miete"
request["X-Requested-With"] = "XMLHttpRequest"
request["Connection"] = "keep-alive"
request["Dnt"] = "1"
request.set_form_data(
  "AvailabilityType" => "^%^5B^%^5D^",
  "AvailabilityType-IsEnabled" => "true^",
  "Distance" => "^",
  "Distance-IsEnabled" => "false^",
  "EnergyRating" => "^%^5B^%^5D^",
  "EnergyRating-IsEnabled" => "true^",
  "Features" => "^%^5B^%^5D^",
  "Features-IsEnabled" => "true^",
  "GeoPoint" => "^%^7B^%^22Lat^%^22^%^3A51.124^%^2C^%^22Long^%^22^%^3A10.224^%^2C^%^22Distance^%^22^%^3A0^%^7D^",
  "GeoPoint-IsEnabled" => "true^",
  "InitialYield" => "^%^7B^%^22Min^%^22^%^3Anull^%^2C^%^22Max^%^22^%^3Anull^%^7D^",
  "InitialYield-IsEnabled" => "true^",
  "IsCommissionFree" => "^%^5B^%^22^%^22^%^5D^",
  "IsCommissionFree-IsEnabled" => "true^",
  "LeasePrice" => "^%^7B^%^7D^",
  "LeasePrice-IsEnabled" => "true^",
  "LocationApiUrl" => "false^",
  "LocationType" => "^%^5B^%^5D^",
  "LocationType-IsEnabled" => "true^",
  "PropertySourceSystemId" => "^%^5B^%^5D^",
  "PropertySourceSystemId-IsEnabled" => "true^",
  "PropertySubType" => "^%^5B^%^5D^",
  "PropertySubType-IsEnabled" => "true^",
  "PropertyType" => "^%^22Hallen^%^22^",
  "PropertyType-IsEnabled" => "true^",
  "SalePrice" => "^%^7B^%^7D^",
  "SalePrice-IsEnabled" => "false^",
  "SeoSearchTag" => "^%^5B^%^5D^",
  "SeoSearchTag-IsEnabled" => "true^",
  "Size" => "^%^7B^%^7D^",
  "Size-IsEnabled" => "true^",
  "Sort" => "",
  "Sort-IsEnabled" => "true^",
  "TenureType" => "^%^22miete^%^22^",
  "TenureType-IsEnabled" => "true^",
  "WindowRange" => "^%^7B^%^7D^",
  "WindowRange-IsEnabled" => "false^",
  "searchText" => "Lauterbach^",
)

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end




# uri = URI.parse("https://gewerbeimmobilien.jll.de/api/search/propertysearch/default_alternateresult-true/default_isavailable-true/default_sort-listingbestproperties-desc/geopoint-10.034^%^2050.801_0/gewerbe-hallen/tenuretype-miete//pagesize-1/page-0/altpagesize-0")
# request = Net::HTTP::Get.new(uri)
# request["Cookie"] = "olm-trckngckie=dPk6BRWmiN8TVdbXefjbgie8ZdigunbCSGBhGB3tw8s=; SEMItem=Keywords=^&ReferalString=http://www.jll.de/germany/de-de^&ReferalProvider=Other^&UtmCampaign=dropdown^&UtmContent=retail^&UtmMedium=referral^&UtmSource=^&UtmTerm=^&c=^&gclid=^&LandingPage=/einzelhandel/?utm_corp^%^26utm_medium^%^3dreferral^%^26utm_campaign^%^3ddropdown^%^26utm_content^%^3dretail; currentNavigationResultSet=^%^5B^%^5D; olm-sessionckie=JOSt2zejPYcFN75B1oqDQaJitfZiSAdMnACA_avaxM0=; paginationOptionsCookie=^%^7B^%^22totalPageCount^%^22^%^3A752^%^2C^%^22nextLink^%^22^%^3A^%^22^%^2Fhallen^%^2Fm0380^%^2F^%^22^%^2C^%^22previousLink^%^22^%^3A^%^22^%^2Fhallen^%^2Fb1282^%^2F^%^22^%^2C^%^22currentName^%^22^%^3A^%^22Halle^%^20-^%^20M^%^C3^%^BCnchen^%^2C^%^20Aubing-Lochhausen-Langwied^%^20-^%^20M0380^%^22^%^2C^%^22currentIndex^%^22^%^3A1^%^2C^%^22nextIndex^%^22^%^3A2^%^2C^%^22previousIndex^%^22^%^3A0^%^2C^%^22requestUrl^%^22^%^3A^%^22^%^2Fapi^%^2Fsearch^%^2Fpropertysearch^%^2Fdefault_alternateresult-true^%^2Fdefault_isavailable-true^%^2Fdefault_sort-listingbestproperties-desc^%^2Fgeopoint-10.034^%^2050.801_0^%^2Fgewerbe-hallen^%^2Ftenuretype-miete^%^2F^%^2Fpagesize-1^%^2Fpage-^%^22^%^2C^%^22propertyTile^%^22^%^3Afalse^%^7D; currentNavigationResultCount=752; currentSearch=^%^2Fpropertysearch^%^2Fgewerbe-hallen^%^2Ftenuretype-miete^%^2Fdefault_alternateresult-true^%^2F; currentSearchPageUrl=^%^2Fergebnis^%^2Fgewerbe-hallen^%^2Ftenuretype-miete^%^2F"
# request["Dnt"] = "1"
# request.content_type = "application/json"
# request["Accept-Language"] = "en-US,en;q=0.9"
# request["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36"
# request["Accept"] = "*/*"
# request["Referer"] = "https://gewerbeimmobilien.jll.de/ergebnis/gewerbe-hallen/tenuretype-miete/"
# request["X-Requested-With"] = "XMLHttpRequest"
# request["Connection"] = "keep-alive"

# req_options = {
#   use_ssl: uri.scheme == "https",
# }

# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)

# end


