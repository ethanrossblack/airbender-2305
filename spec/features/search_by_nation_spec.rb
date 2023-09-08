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



When I visit "/"
And I select "Fire Nation" from the select field
(Note: Use the existing select field)
And I click "Search For Members"
Then I should be on page "/search"
Then I should see the total number of people who live in the Fire Nation. (should be close to 100)
And I should see a list with the detailed information for the first 25 members of the Fire Nation.
And for each of the members I should see:
- The name of the member (and their photo, if they have one)
- The list of allies or "None"
- The list of enemies or "None"
- Any affiliations that the member has
