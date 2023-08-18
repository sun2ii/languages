local files = {
    {path = "../data/yo/1-present.lua", description = "present   - I ______"},
    {path = "../data/yo/a-con-present.lua", description = "cont      - I am ______ing"},
    {path = "../data/yo/i-perfcon-present.lua", description = "perf+cont - I have been ______ing"},
    {path = "../data/yo/x-perf-present.lua", description = "perf      - I have ______ "},
}

local running = true
local totalCorrect = 0
local totalAttempts = 0

while running do
    print("Choose a file by entering the corresponding number:")
    for i, file in ipairs(files) do
        print(i .. ". " .. file.description)
    end

    local userInput = io.read()

    if userInput == "x" then
        running = false
    elseif tonumber(userInput) and tonumber(userInput) >= 1 and tonumber(userInput) <= #files then
        local selectedFile = files[tonumber(userInput)]
        local filePath = selectedFile.path:match("([^/]+)%.lua$")
        local correct = 0
        local total = 0

        print(filePath)
        print("---------------")

        dofile(selectedFile.path)

        for verb, conjugation in pairs(data) do
            io.write(total + 1 .. ". " .. selectedFile.description:gsub("______", verb) .. ": ")
            local userInput = io.read()

            if userInput == conjugation then
                correct = correct + 1
            else
                print("x." .. conjugation)
            end
            total = total + 1
        end

        totalCorrect = totalCorrect + correct
        totalAttempts = totalAttempts + total

        print("---------------")
        print("Press Enter to continue or 'x' to exit")
        local userInput = io.read()

        if userInput == "x" then
            running = false
        else
            os.execute("clear")  -- Use "cls" on Windows
        end
    else
        print("Invalid option selected.")
    end

    startTime = os.time()
end

local totalPercentageCorrect = math.floor((totalCorrect / totalAttempts) * 100)

print("Total correct: " .. totalCorrect .. "/" .. totalAttempts)
print("Total percentage correct: " .. totalPercentageCorrect .. "%")

