# Vim Crash Course 
_An ambiguous and incomplete list of neat Vim features_

Below are comments on useful Vim tools and features.
It is assumed that the user is in `Normal Mode` when 
issuing all below commands.
The ___most___ important command to know is `:help`
which presents Vim's inbuilt help manual.

## Navigation
Use the letters `hjkl` to navigate your cursor one character at a time
through your file.
```
   k
  h l
   j
```
Fun fact: Vi is older than the arrow keys!
This is why these letters were originally used;
they are _still_ used because they are on the _home row_ of 
a traditional QWERTY-style keyboard.

## Searching:
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
  For example `/ab.*cd` find all string which begin with `ab` and end with `cd`.

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



## Below are a list of topics to be completed:
 - File navigation
 - Multiple file instances
 - Shell interactivity
 - Basic editing
 - Advanced editing
 - words and WORDS
 - Sessions
 - Spelling
 - Autocompletion
 - Buffers
 - Visual Mode
 - Incremental Counting (++/--)
 - Ditto
 - Order of operations ( vim <())
