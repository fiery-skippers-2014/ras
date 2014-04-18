require 'json'

module Scraper
  class Client
    include HTTParty
    def initialize(search_term)
      @base_uri = "https://api.500px.com/v1/photos/search/?tags=1&rpp=100&sort=rating&consumer_key=GWStsRosRx2RWF3J0Oc5z8OBB5nIG1PxTEGhcovK&tag="
      @search_term = search_term
    end

    def data
       response = self.class.get(@base_uri + @search_term)
       clean(response["photos"])
    end

    private
    def clean(response)
      formatted_data = response.map do |photo|
        {
          photographer: photo["user"]["fullname"],
          tags: photo["tags"],
          title: photo["name"],
          url: photo["image_url"]
        }
      end
      formatted_data
    end

    def parseForSubreddits(response)
      # how are you going to parse this thing?
    end
  end
end