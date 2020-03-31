class FoodsController < ApplicationController
  def index
    # response = Faraday.get("https://api.nal.usda.gov/fdc/v1/search?api_key=#{ENV["FDC_KEY"]}&ingredients=#{params[:q]}")
    # json = JSON.parse(response.body, symbolize_names: true)
    # @result_count = json[:totalHits]
    data = FDCService.new(params[:q]).get_food_data
    @foods = data.first(10).map do |food_attributes|
      Food.new(food_attributes)
    end
  end
end
