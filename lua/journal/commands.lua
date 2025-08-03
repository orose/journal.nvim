local M = {}
local config = require("journal.config")
local utils = require("journal.utils")

M.daily = function()
	local date_info = utils.get_date_info()
	local month_path = vim.fn.expand(config.options.journal_path .. "/" .. date_info.year .. "/" .. date_info.month)

	utils.ensure_directory(month_path)

	local filename = month_path .. "/" .. date_info.date .. ".md"
	vim.cmd("edit " .. filename)

	utils.insert_template_if_empty("daily")
end

M.weekly = function()
	local date_info = utils.get_date_info()
	local month_path = vim.fn.expand(config.options.journal_path .. "/" .. date_info.year .. "/" .. date_info.month)

	utils.ensure_directory(month_path)

	local filename = month_path .. "/week-" .. date_info.week .. ".md"
	vim.cmd("edit " .. filename)

	utils.insert_template_if_empty("weekly")
end

M.monthly = function()
	local date_info = utils.get_date_info()
	local month_path = vim.fn.expand(config.options.journal_path .. "/" .. date_info.year .. "/" .. date_info.month)

	utils.ensure_directory(month_path)

	local filename = month_path .. "/" .. date_info.month_name .. "-" .. date_info.year .. ".md"
	vim.cmd("edit " .. filename)

	utils.insert_template_if_empty("monthly")
end

M.setup = function()
	-- Opprett kommandoer
	vim.api.nvim_create_user_command("JournalDaily", M.daily, { desc = "Open daily journal entry" })
	vim.api.nvim_create_user_command("JournalWeekly", M.weekly, { desc = "Open weekly journal entry" })
	vim.api.nvim_create_user_command("JournalMonthly", M.monthly, { desc = "Open monthly journal entry" })

	-- Sett opp keymaps
	local keymaps = config.options.keymaps
	if keymaps.daily then
		vim.keymap.set("n", keymaps.daily, ":JournalDaily<CR>", { desc = "Open daily journal" })
	end
	if keymaps.weekly then
		vim.keymap.set("n", keymaps.weekly, ":JournalWeekly<CR>", { desc = "Open weekly journal" })
	end
	if keymaps.monthly then
		vim.keymap.set("n", keymaps.monthly, ":JournalMonthly<CR>", { desc = "Open monthly journal" })
	end
end

return M

-- vim: ts=2 sts=2 sw=2 et
