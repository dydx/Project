# project.rb - Josh Sandlin - 7:55PM - 1/12/2010
# Version 2 of Project
# changelog: consolidated files into one and 
# added a flag option for either making a project
# or getting metrics of a project.

action = ARGV.shift      # -create / -metrics
project_dir = ARGV.shift # MyApp 
git_enabled = ARGV.shift # --git

# Just some basic input validation against weird stuff
if action == '-metrics' and git_enabled == '--git'
  abort "That isn't an option at this time! Try again please!"
end

# iterates over contents of a project and gathers
# some data about it as a whole.
def parse_metrics( project_dir )
  if !File.exists? project_dir
    abort "The #{project_dir} directory doesn't exist!"
  else
    project_dir_contents = Dir["#{project_dir}/**/*.rb"]
    if project_dir_contents.size == 0
      abort "The project #{project_dir} was empty! No metrics could be generated!"
    end
  end

  # There should be a better way of handling this
  # perhaps a tuple of ( var_name, regex, accum )
  project_files = 0
  project_lines = 0
  project_comments = 0
  project_classes = 0
  project_methods = 0
  project_modules = 0
  project_mixins = 0

  project_dir_contents.each do |file|
    project_files += 1
    File.open( file, 'r' ) do |f|
      f.each_line do |line|
        project_lines += 1
        if line.match( /^\s*#+/ )
          project_comments += 1
        end
        if line.match( /^\s*class/ )
          project_classes += 1
        end
        if line.match( /^\s*module/ )
          project_modules += 1
        end
        if line.match( /^\s*def/ )
          project_methods += 1
        end
        if line.match( /^\s*include/ )
          project_mixins += 1
        end
      end
    end
  end

  puts "Metrics of #{project_dir}:"
  puts "Files: #{project_files}"
  puts "Lines: #{project_lines}"
  puts "Comments: #{project_comments}"
  puts "Classes: #{project_classes}"
  puts "Modules: #{project_modules}"
  puts "Mixins: #{project_mixins}"
  puts "Methods: #{project_methods}"

end

# creates a project based on the given name
# and optionally creates a Git repo for it
def create_project( project_dir, git_enabled )
  if !File.directory? project_dir
    print "Creating project dir..."
    Dir.mkdir project_dir
    Dir.chdir project_dir
    File.open( 'README', 'w' ) do |file|
      file.puts "README for the #{project_dir} project."
      file.puts ''
      file.puts "This is just a place holder. Add your own content here."
    end
    print "Done"
  else
    puts "Directory for #{project_name} already exists!"
  end

  puts ''

  if git_enabled == '--git'
    puts "Creating Git repo..."
    if !File.directory? '.git'
      system( 'git init && git add . && git commit -m "first commit" -a' )
    end
    puts "Done"
  end

  puts ''
  
  puts "Finished setting up your project!"
end

# decides what to do
if action == '-metrics'
  parse_metrics( project_dir )
elsif action == '-create'
  create_project( project_dir, git_enabled )
end
