-- Ensure the Lazy.nvim plugin manager is loaded
return {
    {
        -- FZF: The command line fuzzy finder
        "junegunn/fzf",
        -- Run installer for FZF binary
        run = function()
            vim.fn["fzf#install"]()
        end
    },
    {
        -- FZF Vim integration
        "junegunn/fzf.vim",
        config = function()
            return {
                "nvim-telescope/telescope.nvim",

                tag = "0.1.5",

                dependencies = {
                    "nvim-lua/plenary.nvim"
                },

                config = function()
                    vim.cmd("hi Floating guibg=none") -- Sets FZF background to transparent
                    vim.cmd([[
                        let $FZF_DEFAULT_OPTS = '--height 40% --reverse --border --info=inline '.
                        \ '--color fg:#ebdbb2,bg:#1d2021,hl:#d3869b ' .
                        \ '--color fg+:#ebdbb2,bg+:#32302f,hl+:#d3869b ' .
                        \ '--color info:#fabd2f,prompt:#d3869b,pointer:#83a598 ' .
                        \ '--color marker:#fe8019,spinner:#fabd2f,header:#d3869b ' .
                        \ '--preview-window=:wrap'
                        ]])
                    -- You might also configure more specific behaviors if needed
                    -- vim.cmd [[
                    --   let g:fzf_layout = { 'down': '~40%' }
                    --   let g:fzf_preview_window = ['right:50%', 'ctrl-/']
                    -- ]]
                    -- -- Lua function to create a floating window for FZF
                    --
                    -- Set FZF default options
                    -- vim.env.FZF_DEFAULT_OPTS = '--height 40% --reverse --border'
                    vim.cmd [[
                        function! FloatingFZF()
                            let height = float2nr(&lines * 0.9)
                            let width = float2nr(&columns * 0.8)
                            let row = float2nr((&lines - height) / 2)
                            let col = float2nr((&columns - width) / 2)
                            let opts = {
                            \   'relative': 'editor',
                            \   'width': width,
                            \   'height': height,
                            \   'row': row,
                            \   'col': col,
                            \   'style': 'minimal',
                            \   'border': 'rounded'
                            \ }
                            let buf = nvim_create_buf(v:false, v:true)
                            let win = nvim_open_win(buf, v:true, opts)
                            set winhl=Normal:Floating
                            call setwinvar(win, '&winhl', 'NormalFloat:Floating')
                        endfunction
                        ]]

                    -- Set the layout for FZF using the defined function
                    vim.cmd [[ let g:fzf_layout = { 'window': 'call FloatingFZF()' } ]]
                end
            }
        end
    }

}
