--[[
    This program takes a set of inputs of the form
    {number}-{number} {char}: {string}
    which represents a password policy and password:
    The character `char` can only appear between `number` and `number` times, inclusive, in `string`
]]--
-- equivalet to /\d+-\d+ \g: \g+/
local pattern = "(%d+)%-(%d+) (%a): (%a+)\n"

local file = assert(io.open'input.txt')

local payload = file:read("*all")

local valid_count = 0

-- Return the number of times `char` appears in `str`
local function contains (str, char)
    local result = 0
    for g in str:gmatch('.')do
        if g == char then
            result = result + 1
        end
    end
    return result
end

for low, high, char, str in string.gmatch(pattern) do
    local count = contains(str, char)
    -- if count in range [low, high]
    if count >= low and count <= high then
        valid_count = valid_count + 1
    end
end

print(valid_count)
