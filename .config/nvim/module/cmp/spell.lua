#!/bin/env lua

local source = {}

function source.new()
    return setmetatable({}, { __index = source })
end

function source:is_available()
    return true
end

function source:get_keyword_pattern()
    return [[\K\+]]
end

function levenshtein(str1, str2)
    local len1 = #str1
    local len2 = #str2

    if str1 == str2 then return 0 end
    if len1 == 0 then return len2 end
    if len2 == 0 then return len1 end
    local matrix = {}
    local cost = 0

    for i = 0, len1, 1 do
        matrix[i] = {}
        matrix[i][0] = i
    end
    for j = 0, len2, 1 do
        matrix[0][j] = j
    end
    for i = 1, len1, 1 do
        for j = 1, len2, 1 do
            cost = 0
            if (str1:byte(i) ~= str2:byte(j)) then
                cost = 1
            end
            matrix[i][j] = math.min(matrix[i-1][j] + 1, matrix[i][j-1] + 1, matrix[i-1][j-1] + cost)
        end
    end
    return matrix[len1][len2]
    end

local function candidates(input)
    local items = {}
    local entries = vim.fn.spellsuggest(input)

    for k, v in ipairs(entries) do
        items[k] = {
            label = v,
            filterText = input or v,
            sortText = levenshtein(input, v) .. "",
            preselect = false,
        }
    end
    return items
end

function source:complete(params, callback)
    local input = string.sub(params.context.cursor_before_line, params.offset)
    callback({ items = candidates(input), isIncomplete = true })
end

function source:get_debug_name()
    return "spell"
end

return source

