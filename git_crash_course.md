# Git Crash Course: _Basics on starting with Git and Github_

## What is git?
In short, `git` is a version management software. 
Alone, it provides a Command Line Interface (CLI) for a project
on a single machine;
when paired with github, 
it gains a Graphical User Interface (GUI) and 
allows machines connected to the internet to contribute to the same project.

## How does git work?
Git works by tracking changes (in the form of commits) to a repository.
Every commit can contain additions or deletions of text, files, or directories
along with a commit message;
the commit message is a comment of the changes made.

## Vocabulary and Commands

Below is a list of common terms and their definition.

| Word | Definition |
| :--- | :--- |
| repository | The collection of branches that form a software project.  |
| _local_ repository | The copy of a repository on your working machine. |
| _remote_ repository | The copy of a repository on someone else's machine (includes _github_'s servers). |
| branch | A linear series of ordered commits. Branches can have sub branches and can be merged together. |
| merge  | Combine two branches to form a single new one. |
| commit | A change (addition or deletion) to a file or directory with a comment (commit message). |
| pull | Update your local repository to match the one where you are pulling from. |
| push | Update a remote repository to match your local one. |

The commands below are usable on the command line within any 
initialized git repository; 
the only exception is `git init` (explained below).
All commands are meant to be executed on the same line despite what the below formatting may show.

| Command | Action |
| :--- | :--- |
| `git help` | Shows a brief message on how to use git. |
| `git init` | Initialize a new local git repository. |
| `git add <foo>`  | Add the changes to `<foo>` to the next commit; `<foo>` is any number of files and directories. |
| `git rm <foo>`   | Remove the changes to `<foo>` to the next commit; `<foo>` is any number of files and directories. |
| `git commit`     | Commit the changes (made by `git add` and `git rm`) to the working branch of your local repository. |
| `git fetch`      | Peek at the remote repository but do not update the local one. |
| `git pull`       | Pull changes to your local repository. [Note, a remote repository must be set up first.](https://help.github.com/articles/adding-a-remote/) |
| `git push`       | Push changes from your local repository. [Note, a remote repository must be set up first.](https://help.github.com/articles/adding-a-remote/) |
| `git status`     | Prints the current status of your local repository. |
| `git diff <foo>` | Shows the changes to `<foo>`; `<foo>` is any number of files and directories. |
| `git clone <repo>` | Create a local copy of the remote repository `<repo>`. |
| `git checkout <foo>` | Copy the latest committed version of `<foo>`. Effectively an _undo_ for file and directory changes. |

## Typical Workflow
Below is a typical workflow when working with an already established git repository.
It is assumed that the remote repository is already configured.

First, update the local repository to match the remote.
```
git pull 
```

Make any edits and run tests as needed
```
vim <your files>
./run_test.sh 
./write_thesis.sh
<etc.>
```

Check the current status of the local repository.
```
git status
```

This will likely show that `<your files>` have untracked changes.
See what exactly these changes are:
```
git diff <your files>
```

Add the changes of these files to your next commit.
```
git add <your files>
```

For pedagogy, check the status again.
```
git status
```

This should now show that there are changes to `<your files>` staged
to be committed. 
Commit these changes:
```
git commit
```
You'll be prompted with a vim window where you write your commit message.
Your commit message is a comment on what the changes are.
See [this git wiki](https://github.com/trein/dev-best-practices/wiki/Git-Commit-Best-Practices)
for comments on how to write a good commit message.
A blank commit message will abort the commit.
Quitting from vim after writing (`:wq`) will proceed with the commit.

From here you can either push the changes or continue making edits and committing changes. 
You can push multiple commits at once 
(this is sometimes considered bad practice depending on your software development team).
Once ready, push the commits made to your local repository to the remote one:
```
git push
```

You may be prompted to enter your github username and password at this point.
[Alternatively, you may be prompted to enter your ssh-key password if 
you have enabled ssh keys.](https://help.github.com/articles/connecting-to-github-with-ssh/)
You have now contributed to your repository!

## Exercise
Add your github username to the list below using the above information.
Note, you will need to [clone this repository](https://help.github.com/articles/cloning-a-repository/),
[add the remote repository](https://help.github.com/articles/adding-a-remote/),
and 
[set up ssh keys](https://help.github.com/articles/connecting-to-github-with-ssh/) first.
```
JustinClough

```
