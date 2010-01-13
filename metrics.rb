# metrics.rb - Josh Sandlin - 5:17PM - 1/12/2010
# some simple metrics against the project given

project_dir = ARGV.shift
project_dir_contents = Array.new

# Let's get the contents of the project!
if !File.exists? project_dir
  abort "The #{project_dir} directory doesn't exist!"
else
  project_dir_contents = Dir["#{project_dir}/**/*.rb"]
  if project_dir_contents.size == 0
    abort "The #{project_dir} was empty! No metrics to calculate!"
  end
end

# Let's initialize some metrics!
# - more will be added later
project_files = 0
project_lines = 0
project_comments = 0
project_classes = 0
project_methods = 0
project_modules = 0

# DEBUG
p project_dir_contents
# END-DEBUG

# Let's gather some data!
project_dir_contents.each do |file|
  project_files += 1
  File.open( file, 'r' ) do |f|
    f.each_line do |line|
      project_lines += 1
      # match a comment
      if line.match( /^#+/ )
        project_comments += 1
      end
      # match a class definition
      if line.match( /^\s*class/ )
        project_classes += 1
      end
      # match a function definition
      if line.match( /^\s*def/ )
        project_methods += 1
      end
      # match a module definition
      if line.match( /^\s*module/ )
        project_modules += 1
      end
    end
  end
end

# Let's output some metrics!
puts "Metrics of #{project_dir}:"
puts "Files: #{project_files}"
puts "Lines: #{project_lines}"
puts "Comments: #{project_comments}"
puts "Classes: #{project_classes}"
puts "Modules: #{project_modules}"
puts "Methods: #{project_methods}"
