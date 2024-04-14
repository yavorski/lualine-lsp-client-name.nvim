local M = require("lualine.component"):extend()

M.replacements = {
  ["_language_server$"] = "",
  ["tsserver$"] = "typescript",
  ["-tools$"] = "",
  ["_ls$"] = "",
  ["ls$"] = "",
  ["_+$"] = "",
  ["-+$"] = "",
}

M.init = function(self, options)
  M.super.init(self, options)
end

M.lsp_client_name = function()
  local sign = "★"
  local result = sign
  local client_names = {}

  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local clients = vim.lsp.get_active_clients()

  if next(clients) == nil then
    return result
  end

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes

    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      local name = client.name

      for pattern, replacement in pairs(M.replacements) do
        name = name:gsub(pattern, replacement)
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
