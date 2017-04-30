require 'pry'

class Owner
  @@all = []
  attr_reader :species
  attr_accessor :name, :pets 

  def initialize(name)
    @species = name
    @pets = {fishes: [], dogs: [], cats: []}
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def walk_dogs
    @pets[:dogs].each {|d| d.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|c| c.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|f| f.mood = "happy"}
  end

  def sell_pets
    @pets.map do |pets, types|
      types.each do |pet|
        pet.mood = "nervous"
      end
     types.clear  
    end 
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

  def self.count
    @@all.length
  end

  def self.all
    @@all 
  end 

  def self.reset_all 
    @@all.clear
  end
end