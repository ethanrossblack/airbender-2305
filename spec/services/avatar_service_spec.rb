require 'rails_helper'

RSpec.describe "Avatar Service" do
  describe "instance methods" do
    describe "#nation_search" do
      it "returns characters by their nation" do
        service = AvatarService.new

        fire_nation = service.nation_search("fire+nation")
        expect(fire_nation).to be_an Array
        
        fire_character = fire_nation.first
        
        expect(fire_character).to be_a Hash

        expect(fire_character).to have_key(:_id)
        expect(fire_character[:_id]).to be_a String

        expect(fire_character).to have_key(:allies)
        expect(fire_character[:allies]).to be_an Array
        
        expect(fire_character).to have_key(:enemies)
        expect(fire_character[:enemies]).to be_an Array
        
        expect(fire_character).to have_key(:photoUrl)
        expect(fire_character[:photoUrl]).to be_a String
        
        expect(fire_character).to have_key(:name)
        expect(fire_character[:name]).to be_a String
        
        expect(fire_character).to have_key(:affiliation)
        expect(fire_character[:affiliation]).to be_a String
      end
    end
  end
end