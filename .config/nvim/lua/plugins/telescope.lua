return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local actions = require('telescope.actions')
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                    n = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                }
            }
        })
        vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files)
        vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags)
        vim.keymap.set("n", "<leader>fs", function()
            require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end,
}
