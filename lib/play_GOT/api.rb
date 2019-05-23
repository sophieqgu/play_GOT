class PlayGOT::API

  def initialize
    url = "https://anapioficeandfire.com/api/houses?hasTitles=true&hasWords=true&hasAncestralWeapons=true"
    response = JSON.parse(RestClient.get(url))
    response.each do |house|
      house_attributes = {
        :name => house["name"],
        :region => house["region"],
        :words => house["words"],
        :titles => house["titles"],
        :ancestral_weapons => house["ancestralWeapons"]
      }
    end 
  end 
  
end 

