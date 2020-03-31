class FoodsController < ApplicationController
  def index

    response = Faraday.get("https://api.nal.usda.gov/fdc/v1/search?api_key=#{ENV["FDC_KEY"]}&ingredients=#{params[:q]}")
    json = JSON.parse(response.body, symbolize_names: true)
    @result_count = json[:totalHits]
    @foods = json[:foods].first(10)
  end
end
