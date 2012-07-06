require 'csv'

module Geolombia
  class State < Base
    def initialize(code, name, latitude, longitude)
      @code = code
      @name = name
      @latitude = latitude.to_f
      @longitude = longitude.to_f
    end
    
    attr_reader :code, :name, :latitude, :longitude
  
    def self.find_by_name(some_name)
      @@all.select { |state| state.name == some_name }.first
    end
    
    def self.all
      @@all
    end
    
    def cities
      City.all.select { |city| city.state_name == name }
    end

    private
    
    def self.load_fixtures
      @@all = []
      CSV.foreach(File.expand_path('../fixtures/states.csv', __FILE__)) do |row|
        @@all << new(*row)
      end
    end
  end
end