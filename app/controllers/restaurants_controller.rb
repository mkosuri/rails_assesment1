class RestaurantsController < ApplicationController

  def index
    render json: DataFetch::Main.return_restaurants(DataFetch::Main.get_restaurents['businesses'])
  end

end
