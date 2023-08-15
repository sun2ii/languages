dofile("_10/1-yo/1-past.lua")

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
local percentageCorrect = math.floor((correct / total) * 100)

print("---------------")
print(timeSpent .. "s || " .. percentageCorrect .. "%")

