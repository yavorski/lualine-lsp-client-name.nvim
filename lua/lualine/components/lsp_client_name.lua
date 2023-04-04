local M = require("lualine.component"):extend()

M.init = function(self, options)
  M.super.init(self, options)
end

M.lsp_client_name = function()
  local result = "[𝝺]"

  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local clients = vim.lsp.get_active_clients()

  if next(clients) == nil then
    return result
  end

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes

    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return "[" .. client.name .. "]"
    end
  end

  return result
end

M.update_status = function(self)
  return self.lsp_client_name()
end

return M
