graham-scan-viz
===============

![Graham-Scan-Visualization](http://ragle.sanukcode.net/assets/Graham_Scan_Visualization.gif)

###About

A simple command line app written in Ruby to help visualize the [Graham Scan algorithm](http://geomalgorithms.com/a10-_hull-1.html#Graham-Scan) for finding the [convex hull](http://mathworld.wolfram.com/ConvexHull.html) of an object in an ℝ<sup>2</sup> euclidean space. This was an assignment in my undergrad algorithm analysis course.

I wrote this last year. I had been meaning to teach myself Ruby, and this was my very first project with the language. This will be immediately obvious if you read the code (do yourself a favor: don't). The value here for others is in running the app and using the visualization to help "see" how the algorithm works - not in the implementation of the algorithm itself.    

For detailed information about Graham's scan and its geometric underpinnings, chapter 33 of [CLRS](http://mitpress.mit.edu/books/introduction-algorithms) provides a thorough treatment.

###Usage

```
NAME
    main.rb -                                                                                                                                                                                                       

    A simple app to help visualize the Graham Scan algorithm for finding convex hulls.

USAGE
    main.rb [options] [arguments]

VERSION
    0.1

OPTIONS
    --fps <i>                 - fps (default: 24)                                                                                                                                                                   
    --width -w <i>            - width (default: 1600)                                                                                                                                                               
    --height -h <i>           - height (default: 900)                                                                                                                                                               
    --num-points -n <i>       - num_points (default: 60)                                                                                                                                                            
    --verbosity <s>           - Verbosity level of output for current execution (e.g. INFO, DEBUG) (default: WARN)                                                                                                  
    --error-output-format <s> - The format to use when outputting errors (e.g. basic, advanced) (default: basic)                                                                                                    
    --version -v              - Print version and exit                                                                                                                                                              
    --help -e                 - Show this message
```

###Installation

```bash
$ git clone git@github.com:ragle/graham-scan-viz.git

$ cd graham-scan-viz

$ gem install escort ap 

```

[Install Ruby/TK](http://www.tkdocs.com/tutorial/install.html). I'm sorry.


###To do

*  Write GAL to remove tcl/TK as a strict dependency, allow for something like shoes or any other library / gem that is easy to install
*  Create issues for bad code / sloppy decisions. Fix them.
*  Write an explanatory blog post about Graham's scan and convex hulls in general

