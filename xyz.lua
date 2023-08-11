dofile("yo-present.lua")

local correct = 0
local total = 0
local start = os.time()

for verb, translation in pairs(yoPresent) do
    io.write("Translate 'yo " .. verb .. "': ")
    local userInput = io.read()

    if userInput == translation then
        print("Correcto!")
        correct = correct + 1
    else
        print("Incorrecto. La traducción correcta es:", translation)
    end
    total = total + 1
end

