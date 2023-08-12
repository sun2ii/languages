dofile("_10/1-yo/1-past.lua")
--dofile("_10/1-yo/2-present.lua")
--dofile("_10/1-yo/3-future.lua")
--dofile("_10/1-yo/4-past-imperf.lua")
--dofile("_10/1-yo/5-past-cond.lua")
--dofile("_10/1-yo/6-present-perf.lua")

--[[dofile("_10/2-usted/1-past.lua")
dofile("_10/2-usted/2-present.lua")
dofile("_10/2-usted/3-future.lua")

dofile("_10/3-nosotros/1-past.lua")
dofile("_10/3-nosotros/2-present.lua")
dofile("_10/3-nosotros/3-future.lua")
]]

local correct = 0
local total = 0
local start = os.time()

-- Ask the user how many verbs they want to practice
print("How many verbs do you want to practice?")
local numVerbs = tonumber(io.read())

for verb, translation in pairs(data) do
    io.write(total + 1 .. ". 'yo " .. verb .. "': ")
    local userInput = io.read()

    if userInput == translation then
        correct = correct + 1
    else
        print("x." .. translation)
    end
    total = total + 1

    -- Stop the loop if the user has practiced the desired number of verbs
    if total >= numVerbs then
        break
    end
end

local finish = os.time()
local timeSpent = finish - start
local percentageCorrect = (correct / total) * 100

print("Time spent:" .. timeSpent .. "s." .. percentageCorrect .. "%")

