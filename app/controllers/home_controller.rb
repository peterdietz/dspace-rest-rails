class HomeController < ApplicationController

  require 'json'
  require 'rest_client'

  def index

    @communityURL = Array.new
    @communities = Array.new
    baseRestURL = "http://kb.osu.edu/rest"

    url = urlAppend("communities", baseRestURL)

    rawJSON = RestClient.get url, {:accept => :json}
    jsonNode = JSON.parse(rawJSON)

    i = 0
    while i < jsonNode.size

      @communityURL.push urlAppend(jsonNode[i]['id'].to_s, baseRestURL +"/communities")
      @communities.push jsonNode[i]['name']
      i += 1

    end

  end

  def urlAppend(endpoint, baseURL)

    finalURL = baseURL + "/" + endpoint
    return finalURL

  end

end