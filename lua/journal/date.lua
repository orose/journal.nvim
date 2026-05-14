local M = {}
local config = require("journal.config")

M.get_date_info = function()
	return {
		date = os.date(config.options.date_format),
		month = os.date(config.options.month_format):lower(),
		year = os.date("%Y"),
		week = os.date("%W"),
		month_name = os.date("%B"):lower(),
	}
end

M.ensure_directory = function(path)
	if config.options.auto_create_dirs then
		vim.fn.mkdir(vim.fn.expand(path), "p")
	end
end

return M

-- vim: ts=2 sts=2 sw=2 et
