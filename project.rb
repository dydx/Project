# project.rb - Josh Sandlin - 12:54AM - 1/9/2010
# Script to aid in the generation of a project dir
# as well as starting a git repo.
# Use it as such: project.rb test --git

project_name = ARGV.shift
git_enabled = ARGV.shift

# Create a project dir, chdir into it, and add README (for Git)
print "Creating project dir..."
if !File.directory? project_name
  Dir.mkdir project_name
  Dir.chdir project_name
  File.open( 'README', 'w' ) do |file|
    file.puts "README for the #{project_name} project."
    file.puts ''
    file.puts "This is just a place holder. Add your own content here."
  end
else
  puts "Directory for #{project_name} already exists!"
end
print "Done"

puts ''

print "Creating Git repo..."; puts ''
if git_enabled == '--git'
# Create a nice little Git repo for the project.
  if !File.directory? '.git'
    system( 'git init && git add . && git commit -m "first commit" -a' )
  end
end
print "Done"

puts ''

puts "Finished setting up your project!"
