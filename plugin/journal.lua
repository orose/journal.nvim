if vim.g.loaded_journal then
	return
end
vim.g.loaded_journal = true

vim.schedule(function()
	if not vim.g.journal_manual_setup then
		require("journal").setup()
	end
end)
