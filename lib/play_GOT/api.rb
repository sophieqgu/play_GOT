class PlayGOT::API

  def initialize
    url = "https://anapioficeandfire.com/api/houses?hasTitles=true&hasWords=true&hasAncestralWeapons=true"
    @response = JSON.parse(RestClient.get(url))
  end 
  
  
  def create_houses
    @response.each do |house|
      house_attributes = {
        :name => house["name"],
        :region => house["region"],
        :words => house["words"],
        :titles => house["titles"],
        :ancestral_weapons => house["ancestralWeapons"]
      }
      PlayGOT::House.new(house_attributes)
    end 
  end 
  
end 

