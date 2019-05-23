class PlayGOT::API

  def self.list_houses
    url = "https://anapioficeandfire.com/api/houses?hasTitles=true&hasSeats=true"
    houses = JSON.parse(RestClient.get(url))
    houses.each.with_index(1) do |h, i|
      puts "#{i} - #{h["name"]}"
    end 
  end 
  
end 