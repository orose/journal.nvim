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

M.insert_template_if_empty = function(template_name)
	if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
		local template_path = vim.fn.expand(config.options.templates_path .. "/" .. template_name .. "-template.md")
		vim.cmd("read " .. template_path)

		-- Erstatt kun placeholders som faktisk eksisterer
		local date_info = M.get_date_info()

		-- Sjekk og erstatt kun hvis placeholder eksisterer
		if vim.fn.search("{{ date }}", "n") > 0 then
			vim.cmd("%s/{{ date }}/" .. date_info.date .. "/g")
		end
		if vim.fn.search("{{ week_number }}", "n") > 0 then
			vim.cmd("%s/{{ week_number }}/" .. date_info.week .. "/g")
		end
		if vim.fn.search("{{ month }}", "n") > 0 then
			vim.cmd("%s/{{ month }}/" .. date_info.month_name .. "/g")
		end
		if vim.fn.search("{{ year }}", "n") > 0 then
			vim.cmd("%s/{{ year }}/" .. date_info.year .. "/g")
		end

		-- Flytt cursor til første punkt
		vim.cmd("normal! gg")
		local line = vim.fn.search("- $", "n")
		if line > 0 then
			vim.cmd("normal! " .. line .. "G$")
		end
	end
end

return M

-- vim: ts=2 sts=2 sw=2 et
