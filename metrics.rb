# metrics.rb - Josh Sandlin - 5:17PM - 1/12/2010
# some simple metrics against the project given

project_dir = ARGV.shift
project_dir_contents = Array.new

# Let's get the contents of the project!
if !File.exists? project_dir
  abort "The #{project_dir} directory doesn't exist!"
else
  project_dir_contents = Dir["**/*.rb"]
end

# Let's initialize some metrics!
# - more will be added later
project_files = 0
lines = 0

# Let's gather some data!
project_dir_contents.each do |file|
  project_files += 1
  File.open( file, 'r' ) do |f|
    f.each_line do |line|
      lines += 1
    end
  end
end

# Let's output some metrics!
puts "Metrics of #{project_dir}:"
puts "Files: #{project_files}"
puts "Lines: #{lines}"
