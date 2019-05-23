class PlayGOT::API

  def self.list_characters
    characters = RestClient.get("https://anapioficeandfire.com/api/houses")
    @characters_list = JSON.parse(characters)
    binding.pry
  end 
end 