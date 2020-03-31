require 'rails_helper'

RSpec.describe "food search" do
  it "can display foods" do
    # create_list(:food, ingredient: "sweet potatoes", count: 5)
    # Food.create!(description: "sweet potatoes")

    visit '/'

    fill_in :q, with: "sweet potatoes"

    click_on "Search"

    expect(current_path).to eq("/foods")

    expect(first("#result-count").text).to_not be_empty

    expect(page).to have_css(".food", count: 10)

    within first(".food") do
      expect(first('.upc').text).to_not be_empty
      expect(first('.description').text).to_not be_empty
      expect(first('.brand-owner').text).to_not be_empty
      expect(first('.ingredients').text).to_not be_empty
    end
  end
end
