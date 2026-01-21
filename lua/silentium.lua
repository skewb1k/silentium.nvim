local M = {}

--- Accent colors
M.accents = {
	red = "#E85A4F",
	orange = "#FF8E29",
	peach = "#FFB07C",
	yellow = "#F6CE4E",
	lime = "#9ACD5A",
	green = "#5FB36A",
	cyan = "#64B8B4",
	blue = "#5B82C7",
	violet = "#A998F0",
	pink = "#E57AA4",
}

--- @class Colors
M.colors = {
	accent = M.accents.yellow,
	white = "#E6E6E6",
	light_gray = "#A6A6A6",
	gray = "#737373",
	dark_gray = "#282828",
	dark = "#141414",
	diff_add = "#273C29",
	diff_change = "#4D4322",
	diff_delete = "#492523",
	diff_text = "#857131",
}

--- Convenience `vim.api.nvim_set_hl()` wrapper
--- @param name string
--- @param val vim.api.keyset.highlight
local function hl(name, val)
	vim.api.nvim_set_hl(0, name, val)
end

function M.colorscheme()
	vim.o.background = "dark"
	vim.g.colors_name = "silentium"
	vim.cmd.highlight("clear")
	if vim.fn.has("syntax_on") then
		vim.cmd.syntax("reset")
	end

	hl("Normal", { bg = M.colors.dark, fg = M.colors.white })
	hl("NormalFloat", { bg = M.colors.dark_gray, fg = M.colors.white })
	hl("NonText", { fg = M.colors.gray })
	hl("Visual", { bg = M.colors.dark_gray })
	hl("Folded", { bg = M.colors.dark_gray, fg = M.colors.gray })
	hl("SignColumn", { fg = M.colors.light_gray })
	hl("SpellBad", { undercurl = true, sp = M.accents.red })
	hl("SpellCap", { undercurl = true, sp = M.accents.yellow })
	hl("SpellLocal", { undercurl = true, sp = M.accents.green })
	hl("SpellRare", { undercurl = true, sp = M.accents.blue })
	hl("ErrorMsg", { fg = M.accents.red })
	hl("WarningMsg", { fg = M.accents.yellow })
	hl("OkMsg", { fg = M.accents.green })
	hl("CursorLine", { bg = M.colors.dark_gray })
	hl("CursorColumn", { bg = M.colors.dark_gray })
	hl("LineNr", { fg = M.colors.light_gray })
	hl("LineNrBelow", { fg = M.colors.gray })
	hl("StatusLine", { bg = M.colors.accent, fg = M.colors.dark })
	hl("StatusLineNC", { bg = M.colors.accent, fg = M.colors.dark })
	hl("WinSeparator", { fg = M.colors.gray })
	hl("WinBar", { bg = M.colors.accent, fg = M.colors.dark })
	hl("WinBarNC", { bg = M.colors.accent, fg = M.colors.dark })
	hl("Pmenu", { bg = M.colors.dark_gray })
	hl("PmenuSel", { bg = M.colors.accent, fg = M.colors.dark })
	hl("PmenuMatch", { fg = M.colors.accent })
	hl("PmenuMatchSel", { fg = M.colors.dark })
	hl("PmenuThumb", { bg = M.colors.gray })
	hl("Directory", { fg = M.colors.accent })
	hl("ModeMsg", { fg = M.accents.green })
	hl("MoreMsg", { fg = M.accents.blue })
	hl("DiagnosticError", { fg = M.accents.red })
	hl("DiagnosticWarn", { fg = M.accents.yellow })
	hl("DiagnosticInfo", { fg = M.accents.cyan })
	hl("DiagnosticHint", { fg = M.accents.blue })
	hl("DiagnosticOk", { fg = M.accents.green })
	hl("DiffAdd", { bg = M.colors.diff_add })
	hl("DiffChange", { bg = M.colors.diff_change })
	hl("DiffDelete", { bg = M.colors.diff_delete })
	hl("DiffText", { bg = M.colors.diff_text })
	-- Syntax
	hl("Comment", { fg = M.colors.gray })
	hl("Function", { fg = M.colors.white })
	hl("Identifier", { fg = M.colors.white })
	hl("Keyword", { fg = M.colors.accent })
	hl("Special", { fg = M.colors.white })
	hl("String", { fg = M.colors.light_gray })
	-- Tree-sitter
	hl("@constant.html", { fg = M.colors.light_gray })
	hl("@string.escape", { fg = M.colors.white })
	hl("@tag", { fg = M.colors.accent })
	hl("@tag.attribute", { fg = M.colors.white })
	hl("@tag.delimiter", { fg = M.colors.white })
	-- Plugins
	-- NeoTree
	hl("NeoTreeDirectoryIcon", { fg = M.colors.white })
	hl("NeoTreeDirectoryName", { fg = M.colors.white })
	hl("NeoTreeGitAdded", { fg = M.colors.accent })
	hl("NeoTreeGitUntracked", { fg = M.colors.accent })
	hl("NeoTreeGitModified", { fg = M.colors.accent })
	hl("NeoTreeGitIgnored", { fg = M.colors.gray })
end

--- Configure colorscheme
--- @param colors? Colors
function M.setup(colors)
	if colors ~= nil then
		M.colors = vim.tbl_extend("force", M.colors, colors)
	end
end

return M
