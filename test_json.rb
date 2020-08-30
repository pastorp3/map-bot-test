require_relative 'data\countries.rb'

 

class SetLocation

    def initialize
        @data = data()
    end

    def latitud(input)
        return @data[input][:latitude]
    end

    def longitude(input)
        return @data[input][:longitude]
    end


end

