Small suite of project management tools (like, really small; 2 files)

`Project' provides a simple means to generate a project dir to work in,
as well as initialize a Git repo for you commit to and give to folks.

`Metrics' allows you to keep track of little things in your code that
you might have a hard time keeping track of otherwise ( or at least,
that I have a hard time keeping track of; LOC, # of classes, etc ).

Really simple to use ( if it isn't, then what's the point? ):

$> project.rb MyApp --git
$> generating ./MyApp
$> initializing Git repo
$> opening in Emacs (ha! not sure how this will play out)

Then we have a metrics gathering facility, which is also simple:

$> metrics.rb ./MyApp
$> 11 Files
$> 968 LOC
$> 738 Comments
$> 23 Classes
$> 121 Methods
$> 3 Modules

More metrics data options to come. I just wanted to get something
that worked up.