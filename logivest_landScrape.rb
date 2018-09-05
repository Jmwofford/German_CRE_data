require 'json'
require 'csv'

require 'net/http'
require 'uri'

uri = URI.parse("https://www.logivest.de/immobiliensuche/karte/index.php?option=com_lv_property_finder^&task=ajax.getAdvancedFilterPropertyGeoItems")
request = Net::HTTP::Post.new(uri)
request.content_type = "application/json"
request["Origin"] = "https://www.logivest.de"
request["Accept-Language"] = "en-US,en;q=0.9"
request["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36"
request["Accept"] = "application/json, text/plain, */*"
request["Referer"] = "https://www.logivest.de/immobiliensuche/karte/Grundstuck-kaufen?sorting=AREA_DESC^&page=1^&propertyAreaRangeFrom=1000^&BPlanAvailable=0^&hallTypesOptions^%^5Bspeditionswitch^%^5D=0^&hallTypesOptions^%^5Bcold_store^%^5D=0^&additionalInfoOptions^%^5Bcommision_free^%^5D=0^&additionalInfoOptions^%^5Ball_day_availability^%^5D=0^&dedicationOptions^%^5BGE^%^5D=1^&dedicationOptions^%^5BGI^%^5D=1^&dedicationOptions^%^5BSO^%^5D=1^&dedicationOptions^%^5BMG^%^5D=1^&dedicationOptions^%^5BWG^%^5D=1^&rampOption=0^&elevatorOption=0^&heatingOption=0^&sprinklingOption=0^&facilitiesOptions^%^5B1^%^5D=0^&facilitiesOptions^%^5B3^%^5D=0"
request["Authority"] = "www.logivest.de"
request["Cookie"] = "__cfduid=d91a594e13afcbc187b7cb15b8245c79d1535920342; LV_ANONYMOUS_SID=5a5ab9f4-351c-4767-89c6-24c48be6197a; comparisonParks=^%^5B^%^5D; comparisonProperty=^%^5B^%^5D; 49f972ffde0c13240e76534cd0c47753=1e07rdgrvqrv8kjq6abam398l5"
request["Ewq-Code"] = "MgOMfsv0j1sIq2x6ccZRrdKGntUV8W/NxXUa1v2vHLr8elbJH8gQL10mlYAIhecn5ULjEY0Y4LzT61b/k8Bs0MeYJw=="
request["Dnt"] = "1"
request.body = "^{^\\^communeId^^:null,^\\^countyId^^:null,^\\^industrialPropertyId^^:null,^\\^postalCodeId^^:null,^\\^searchRange^^:null,^\\^objectType^^:^\\^LAND_PLOT^^,^\\^searchPhrase^^:null,^\\^sorting^^:^\\^AREA_DESC^^,^\\^stateId^^:null,^\\^motorwayDistance^^:null,^\\^airportDistance^^:null,^\\^freightVillageDistance^^:null,^\\^cepServiceDistance^^:null,^\\^populationDensityRange^^:^{^\\^from^^:null,^\\^to^^:null^},^\\^populationCountRange^^:^{^\\^from^^:null,^\\^to^^:null^},^\\^unemploymentRateRange^^:^{^\\^from^^:null,^\\^to^^:null^},^\\^employmentRateRange^^:^{^\\^from^^:null,^\\^to^^:null^},^\\^ceilingHeightRange^^:^{^\\^from^^:null,^\\^to^^:null^},^\\^gatesAvailableRange^^:^{^\\^from^^:null,^\\^to^^:null^},^\\^totalLaborCostsRange^^:^{^\\^from^^:null,^\\^to^^:null^},^\\^tradeTaxRange^^:^{^\\^from^^:null,^\\^to^^:null^},^\\^selectedObjectKinds^^:null,^\\^selectedHallTypes^^:null,^\\^selectedAdditionalInfo^^:null,^\\^selectedDedication^^:null,^\\^ramp^^:false,^\\^elevator^^:false,^\\^sprinkling^^:false,^\\^heating^^:false,^\\^propertyAreaRangeFrom^^:^\\^10000^^,^\\^propertyAreaRangeTo^^:null,^\\^userSelectedArea^^:null,^\\^findBy^^:null,^\\^selectedFacilities^^:null,^\\^BPlanAvailable^^:false,^\\^pageSize^^:10,^\\^pageNumber^^:1,^\\^isMobile^^:false,^\\^browser^^:^\\^Mozilla/5.0"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

	json = JSON.parse(response.body)

	items = json["data"].first["items"]

	array = items.map do |item|
		[item["lat"], item["lon"], "https://www.logivest.de/gewerbeimmobilien/" + item["id"].to_s]
end

p array.first

CSV.open('Land For Sale LGVST.csv','wb') do |csv|
	csv << ["lat","lon", "url"]
	array.each do |land_listing|
		csv << land_listing
	end
end
