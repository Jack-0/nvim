# Neovim

👷‍♂️📈 _Neovim configuration_

## Install

1. clone repo
2. symbolic link
   - `ln -s ~/<clone_location>/nvim .config/nvim`

## Help

- use :Lazy for package manager
- use :checkhealth, then ensure you install missing packages with your OS's package manager
- use :Mason and <C-f> to filter by language
- ensure **new languages** are added to [plugin/lsp.lua](plugin/lsp.lua) server list and optionally [plugin/tree-sitter.lua](plugin/tree-sitter.lua) ensure installed list

# Files

## lua/custom/\*

custom lua scripts

# Issues
- include issues with c++ use `cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON` with cmake
