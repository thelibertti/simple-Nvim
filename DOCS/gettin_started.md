<h1>Shortcuts</h1>

:information_source: To make this process easier you first should go into `~/nvim/lua/` and look for the file called `vim-options.lua` and open it and look for the next line of code 
```lua
vim.g.mapleader = " "
```
Inside the semicolons, you can choose any key to serve as your leader key. It's recommended to avoid common keys such as Shift or Control as they may cause conflicts. In my case, I've chosen to use the , comma as the leader key.

**shortcuts for Navigation**
- `Control + b`: this will take you the top of the file
- `Control + f`: this will take you down in the file 
- `Control + Space`: this will move the cursor beetween the lines of your file 
- `Control + e`: this will move you smooty to the bottom of your file

**Shortcuts for lsp**

- `Shift + K`: this will try the documentation of whatever the cursor is on
- `<Leader> + gr`: this will show all the references that the word that is the cursor on has 
- `<leader> + gd`: this will just show all the times that word is in the file


**Shortcuts for neo-tree**

- `Control + n` will open neo-tree
- `<Leader> + bf` will show just the files that you have open

### WORK IN PROGRESSS....
