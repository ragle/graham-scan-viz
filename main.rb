#!/usr/bin/ruby

require 'escort'
require 'ap'
require_relative 'lib/VizController'


Escort::App.create do |app|
  
  app.version "0.1"
  app.description "A simple app to help visualize the Graham Scan algorithm for finding convex hulls."

  app.options do |opts|
    opts.opt :fps, "fps", :short => :none, :long => '--fps', :type => :int, :default => 24
    opts.opt :width, "width", :short => '-w', :long => '--width', :type => :int, :default => 1600  
    opts.opt :height, "height", :short => '-h', :long => '--height', :type => :int, :default => 900 
    opts.opt :numpoints, "num_points", :short => '-n', :long => '--num-points', :type => :int, :default => 60
  end

  app.action do |options, arguments|
  
    $FPS = options[:global][:options][:fps]
    $WIDTH = options[:global][:options][:width]
    $HEIGHT = options[:global][:options][:height]
    $NUM_POINTS = options[:global][:options][:numpoints]

    VizController.new

  end

end
