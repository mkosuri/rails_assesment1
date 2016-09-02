require 'rest_client'
require 'socket'

module DataFetch
  module Main
    def self.get_restaurents
      begin
        res = File.read("#{Rails.root}/public/cue_data.json")
        res = ActiveSupport::JSON.decode(res)
        return res
      rescue Exception => e
        Rails.logger.info 'Bad Request' + e.message
        return
      end
    end

    def self.return_restaurants(restaurants)
      total_restaurants = []
      restaurants.each do |resturant|
        temp_resturant = {}
        temp_resturant[:resturant_name] = resturant['name']
        temp_resturant[:review_count] = resturant['review_count']
        ## start construction of address
        address = construct_address(resturant)
        ## End of construction of address
        temp_resturant[:address] = address
        temp_resturant[:avg_rating] = resturant['avg_rating']
        total_restaurants.push(temp_resturant)
      end
      return total_restaurants
    end

    def self.construct_address(resturant)
      address = {}
      address[:latitude] = resturant['latitude']
      address[:longitude] = resturant['longitude']
      address[:state] = resturant['state']
      address[:zipcode] = resturant['zip']

      return address
    end
  end
end
