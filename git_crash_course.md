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

| Command | Action |
| :--- | :--- |
| `git init` | Initialize a new local git repository. |
| `git add <foo>`  | Add the changes to `<foo>` to the next commit; `<foo>` is any number of files and directories. |
| `git rm <foo>`   | Remove the changes to `<foo>` to the next commit; `<foo>` is any number of files and directories. |
| `git commit`     | Commit the changes (made by `git add` and `git rm`) to the working branch of your local repository. |
| `git pull`       | Pull changes to your local repository. [Note, a remote repository must be set up first.](https://help.github.com/articles/adding-a-remote/) |
| `git push`       | Push changes from your local repository. [Note, a remote repository must be set up first.](https://help.github.com/articles/adding-a-remote/) |
| `git status`     | Prints the current status of your local repository. |
| `git diff <foo>` | Shows the changes to `<foo>`; `<foo>` is any number of files and directories. |
| `git clone <repo>` | Create a local copy of the remote repository `<repo>`. |

## Typical Workflow

