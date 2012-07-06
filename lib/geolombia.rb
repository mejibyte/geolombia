require "geolombia/version"
require "geolombia/base"
require "geolombia/state"
require "geolombia/city"

module Geolombia
  Geolombia::State.send(:load_fixtures)
  Geolombia::City.send(:load_fixtures)
end
