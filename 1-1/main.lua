--[[
    File that will read all of the input form `input.txt`,
    and find the product of all numbers that sum to 2020
]]

local file = assert( io.open('input.txt', 'r')) -- open and assert file exists

local text_numbers = file.read("*all")
