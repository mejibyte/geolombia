# encoding: utf-8
require "spec_helper"

describe Geolombia::State do
  describe "#self.load_fixtures" do
    it "loads the @@all variable with all states on the states.csv fixture file" do
      Geolombia::State.class_variable_set(:@@all, []) # Clean up so we start from scratch
      Geolombia::State.all.should == []
      Geolombia::State.send(:load_fixtures)
      Geolombia::State.all.size.should == 32
      Geolombia::State.all.each { |state| state.should be_instance_of(Geolombia::State) }
    end
  end
  
  describe "#self.find_by_name" do
    it "returns an instance of State if found" do
      Geolombia::State.find_by_name("Antioquia").should be_instance_of(Geolombia::State)
    end
    
    it "returns nil if not found" do
      Geolombia::State.find_by_name("Nowhere").should be_nil
    end
  end
  
  describe "getters" do
    it "should return correct values" do
      state = Geolombia::State.find_by_name("Antioquia")
      state.name.should == "Antioquia"
      state.code.should == "05"
      state.latitude.should == 7.0
      state.longitude.should == -75.5
    end
  end
  
  describe "#cities" do
    before do
      @antioquia = Geolombia::State.find_by_name("Antioquia")
    end
    
    it "returns an array" do
      @antioquia.cities.should be_instance_of Array
    end
    
    it "returns the actual cities that belong to that state" do
      @antioquia.cities.size.should == 125
      names = @antioquia.cities.map(&:name)
      names.should include("Medellín")
      names.should include("Envigado")
      names.should include("Bello")
      names.should include("Itagüí")
      names.should include("Sabaneta")
      names.should include("Retiro")
      names.should include("Ríonegro")
      names.should include("La Ceja")
      names.should include("Tarso")
      names.should include("Apartadó")
      names.should include("Caucasia")
    end
  end
end