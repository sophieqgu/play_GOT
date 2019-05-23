class PlayGOT::House 
  attr_accessor :name, :region, :words, :titles, :ancestral_weapons
  @@all = []
  
  def initialize
    PlayGOT::API.new.each do |house_attributes|
      house_attributes.each do |k, v|
        self.send("#{k}=", v)
      end 
      @@all << self 
    end 
  end 
  
  def self.all 
    @@all
  end 

  def self.list_all
    self.all.each.with_index(1) do |h, i|
      puts "#{i} - #{h.name}"
    end 
    binding.pry 
  end 
  
  def self.find(i)
    self.all[i - 1]
  end 
  
end 