--[[
    This program takes a set of inputs of the form
    {number}-{number} {char}: {string}
    which represents a password policy and password:
    The character `char` can only appear between `number` and `number` times, inclusive, in `string`
]]--
-- equivalet to /\d+-\d+ \g: \g+/
local pattern = "(%d+)%-(%d+) (%a): (%a+)"

local file = assert(io.open'input.txt')

local payload = file:read("*all")

local valid_count = 0

-- Return the number of times `char` appears in `str`
-- local function contains (str, char)
--     local result = 0
--     for g in str:gmatch('.')do
--         if g == char then
--             result = result + 1
--         end
--     end
--     return result
-- end

-- logical XOR gate
local function xor(a, b)
    return (a and not b) or (not a and b)
end

assert( xor(true,  false) == true  )
assert( xor(false,  true) == true  )
assert( xor(false, false) == false )
assert( xor(true,   true) == false )

for low, high, char, str in payload:gmatch(pattern) do
    local a, b = tonumber(low), tonumber(high)
    if xor(
        str:sub(a, a) == char,
        str:sub(b, b) == char
    ) 
    then valid_count = valid_count + 1
    end
end

print(valid_count)
