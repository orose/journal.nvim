local M = {}

M.defaults = {
	journal_path = "~/git/journal",
	templates_path = "~/git/journal/templates",
	date_format = "%Y-%m-%d",
	month_format = "%m-%B",
	auto_create_dirs = true,
	keymaps = {
		daily = "<leader>td",
		weekly = "<leader>tw",
		monthly = "<leader>tm",
	},
}

M.options = {}

M.setup = function(opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

return M

-- vim: ts=2 sts=2 sw=2 et
