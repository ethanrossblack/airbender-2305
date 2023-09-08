require 'rails_helper'

RSpec.describe "Search by nation" do
  before do
    visit root_path

    select("Fire Nation", from: "nation")

    click_button "Search For Members"
  end

  describe "When I visit '/', select 'Fire Nation' from the select field, and click 'Search for Members'" do
    it "brings me to the '/search' page" do
      expect(current_path).to eq('/search')
    end

    it "shows the total number of people who live in the Fire Nation" do
      nation_param = 'fire+nation'
      expect(page).to have_content("Total members of '#{nation_param}': ")
    end

    it "lists the first 25 members of the fire nation and their attributes" do
      expect(page).to have_css("div.character", maximum: 25)

      first_char = page.first("div.character")

      within(first_char) do
        expect(page).to have_css("img")
        expect(page).to have_css(".name")
        expect(page).to have_css(".allies")
        expect(page).to have_css(".enemies")
        expect(page).to have_css(".affiliations")
      end
    end
  end
end
