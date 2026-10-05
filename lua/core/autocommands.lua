-- Open help files in vertical split
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "wincmd L"
})

-- syntax highlighting for dotenv 
vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup('dotenv_ft', {clear = true}),
  pattern = { ".env", ".env.*"},
  callback = function()
    vim.bo.filetype = "dosini"
  end
})

vim.filetype.add({
  extension = {
    ejs = "ejs",
  }
})

pcall(vim.treesitter.language.register, "html", "ejs")


-- -- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "highlight selection on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 200, visual = true })
	end,
})

-- show cursorline only in active window disable
-- vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
-- 	group = "active_cursorline",
-- 	callback = function()
-- 		vim.opt_local.cursorline = false
-- 	end,
-- })
