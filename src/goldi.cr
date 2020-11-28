require "yaml"
require "clim"
require "colorize"

module Goldi
  class Cli < Clim
    main do
      desc "Goldi - tcp and multicast testing tool"
      usage "
      for full instructions see:  https://github.com/perfecto25/goldi
      "
      version "Version 0.1.2"
      option "-f FEED FILE", "--feed=FEED FILE", type: String, desc: "Feed YAML", default: ""
      option "-t TYPE", "--type=TCP or MULTICAST", type: String, desc: "tcp/mcast/all", default: "all"
      
      
      run do |opts, args|

        if opts.feed 
          data = YAML::Any
          abort "Feed file is missing".colorize.fore(:red), 1 if !File.file? opts.feed
          begin
            yaml = File.open(opts.feed) do |file|
              data = YAML.parse(file)
            end
          rescue
            puts "cant open YAML file for reading"
          end
          puts data

          #abort "file is missing", 1 if !File.file? opts.feed
        end
      end # run do
    
    end # main
  end # class Cli


  # check if it exists before opening
  #abort "file is missing", 1 if !File.file? path

  #yaml = File.open(path) do |file|
  #  YAML.parse(file)
  #end

  # TODO: Put your code here
end

Goldi::Cli.start(ARGV)