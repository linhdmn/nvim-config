
local local_plugins = {
    {
        "ThePrimeagen/harpoon",
        -- dir = "~/personal/harpoon",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

            -- local harpoon = require("harpoon")
            -- harpoon:setup()
            --
            -- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            -- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            --
            -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
            -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
            -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
            -- vim.keymap.set("n", "<leader><C-h>", function() harpoon:list():replace_at(1) end)
            -- vim.keymap.set("n", "<leader><C-t>", function() harpoon:list():replace_at(2) end)
            -- vim.keymap.set("n", "<leader><C-n>", function() harpoon:list():replace_at(3) end)
            -- vim.keymap.set("n", "<leader><C-s>", function() harpoon:list():replace_at(4) end)
        end
    },
    {
        "ThePrimeagen/vim-apm",
        -- dir = "~/personal/vim-apm",
        config = function()
            --[[
            local apm = require("vim-apm")

            apm:setup({})
            vim.keymap.set("n", "<leader>apm", function() apm:toggle_monitor() end)
            --]]
        end
    },
    {
        "ThePrimeagen/vim-with-me",
        -- dir = "~/personal/vim-with-me",
        config = function() end
    },
}

return local_plugins

