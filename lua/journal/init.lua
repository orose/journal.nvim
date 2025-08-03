local M = {}

local config = require("journal.config")
local commands = require("journal.commands")

M.setup = function(opts)
	config.setup(opts or {})
	commands.setup()
end

return M

-- vim: ts=2 sts=2 sw=2 et
