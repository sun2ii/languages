dofile("1-yo/1-present.lua")
-- dofile("1-yo/2-present-ongoing.lua")
local correct = 0
local total = 0
local start = os.time()

for verb, translation in pairs(questions) do
    io.write("'yo " .. verb .. "': ")
    local userInput = io.read()

    if userInput == translation then
        print("Correcto!")
        correct = correct + 1
    else
        print("Incorrecto. La traducción correcta es:", translation)
    end
    total = total + 1
end

local finish = os.time()
local timeSpent = finish - start
local percentageCorrect = (correct / total) * 100

print("Tiempo empleado:", timeSpent, "segundos")
print("Porcentaje de respuestas correctas:", percentageCorrect, "%")

