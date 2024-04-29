return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = '0.1.x',
        dependencies = {
            {
                { 'nvim-lua/plenary.nvim' },
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make', --'MinGW32-make' -- 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'nvim-tree/nvim-web-devicons' },
        },
        opts = {
            defaults = {
                color_devicons = true,
                file_ignore_patterns = { "node_modules" }
            },
            pickers = {
                find_files = {
                    find_command    = {
                        "fd",
                        '--hidden',
                        '--no-ignore-vcs',
                        '--exclude',
                        'node_modules',
                        '--exclude',
                        '.git/*',
                        '--type',
                        'f',
                    },
                    -- theme = 'dropdown',
                    layout_strategy = 'vertical',

                    -- sorting_strategy = 'ascending', -- behavies wierd
                    sorting_strategy = 'descending',
                    selection_strategy = 'reset',

                    layout_config = {
                        prompt_position = 'top',

                        width          = .7,
                        height         = .9,
                        preview_height = .6
                    },
                }
            },
        },
        config = function(_, opts)
            local telescope = require("telescope")

            opts = vim.tbl_deep_extend("force", {
                extensions = {
                    ["ui-select"] = { require("telescope.themes").get_dropdown {} },
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                    }
                }
            }, opts)

            telescope.setup(opts)

            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")
        end,
        keys = {
            { '<leader>sf',  function() require('telescope.builtin').find_files {} end,  { desc = '[S]earch [F]iles' } },
            { '<leader>sb',  function() require('telescope.builtin').buffers {} end,     { desc = '[S]earch [B]uffers' } },
            { '<leader>sh',  function() require('telescope.builtin').help_tags {} end,   { desc = '[S]earch [H]elp' } },
            { '<leader>sk',  function() require('telescope.builtin').keymaps {} end,     { desc = '[S]earch [K]eymaps' } },
            { '<leader>sw',  function() require('telescope.builtin').grep_string {} end, { desc = '[S]earch [T]ext by current [W]ord' } },
            { '<leader>sg',  function() require('telescope.builtin').live_grep {} end,   { desc = '[S]earch [T]ext by [G]rep' } },
            { '<leader>sts', function() require('telescope.builtin').treesitter {} end,  { desc = '[S]earch [T]reesitter [S]ymbols' } },
            { "<leader>gb",  function() require('telescope.builtin').git_branches {} end },
            { "<leader>gs",  function() require('telescope.builtin').git_status {} end },
            { '<leader>gf',  function() require('telescope.builtin').git_files {} end,   { desc = '[S]earch [G]it [F]iles' } },
            { '<leader>sx',  function() require('telescope.builtin').diagnostics {} end, { desc = '[S]earch [D]iagnostics' } }
        }
    }
}
