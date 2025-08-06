local exports = {}


-- ===Pretty Printing a table===
local function isTable(x)
  return type(x) == "table"
end

local indentOffset = 4
local function printWithOffset(indentLevel, str)
  print(string.rep(" ", indentLevel) .. str)
end

-- Mutual recursion
local printTable, printGeneric
printTable = function(indentLevel, t)
  printWithOffset(indentLevel, "{")
  for k, v in pairs(t) do
    if isTable(v) then
      printWithOffset(indentLevel + indentOffset, tostring(k) .. " =")
      printGeneric(indentLevel + indentOffset + indentOffset, v)
    else
      printWithOffset(indentLevel + indentOffset, tostring(k) .. " = " .. tostring(v))
    end
  end
  printWithOffset(indentLevel, "}")
end

printGeneric = function(indentLevel, x)
  if isTable(x) then
    printTable(indentLevel, x)
  else
    printWithOffset(indentLevel, tostring(x))
  end
end

local function P(x)
  printGeneric(0, x)
end

exports.P = P


-- ===Inserting text into buffer===
local function insertDebug()
  local debugExpression = " (Debug.todo \"\")"
  local columnPosition = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, columnPosition) .. debugExpression .. line:sub(columnPosition + 1)
  vim.api.nvim_set_current_line(nline)
end

exports.insertDebug = insertDebug

return exports
