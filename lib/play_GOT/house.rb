class PlayGOT::House 
  attr_accessor :name, :region, :words, :titles, :ancestral_weapons
  @@all = []
  @@chosen = {}
  
  def initialize(house_attributes)
    house_attributes.each do |k, v|
      self.send("#{k}=", v)
    end 
    @@all << self 
  end 
  
  def self.all 
    @@all
  end 

  def self.list_all
    self.all.each.with_index(1) do |h, i|
      puts "#{i} - #{h.name}".blue
    end 
  end 
  
  def self.find(i)
    @@chosen = self.all[i - 1]
  end 
  
end 