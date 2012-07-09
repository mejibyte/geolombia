# encoding: utf-8
require "spec_helper"

describe Geolombia::State do
  describe "#self.load_fixtures" do
    it "loads the @@all variable with all cities on the cities.csv fixture file" do
      Geolombia::City.class_variable_set(:@@all, []) # Clean up so we start from scratch
      Geolombia::City.all.should == []
      Geolombia::City.send(:load_fixtures)
      Geolombia::City.all.size.should == 1102
      Geolombia::City.all.each { |state| state.should be_instance_of(Geolombia::City) }
    end
  end
  
  describe "#self.find_by_name" do
    it "returns an instance of City if found" do
      Geolombia::City.find_by_name("Medellín").should be_instance_of(Geolombia::City)
    end
    
    it "returns nil if not found" do
      Geolombia::City.find_by_name("Nowhere").should be_nil
    end
  end
  
  describe "#self.find_by_code" do
    it "returns an instance of City if found" do
      city = Geolombia::City.find_by_code("05001")
      city.should be_instance_of(Geolombia::City)
      city.name.should == "Medellín"
    end
    
    it "returns nil if not found" do
      Geolombia::City.find_by_code("666").should be_nil
    end
  end
  
  
  
  describe "getters" do
    it "return correct values" do
      state = Geolombia::City.find_by_name("Medellín")
      state.name.should == "Medellín"
      state.code.should == "05001"
      state.latitude.should == 6.2913889
      state.longitude.should == -75.5361111
    end
  end
  
  describe "#state" do
    before do
      @medellin = Geolombia::City.find_by_name("Medellín")
      @bogota = Geolombia::City.find_by_name("Bogotá")
    end
    
    it "returns the state this city belongs to" do
      @medellin.state.name.should == "Antioquia"
      @bogota.state.name.should == "Cundinamarca"
    end
    
    it "returns an instance of State" do
      @medellin.state.should be_instance_of(Geolombia::State)
    end
  end
  
  describe "#name" do
    it "is UTF-8 encoded" do
        name = Geolombia::City.find_by_name("Medellín").name
        name.encoding.should == Encoding.find("UTF-8")
    end
  end
end