# Vim Crash Course: _An ambiguous and incomplete list of neat Vim features_

Below are comments on useful Vim tools and features.
It is assumed that the user is in `Normal Mode` when 
issuing all below commands.
The ___most___ important command to know is `:help`
which presents Vim's inbuilt help manual.

## Basic Navigation
Use the letters `hjkl` to navigate your cursor one character at a time
through your file. 
In order, 
`h` is right, 
`j` is down, 
`k` is up, and
`l` is right.
Graphically:
```
   k
  h l
   j
```
Fun fact: Vi is older than the arrow keys!
This is why these letters were originally used;
they are _still_ used because they are on the _home row_ of 
a traditional QWERTY-style keyboard.

## Basic Editing
There are many ways to edit a file with Vim;
those which enter and leave you in `Insert Mode` are discussed here.
Read the _Advanced Editing_ section for more.
To leave `Normal Mode` and enter `Insert Mode`
to insert text at the start of your cursor, use `i`;
use `a` to append text after the location of your cursor.

You can use `I` to insert text in front of 
the first non-white space character of your current line.
Likewise, `A` will append text to the end of your current line.

Use `o` to enter text into a new line below the current;
use `O` (capital) to do so for a line above the current.

## Searching
For the scope of this write up, a _string_ is an 
ordered collection of atoms;
an _atom_ is any traditional character along with other, typically unseen, 
line items. 
Some examples of atoms are letters, single-digit numbers, 
spaces, punctuation, and tabs.

Some, but not all string can form _words_ and or _WORDS_.
Definitions of _words_ and _WORDS_ are given later.

Strings can be searched for within an open file.
- Search for `foo` from current position downward with `/foo`
  Note that this will also find the `foo` in `football`.
- Search for `bar` from current position upward with `?bar`
  + Go to the next match with `n`
  + Go to the previous match with `N`

Strings are made of atoms
- The `.` acts as an atomic wild card. 
  It can expand to be any atom.
  For example `/ba.` finds `baa`, `bab`, ..., `baZ`, `ba0`, `ba1`, and so on.
- The `*` acts as an atomic multiplier. 
  It matches with zero or more of the preceding atom.
  Note this behavior differs from the typical bash command line wild card definition.
  For example `/abc*` finds `ab`, `abc`, `abcc`, `abccc`, and so on. 
- Putting together the atomic wild card and atomic multiplier yield a traditional wild card.
  For example `/ab.*cd` find all strings which begin with `ab` and end with `cd`.

## Replacing
The general syntax to search for `foo` and replace with `bar` is
`:<range>s/foo/bar/<flags>`.
Note only the first instance of `foo` on each line will be replaced with `bar`.
See below on `<flags>` to change this behavior.

The prefix `<range>` is the scope of the search. 
Use `%` for the current file.
Use `<line>, <line>` to search between two line numbers.
For example `: 8,10 s/foo/bar` will search for `foo`
and replace with `bar` only between lines 8 and 10.
Use _Visual Mode_ to define ranges with atomic precision.

The `<flags>` to know are `g` and `c`.
The `g` flag is `global` and replaces __all__ matches on a line.
The `c` flag asks for `confirmation`; 
at each match, Vim will ask you how to proceed.

## Directories
There are two directories to know of when editing a file with Vim.
The first is Vim's working directory; 
this is where `vim` was called.
The second is a file's directory; 
this is where a file is.
Example given, if your current directory is `/your/path/`
and at the shell command line you type:
```
vim ../example.txt
```
Then Vim's working directory is `/your/path/`
but your file's directory is `/your/`.
Vim uses its working directory when needed for command evaluation.
Following the above example `:e .` within Vim would 
edit `/your/path/`, not `/your/`.

## Advanced Navigation
In addition to moving one character at a time with `h,j,k,l`, 
you can move your cursor with much larger jumps.

The simplest step is multiplicity.
Any of `h,j,k,l` can be preceded by a number
which has the meaning of using that key that number of times.
E.g., `8j` will go down 8 lines.
You can move forward an entire _word_ with `w`
and backward with `b`.
These also work with multiplicity;
`4w` will put you forward 4 _words_.

Use `G` to go to the last line of the file; 
`gg` will take you to the start of a file.
You may also directly state the line you want to move to 
using `:<line_number>`.
For example, `:19` will take you to line number 19.

Using `H` will take you to the first line of the file
that is showing in your current window; 
`L` will take you to the last. 
A way to remember these are `H`ome and `L`ast.
Both of these commands will take you to the first 
non-white space character on that line.
Within any line, you can go to the first character 
with `0` and the end of the line with `$`.

## Sessions
When you start `vim` you start a session.
Within a session, Vim does various things 
behind the scenes; Vim...
 - records undo trees for each file,
 - stores a buffer of accessed files,
 - populates a list of keywords for autocompletion,
 - and many other things.

For these reasons, you may want to _save_ a session.
Do so with `:mksession <name>.vim` to save 
you session to disk with name `<name>.vim`.
To load a session at the command line, use
`vim -S <name>.vim`.
You can overwrite old session saves to updated
them with `:mks!`.

## Shell Interactivity
You are able to work with the shell in two ways with Vim.
Different options are better suited to different tasks.

The first is to spawn a subshell; do so with `:sh`.
This will create a new shell within the one hosting 
your Vim session in Vim's working directory.
This will have all the environment variables as
the original shell but none of the jobs.
A way to check if you in a subshell is to check the
shell environment variable `SHLVL` (shell-level)
by using `echo $SHLVL` at the command line.
To leave this subshell and return to Vim,
simply use `exit`.

The second way is to pass commands to the original shell.
Pass `<command>` to the shell with `:!<command>`.
This will stop your `vim` process, 
run `<command>` and display the output.
Hitting the `Enter` key will return you to
your `vim` session.

## Working With Multiple Files
There are a few ways to work with multiple files based on your needs.
Two basic concepts are splitting the screen and adding new tabs.
Split the screen horizontally with `<filename>` 
with `:sp <filename>`
or vertically with `:vsp <filename>`;
omitting `<filename>` will split the current working file.

A quick way to open multiple files from the command line is
`vim -o <file1> <file2> .... <file_N>`
which will open all given files with horizontal splits.
Use a capital `-O` flag for vertical splits.

The second way is to add new tabs to your session.
_Tabs_ here have the same meaning as the tabs in a typical web browser.
Use `:tabnew <filename>` to create a new tab viewing
`<filename>`. 
Omitting `<filename>` here will open a new tab
on a blank and nameless file;
this can be helpful to use as a scratch space.
Navigate through tabs with `:tabn` and `:tabp`
to go to the next and previous tabs, respectively.
Jump directly to the _Nth_ tab with `<N>gt`;
e.g., `3gt` will go to the 3rd tab.
Once done, close a tab with `:tabc`.

Buffers are another way to work with multiple files;
these are discussed in the _Buffers_ section.



## Below are a list of topics to be completed:
 - Basic editing
 - Advanced editing
 - words and WORDS
 - Paragraphs
 - Spelling
 - Autocompletion
 - Buffers
 - Visual Mode
 - Incremental Counting (++/--)
 - Ditto
 - Order of operations ( vim <())
 - Screen positioning
 - Code Folding
 - Marks
 - `view`
 - Undo, Redo, and trees
