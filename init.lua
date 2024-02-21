--- [[  IMPATIENT FIRST  ]]
vim.loader.enable()

--- [[  EARLY MAPS  ]]
vim.g.mapleader = " "

--- [[  BASICS && PLUGINS && KEYMAPS  ]]
require("sbbddz.set")
require("sbbddz.maps")
require("sbbddz.lazy")
require("sbbddz.custom")
