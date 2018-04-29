# Suggestions
Better handling suggestions on `bash`

## Dependencies
[fzf](https://github.com/junegunn/fzf)

This plugin adds binding suggestions to bash in such that it can keep the starting text and/or replace it with a query.

## Installation
Just copy `.suggestions.sh` to your home directory and add `[ -f ~/.suggestions.sh ] && source ~/.suggestions.sh` to your `.bashrc` *after* the line `[ -f ~/.fzf.bash ] && source ~/.fzf.bash` (because this pluggin overrides `fzf`'s `Ctrl-r` default begavior).

## Usage

![usage example](suggestions.gif)

After writing some text you can press `Ctrl-r` or `arrow up`. This will open `fzf` suggestion's box.
The first thing to notice is that `fzf` will start the box with the text that you was writting.

Now three things can happen:

1. press `Esc` (to cancel the search): in this case the suggestion box is closed and you get your initial text back on the terminal
2. select and item from the suggestion box: the item replace your initial text
3. write something that do not exists in the suggestion box but press `Enter`: the whole text you wrote replace the initial one
