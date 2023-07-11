# NVIM

- use :so to apply changes
- use :PackerInstall to install
- use :checkhealth, then ensure you install missing packages with your OS's package manager

### lua/custom/*
custom lua scripts

# tips
- test
- Use :Mason and <C-f> to filter by language

# TODO
- [x] rd, renames definition
- [x] add definitions to all custom key bindings
- [ ] set LSP keybinding
- [ ] rf, find references using LSP
- [x] rd, renames definition AND saves all
- [x] visual mode bind to comment out all selected lines (note JSX)
- [x] ?any mode line comment with <C-/> ... use <leader>gc / <leader>g-b 
- [ ] in visual mode use <leader>gc to git commit selected lines... maybe this is done with Gdiff
- [ ] git pull and push bindings
- [ ] have formatting, use prettier if a config exists else lsp format
- [x] handle git blame <leader>b
- [x] auto close html tags, maybe even parenthesis etc
- [ ] bind keys for merging
- [ ] handle W, H, E display, maybe intelligent code completion 
- [ ] intelligent code completion? coc?
- [ ] use tab/enter to auto complete seems to not work atm
- [ ] find TODO's with plugin or custom script
