require_relative 'Pointlist.rb'
require_relative 'Plot.rb'


class VizController



    def initialize

        @pointlist = Pointlist.new
        @pointlist.addRandomPoints($NUM_POINTS, $WIDTH, $HEIGHT)
        @plotter = Plot.new($WIDTH, $HEIGHT)
        
        # set up event handling
        @plotter.add_subscription(self) 
        @pointlist.add_subscription(@plotter)

        
        # pass control to TK's main event loop... 
        @plotter.updateButton("Add Points", "addPoints")
        @plotter.mainLoop

    end



    def addPoints(*args)

        # initial sorting step
        @pointlist.cartSort()
        @pointlist.polarSort()

        # draw points on canvas
        @plotter.addPoints(@pointlist.points)

        @plotter.updateButton("Find Hull", "findHull")

    end



    def findHull(*args)

       @pointlist.findHull
       @plotter.drawHull(@pointlist.hullBoundry)


       @plotter.updateButton("Exit", "quit")

    end
  

    
    def quit(*args)

        exit

    end



end


