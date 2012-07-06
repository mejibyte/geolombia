# Geolombia

Geolombia is a gem that has a list of all cities and states in Colombia.

## Installation

Add this line to your application's Gemfile:

    gem 'geolombia'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geolombia

## Usage
    Geolombia::State.find_by_name("Antioquia")
    # => #<Geolombia::State:0x00000100841240 @code="05", @name="Antioquia", @latitude=7.0, @longitude=-75.5>

    Geolombia::City.where(:name => "Medellín").first

    Geolombia::State.where(:name => "Antioquia").first.cities

    Geolombia::City.all

    Geolombia::City.first.state

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
