--[[
    1-2
    File that will read all of the input form `input.txt`,
    and find the product of 3 numbers that sum to 2020
]]

local file = assert( io.open('input.txt', 'r')) -- open and assert file exists

local numbers = {}

-- read each lines number and store it
for num in file:lines("n") do
    table.insert(numbers, num)
end

for _, n in ipairs(numbers) do
    for _, m in ipairs(numbers) do
        for _, k in ipairs(numbers) do

            if n + m + k == 2020 then
                print(n * m *k)
                return
            end
        end
    end
end

-- if it hasn't been found, print out error and quit
print("Couldn't find any numbers that fit!")
return