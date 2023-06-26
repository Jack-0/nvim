# NVIM

- use :so to apply changes
- use :PackerInstall to install

### lua/default/packer
define packages here

### lua/default/set
vim config options

### lua/default/remap
key mappings

### after/plugin/*
plugin config

### plugin/*
ignore, this is the output dir

### lua/custom/*
custom lua scripts

# tips

- Use :Mason and <C-f> to filter by language

# TODO
- [x] rd, renames definition
- [ ] add definitions to all custom key bindings
- [ ] set all needed keybindings
- [ ] rd, renames definition AND only saves lines that do rename OR saves all?
- [ ] rf, find references using LSP
- [ ] visual mode bind to comment out all selected lines (note JSX)
- [ ] ?any mode line comment with <C-/>
- [ ] in visual mode use <leader>gc to git commit selected lines
- [ ] git pull and push bindings
- [ ] have formatting, use prettier if a config exists else lsp format
- [ ] handle git blame, fugitive has :G blame
- [ ] auto close html tags, maybe even parenthesis etc
- [ ] bind keys for merging
- [ ] handle W, H, E display, maybe intelligent code completion 
- [ ] intelligent code completion
- [ ] use tab/enter to auto complete seems to not work atm
- [ ] find TODO's with plugin or custom script

