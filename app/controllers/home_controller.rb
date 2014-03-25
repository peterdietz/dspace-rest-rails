class HomeController < ApplicationController

  caches_page :index, expires_in: 1.hour

  # @return [@communities, @communityID, $baseRestURL, $endpoint, $jsonNode]
  def index

    $baseRestURL = "http://kb.osu.edu/rest"

    @communityID = Array.new
    @communities = Array.new

    $endpoint = url_append("communities", $baseRestURL)

    rawJSON = RestClient.get $endpoint, {:accept => :json}
    $jsonNode = JSON.parse(rawJSON)

    i = 0
    while i < $jsonNode.size

      @communityID.push $jsonNode[i]['id']
      @communities.push $jsonNode[i]['name']
      i += 1

    end

  end

end