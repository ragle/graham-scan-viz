require_relative 'Point.rb'
require_relative 'Events.rb'

class Pointlist

    include Events

    attr_accessor :points, :hullBoundry

    def initialize

        @points = Array.new
        @hullBoundry = Array.new

    end



    def addRandomPoints(num_points, max_width, max_height)

        @points.clear

        num_points.times do |i|
            @points << Point.new(rand(50...max_width - 50), rand(50...max_height - 50));
        end

    end



    def crossProduct(first, a, b)
        
        cp = ((a.x - first.x) * (b.y - first.y)) - ((b.x - first.x) * (a.y - first.y))

        return 1 if cp > 0
        return 0 if cp == 0
        return -1 if cp < 0    
        
    end



    def cartSort
        
        @points.sort! do |a,b|
            spaceship = (a.y <=> b.y)
            spaceship.zero? ? (a.x <=> b.x) : spaceship
        end
    
    end


    
    def polarSort

        first = @points.shift

        @points.sort! do |a,b|
            self.crossProduct(first,a,b)
        end
        @points.unshift(first)

    end



    def findHull

       for i in 0..2 do
           @hullBoundry.unshift(@points[i])
       end

       for i in 3...@points.size do

           emit('drawCheckedPoints', {:pt1 => @hullBoundry[1], :pt2 => @hullBoundry[0], :pt3 => @points[i]})

           while (@hullBoundry.length > 1 && crossProduct(@hullBoundry[1], @hullBoundry[0], @points[i]) >= 0) do
               @hullBoundry.shift
           end
           @hullBoundry.unshift(@points[i])
   
       end

    end



end

