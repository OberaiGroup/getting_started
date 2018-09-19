## Sets enviroment variables on login

# Set default editor to be vim.
export EDITOR=vim

# Make below variables accessable in the environment.
# Useful for debugging linking/compiling errors.
export PATH
export LD_LIBRARY_PATH
export LIBRARY_PATH

# By default, most .bashrc files only look 
# for this .bash_profile file.
# Also want to load in aliases from the
# .bash_aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
