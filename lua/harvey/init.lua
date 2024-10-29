require("harvey.set")
require("harvey.remap")
require("harvey.lazy_init")

-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

-- DO NOT INCLUDE THIS
-- DO.not

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup("ThePrimeagen", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = ThePrimeagenGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("LspAttach", {
	group = ThePrimeagenGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "gi", function()
			vim.lsp.buf.implementation()
		end, opts)
		vim.keymap.set("n", "gr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)

		-- Custom key bindings for removing unused code and fixing linter issues
		vim.keymap.set("n", "<leader>ru", function()
			vim.lsp.buf.code_action({ only = { "source.organizeImports" } })
		end, opts)
		vim.keymap.set("n", "<leader>fl", function()
			vim.lsp.buf.format({ async = true })
		end, opts)

		-- Keybinding to copy the diagnostic of the current line
		vim.keymap.set("n", "<leader>cd", function()
			-- Get diagnostics for the current line in the current buffer
			local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })

			if #diagnostics > 0 then
				-- Join all diagnostics into a single string
				local message = table.concat(
					vim.tbl_map(function(diagnostic)
						return diagnostic.message
					end, diagnostics),
					"\n"
				)

				-- Copy the message to the system clipboard
				vim.fn.setreg("+", message)
				print("Copied diagnostic message to clipboard")
			else
				print("No diagnostics found on this line")
			end
		end, opts)
	end,
})

-- Set transparent background for both active and inactive windows
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	end,
})

vim.api.nvim_create_autocmd("WinLeave", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.mkdp_auto_start = 1 -- Start the preview automatically when opening Markdown files
vim.g.mkdp_auto_close = 1 -- Close the preview when closing the Markdown buffer

-- vim.cmd("set fileformat=unix")
-- vim.cmd("let g:netrw_liststyle = 3")
require("aerial").setup({
	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>ca", "<cmd>AerialToggle!<CR>")

-- Enable true color support
vim.opt.termguicolors = true

-- -- Set the background to dark
-- vim.opt.background = "dark"
--
-- -- Set the colorscheme to 'quiet'
-- vim.cmd("colorscheme quiet")

-- Customize highlights
vim.api.nvim_set_hl(0, "Keyword", { bold = true })
vim.api.nvim_set_hl(0, "Comment", { italic = true })
vim.api.nvim_set_hl(0, "Constant", { fg = "#999999" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#333333" })
