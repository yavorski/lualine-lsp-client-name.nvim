# Lualine LSP Client Names

Display `LSP` client name in `lualine`

## Configuration

```lua
Lazy.use {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  priority = 512,
  dependencies = {
    { "yavorski/lsp-progress.nvim", config = true }, -- display lsp progress
    { "yavorski/lualine-lsp-client-name.nvim", config = true }, -- display lsp client name
    { "yavorski/lualine-macro-recording.nvim", config = true }, -- display macro recording
  },
  opts = function()
    local catppuccin = Dark.lualine()

    return {
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename", "filesize", "lsp_progress", "macro_recording", "%S" },
        lualine_x = { "selectioncount", "searchcount", "lsp_client_name", "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
      }
    }
  end,
  config = function(plugin, options)
    require("lualine").setup(options)
  end
}
```
