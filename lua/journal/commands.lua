local M = {}
local config = require("journal.config")
local utils = require("journal.utils")

local entry_types = {
	daily = function(d) return d.date .. ".md" end,
	weekly = function(d) return "week-" .. d.week .. ".md" end,
	monthly = function(d) return d.month_name .. "-" .. d.year .. ".md" end,
}

local function open_entry(entry_type)
	local date_info = utils.get_date_info()
	local month_path = vim.fn.expand(config.options.journal_path .. "/" .. date_info.year .. "/" .. date_info.month)
	utils.ensure_directory(month_path)
	local filename = month_path .. "/" .. entry_types[entry_type](date_info)
	vim.cmd("edit " .. filename)
	utils.insert_template_if_empty(entry_type)
end

M.daily = function() open_entry("daily") end
M.weekly = function() open_entry("weekly") end
M.monthly = function() open_entry("monthly") end

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
