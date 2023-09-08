require 'rails_helper'

RSpec.describe "Nation Member PORO" do
  before do
    @char_params = {
      "_id": "5cf5679a915ecad153ab68da",
      "allies": [
          "Ozai",
          "Zuko "
      ],
      "enemies": [
          "Iroh",
          "Zuko",
          "Kuei",
          "Long Feng",
          "Mai",
          "Ty Lee",
          "Ursa "
      ],
      "photoUrl": "https://vignette.wikia.nocookie.net/avatar/images/1/12/Azula.png/revision/latest?cb=20140905084941",
      "name": "Azula",
      "affiliation": " Azula's team (formerly) Dai Li (formerly) Fire Nation Fire Nation Royal Family Fire Warriors Royal Fire Academy for Girls (formerly)"
    }

    @nat_mem = NationMember.new(@char_params)
  end

  it "exists and has attributes" do
    expect(@nat_mem).to be_a(NationMember)

    expect(@nat_mem.name).to eq(@char_params[:name])
    expect(@nat_mem.photo_url).to eq(@char_params[:photoUrl])
    expect(@nat_mem.allies).to eq(@char_params[:allies])
    expect(@nat_mem.enemies).to eq(@char_params[:enemies])
    expect(@nat_mem.affiliation).to eq(@char_params[:affiliation])
  end
end