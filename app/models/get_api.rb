require 'rest-client'
require 'json'

class GetApi
  
  def initialize
  end
  
  def mobilefriendly(url)
   response = RestClient.post("https://searchconsole.googleapis.com/v1/urlTestingTools/mobileFriendlyTest:run?fields=mobileFriendliness%2CmobileFriendlyIssues%2CresourceIssues%2Cscreenshot%2CtestStatus&key=AIzaSyAdHQMf6FK0cQSCACP_v42RYuLmzezsDsM", {"url" => url }, {content_type: :json, accept: :json})
   return response   
  end
  
  def geocode(street, plz, city)
    street = street.squeeze(" ").gsub(" ", "+")
    adressurl = street + '+' + plz + '+' + city
    url = 'https://maps.googleapis.com/maps/api/geocode/json?address=' + adressurl + ',+CA&key=' + 'AIzaSyAdHQMf6FK0cQSCACP_v42RYuLmzezsDsM'
    response = RestClient.get(url)
    puts response
  end
  

end