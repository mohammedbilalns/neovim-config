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

local autosave_timer = nil

local function clear_cmdarea()
  vim.defer_fn(function()
    vim.api.nvim_echo({}, false, {})
  end, 800)
end

local function autosave()
  if vim.bo.buftype == ""
    and #vim.api.nvim_buf_get_name(0) ~= 0
    and vim.bo.buflisted
    and vim.bo.modifiable
    and vim.bo.modified
    and not vim.bo.readonly then
    vim.cmd "silent w"

    local time = os.date "%I:%M %p"
    vim.api.nvim_echo({ { "󰄳", "LazyProgressDone" }, { " file autosaved at " .. time } }, false, {})
    clear_cmdarea()
  end
end

vim.api.nvim_create_autocmd("TextChanged", {
  callback = function()
    if autosave_timer and not autosave_timer:is_closing() then
      autosave_timer:close()
    end
    autosave_timer = vim.defer_fn(autosave, 2000)
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  nested = true,
  callback = autosave,
})

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
