return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "BufWinEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- set to 'tabs' to only show tabpages instead
        numbers = "none", -- ordinal, buffer_id, both
        close_command = "bdelete! %d",
        right_mouse_command = "vertical sbuffer %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = "bdelete! %d",
        indicator = {
          icon = "▎",
          style = "none", --icon, underline, none
        },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
          -- remove extension from markdown files
          if buf.name:match("%.md") then
            return vim.fn.fnamemodify(buf.name, ":t:r")
          end
        end,
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 20,
        diagnostics = false, -- "nvim_lsp" | "coc"
        diagnostics_update_in_insert = false,
        offsets = {
          { filetype = "NvimTree", text = " File Explorer", text_align = "center", separator = true },
        },
        color_icons = true,
        --[[ get_element_icon = function(element)
          -- element consists of {filetype: string, path: string, extension: string, directory: string}
          -- This can be used to change how bufferline fetches the icon
          -- for an element e.g. a buffer or a tab.
          -- e.g.
          local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(opts.filetype, { default = false })
          return icon, hl
        end, ]]
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin", -- "slant" | "padded_slant" | "slope" | "thick" | "thin" | or custom characters {'|', '|'}
        enforce_regular_tabs = true,
        always_show_bufferline = false,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
      },
      highlights = {
        close_button = {
          fg = "#f38ba8",
        },
        close_button_visible = {
          fg = "#f38ba8",
        },
        close_button_selected = {
          fg = "#f38ba8",
        },
        buffer_selected = {
          bold = true,
          italic = false,
        },
      },
    })

    -- Bufferline mappings --
    local opts = { noremap = true, silent = true }
    -- Move to previous/next
    vim.keymap.set("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>", opts)
    vim.keymap.set("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>", opts)
    -- Re-order to previous/next
    vim.keymap.set("n", "<A-<>", "<Cmd>BufferLineCyclePrev<CR>", opts)
    vim.keymap.set("n", "<A->>", "<Cmd>BufferLineCycleNext<CR>", opts)
    -- Goto buffer in position...
    vim.keymap.set("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
    vim.keymap.set("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
    vim.keymap.set("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
    vim.keymap.set("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
    vim.keymap.set("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
    vim.keymap.set("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
    vim.keymap.set("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
    vim.keymap.set("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
    vim.keymap.set("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
    vim.keymap.set("n", "<A-0>", "<Cmd>BufferLineGoToBuffer -1<CR>", opts)
    -- Close buffer
    vim.keymap.set("n", "<A-c>", "<Cmd>:bdelete<CR>", opts)
  end,
}
