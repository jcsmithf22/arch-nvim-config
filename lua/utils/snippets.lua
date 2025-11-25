---@type table<string, string>
local snippet_cache = {}

---@param filepath string
---@param key string
---@return string | nil
local function get_snippet(filepath, key)
  local cache_key = filepath .. ":" .. key
  if snippet_cache[cache_key] then
    return snippet_cache[cache_key]
  end

  local snippet_path = vim.fn.stdpath("data") .. "/lazy/friendly-snippets/snippets/" .. filepath .. ".json"
  local file = io.open(snippet_path, "r")
  if not file then
    return nil
  end

  local content = file:read("*all")
  file:close()

  local ok, snippets = pcall(vim.json.decode, content)
  if ok and snippets[key] then
    local body = snippets[key].body
    if type(body) == "table" then
      body = table.concat(body, "\n")
    end
    snippet_cache[cache_key] = body
    return tostring(body)
  end

  return nil
end

---@param filepath string
---@param key string
local function expand_snippet(filepath, key)
  local snip = get_snippet(filepath, key)
  if snip then
    vim.snippet.expand(snip)
  end
end

vim.api.nvim_create_user_command("SnippetCacheView", function()
  local lines = {}
  for key, body in pairs(snippet_cache) do
    table.insert(lines, "--- " .. key .. " ---")
    table.insert(lines, body)
    table.insert(lines, "")
  end

  if #lines == 0 then
    vim.notify("Snippet cache is empty", vim.log.levels.INFO)
    return
  end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].filetype = "snippets"
  vim.api.nvim_open_win(buf, true, { split = "right" })
end, {})

return {
  expand_snippet = expand_snippet,
}
