local M = require("lualine.component"):extend()

M.replacements = {
  [1] = { pattern = "_language_server$", replacement = "" },
  [2] = { pattern = "tsserver$", replacement = "typescript" },
  [3] = { pattern = "-tools$", replacement = "" },
  [4] = { pattern = "_ls$", replacement = "" },
  [5] = { pattern = "ls$", replacement = "" },
  [6] = { pattern = "_+$", replacement = "" },
  [7] = { pattern = "-+$", replacement = "" },
}

M.init = function(self, options)
  M.super.init(self, options)
end

M.lsp_client_name = function()
  local sign = "★"
  local result = sign
  local client_names = {}
  local clients = vim.lsp.get_active_clients()
  local buffer_filetype = vim.api.nvim_buf_get_option(0, "filetype")

  if next(clients) == nil then
    return result
  end

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes

    if filetypes and vim.fn.index(filetypes, buffer_filetype) ~= -1 then
      local name = client.name

      for _, entry in ipairs(M.replacements) do
        name = name:gsub(entry.pattern, entry.replacement)
      end

      table.insert(client_names, name)
    end
  end

  if #client_names > 0 then
    table.sort(client_names, function(a, b) return #a < #b end)
    result = table.concat(client_names, " | ") .. "  " .. sign
  end

  return result
end

M.update_status = function(self)
  return self.lsp_client_name()
end

return M
