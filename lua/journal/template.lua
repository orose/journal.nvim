local M = {}
local config = require("journal.config")
local date = require("journal.date")

M.insert_if_empty = function(template_name)
	if vim.fn.line("$") ~= 1 or vim.fn.getline(1) ~= "" then
		return
	end

	local template_path = vim.fn.expand(config.options.templates_path .. "/" .. template_name .. "-template.md")
	vim.cmd("read " .. template_path)

	local date_info = date.get_date_info()
	local placeholders = {
		["{{ date }}"] = date_info.date,
		["{{ week_number }}"] = date_info.week,
		["{{ month }}"] = date_info.month_name,
		["{{ year }}"] = date_info.year,
	}

	for placeholder, value in pairs(placeholders) do
		if vim.fn.search(placeholder, "n") > 0 then
			vim.cmd("%s/" .. placeholder .. "/" .. value .. "/g")
		end
	end

	vim.cmd("normal! gg")
	local line = vim.fn.search("- $", "n")
	if line > 0 then
		vim.cmd("normal! " .. line .. "G$")
	end
end

return M

-- vim: ts=2 sts=2 sw=2 et
