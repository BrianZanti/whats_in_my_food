require 'rails_helper'

RSpec.describe "food search" do
  it "can display foods" do
    # create_list(:food, ingredient: "sweet potatoes", count: 5)
    # Food.create!(description: "sweet potatoes")

    visit '/'

    fill_in :q, with: "sweet potatoes"

    click_on "Search"

    expect(current_path).to eq("/foods")

    expect(page).to have_css("#result-count")

    expect(page).to have_css(".food", count: 10)

    within first(".food") do
      expect(page).to have_content("Sweet potato chips")
      expect(page).to have_css(".upc")
      expect(page).to have_css(".description")
      expect(page).to have_css(".brand-owner")
      expect(page).to have_css(".ingredients")
    end
  end
end
