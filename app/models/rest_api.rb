require 'rest-client'
require 'json'

class RestApi

  def initialize
    
  end
  
  def geocode(street, plz, city)
    street = street.squeeze(" ").gsub(" ", "+")
    adressurl = street + '+' + plz + '+' + city
    url = 'https://maps.googleapis.com/maps/api/geocode/json?address=' + adressurl + ',+CA&key=' + 'AIzaSyDhtEIjIwcWpJcx-zpomjAdtLdhjLru6as'
    get = RestClient.get(url)
    response = JSON.parse(get).deep_dup
    return response
  end
  
  def mobilefriendly?(website)
   url = "https://searchconsole.googleapis.com/v1/urlTestingTools/mobileFriendlyTest:run?fields=mobileFriendliness%2CmobileFriendlyIssues%2CresourceIssues%2Cscreenshot%2CtestStatus&key=" + "AIzaSyDhtEIjIwcWpJcx-zpomjAdtLdhjLru6as"
   params = {"url": website, "requestScreenshot": false}
   header = {content_type: :json, accept: :json}
   post = RestClient.post(url, params, header)
   response = JSON.parse(post).deep_dup
   return response
  end
  
  def searchconsolesitemap(website, sitemap)
    website = website.gsub(":", "%3A").gsub("/", "%2F")
    sitemap = sitemap.gsub(":", "%3A").gsub("/", "%2F")
    url = "https://www.googleapis.com/webmasters/v3/sites/" + website + "/sitemaps/" + sitemap + "?fields=contents%2Cerrors%2Cpath%2Ctype%2Cwarnings&key=" + "AIzaSyDhtEIjIwcWpJcx-zpomjAdtLdhjLru6as"
    get = RestClient.get(url)
    response = JSON.parse(get).deep_dup
    return response
  end
  
  def pagespeed(website)
    website = website.gsub(":", "%3A").gsub("/", "%2F")
    url = "https://www.googleapis.com/pagespeedonline/v4/runPagespeed?url=" + website + "&filter_third_party_resources=false&locale=de&screenshot=true&snapshots=true&strategy=desktop&key=" + "AIzaSyDhtEIjIwcWpJcx-zpomjAdtLdhjLru6as"
    get = RestClient.get(url)
    response = JSON.parse(get).deep_dup
    return response
  end
  
  
  
  
end
