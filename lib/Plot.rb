#Dependencies
require 'tk'
require_relative 'Events'


class Plot
    include Events


    def initialize(max_width, max_height)
        
        @root = TkRoot.new {title "Convex Hull Visualization"}

        myHeadingFont = TkFont.new("family" => 'Helvetica', 
                                   "size" => 10, 
                                   "weight" => 'bold')
        
        @heading = TkLabel.new(@root) do
            background "Dark Blue"
            foreground "Yellow"
            font myHeadingFont
            text 'STEP 1: Setup'
            pack { padx 50; pady 15; side 'top' }
        end
        
        @canvas = TkCanvas.new(@root)
        @canvas.width = max_width
        @canvas.height = max_height
        @canvas.pack("side"=>"top", "padx" => "5", "pady" => "5")
        
        @button = TkButton.new(@root)
        @button.pack("side"=>"right", "padx" => "10", "pady" => "10")

        
    end



    def mainLoop
        
        Tk.mainloop()

    end



    def updateButton(label, callback, data=false) 	    
        
        @button.configure('text', label)
        @button.configure('command', (proc { emit(callback, data)} ))
        
    end



    def addPoints(pointList) 

        @heading.configure('text',"Step 2: Points added, sorted by y-cord and polar angle")
       
        for i in 0...pointList.length do
            self.show(pointList[i])
        end

    end



    # this method feels ghetto as fuck. Find something more DRY...   
    def drawCheckedPoints(opts)

      # initial thick line
      sleep(1.0/($FPS))
      thick1 = drawLine(opts[:pt1], opts[:pt2], 3, 'red')
      thick2 = drawLine(opts[:pt2], opts[:pt3], 3, 'red')
      @canvas.update

      # thin line to show previously checked segments
      sleep(1.0/($FPS / 5))
      thick1.remove
      thick2.remove
      drawLine(opts[:pt1], opts[:pt2], 1, 'red')
      drawLine(opts[:pt2], opts[:pt3], 1, 'red')
      @canvas.update

    end



    def drawHull(hullBoundry)
  
            @heading.configure('text',"Step 3: Found Convex Hull")
           
            for i in 0...hullBoundry.length-1 do
                drawLine(hullBoundry[i], hullBoundry[i+1], 2, 'blue')
            end

            # td this feels dumb - does ruby have negative array indices similar to python?
            drawLine(hullBoundry[0], hullBoundry[(hullBoundry.length) - 1], 2,  'blue')
              
    end



    def drawLine(pt1,pt2, width, color)
   
        return TkcLine.new(@canvas, pt1.x, pt1.y, pt2.x, pt2.y, 
                    smooth: 'on',  width: width, fill: color)
    
    end



    def show(pt, col ='black')
   
        TkcLine.new(@canvas, pt.x-1, pt.y+1, pt.x+1, pt.y-1, smooth: 'on',  width: 2, fill: col)
        TkcLine.new(@canvas, pt.x-1, pt.y-1, pt.x+1, pt.y+1, smooth: 'on',  width: 2, fill: col)
    
    end



end
