# Lualine LSP Clients

Display `LSP` clients in `lualine`

## Configuration

With [lazy](https://github.com/folke/lazy.nvim)

```lua
{
  "nvim-lualine/lualine.nvim",
  dependencies = {
    -- display lsp clients in lualine
    { "yavorski/lualine-lsp-client-name.nvim" }, 
  },
  opts = {
    -- add to section of your choice
    sections = {
      lualine_x = { "lsp_client_name" },
    }
  }
}
```

## Screenshot
