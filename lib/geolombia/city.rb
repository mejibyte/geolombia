require 'csv'

module Geolombia
  class City < Base

    def initialize(code, name, state_code, state_name, latitude, longitude)
      @code = code
      @name = name
      @state_code = state_code
      @state_name = state_name
      @latitude = latitude.to_f
      @longitude = longitude.to_f
    end
    
    attr_accessor :code, :name, :state_code, :state_name, :latitude, :longitude
    
    def state
      Geolombia::State.find_by_name(@state_name)
    end

    def self.find_by_name(some_name)
      @@all.select { |city| city.name == some_name }.first
    end
    
    def self.find_by_code(some_code)
      @@all.select { |city| city.code == some_code }.first
    end
    
    def self.all
      @@all
    end

    private
    
    def self.load_fixtures
      @@all = []
      CSV.foreach(File.expand_path('../fixtures/cities.csv', __FILE__)) do |row|
        @@all << new(*row)
      end
    end
  end
end