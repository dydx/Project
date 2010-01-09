Small suite of project management tools (like, really small; 2 files)

`Project' provides a simple means to generate a project dir to work in,
as well as initialize a Git repo for you commit to and give to folks.

`Metrics' allows you to keep track of little things in your code that
you might have a hard time keeping track of otherwise ( or at least,
that I have a hard time keeping track of; LOC, # of classes, etc ).

Really simple to use ( if it isn't, then what's the point? ):

$> project.rb MyApp --git
>> - generating ./MyApp
>> - initializing Git repo
>> - opening in Emacs (ha! not sure how this will play out)

after a good bit of hacking

$> metrics.rb ./MyApp --git
>> - 2 Languages
>> - 11 Files
>> - 968 LOC
>> - 738 Comments
>> - 23 Classes
>> - 121 Class Methods
>> - 1384 Git Commits
>> - Date of First Commit: 1/9/2010
>> - Date of Last Commit: 1/9/2010
>> - Most Edited File: core_utils.rb (148 times)

In both of these, the `--git' flag tells it to use Git. All of my
stuff is stored in Git, but other's might not be. I don't know any
SCM software all that well (basic working view of Git is all I have),
so support for stuff like SVN or Bazaar probably wont come from me.