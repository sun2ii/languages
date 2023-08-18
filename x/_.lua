local files = {
    {path = "chp1.lua", description = "Nouns 1"},
    {path = "chp2.lua", description = "Nouns 2"},
    {path = "chp3.lua", description = "Verbs 1"},
    {path = "chp4.lua", description = "Articles 1"},
    {path = "chp5.lua", description = "Articles 2"},
}
local running = true
local totalCorrect = 0
local totalAttempts = 0

while running do
    print("Choose a file by entering the corresponding number:")
    for i, file in ipairs(files) do
        print(i .. ". " .. file.description)
    end
    print("---------------")

    local userInput = io.read()

    if userInput == "x" then
        running = false
    elseif tonumber(userInput) and tonumber(userInput) >= 1 and tonumber(userInput) <= #files then
        local selectedFile = files[tonumber(userInput)]
        local filePath = selectedFile.path:match("([^/]+)%.lua$")
        local correct = 0
        local total = 0

        dofile(selectedFile.path)

        for spanish, english in pairs(data) do
            io.write(total + 1 .. ". " .. spanish .. ": ")
            local userInput = io.read()

            if userInput == english then
                correct = correct + 1
            else
                print("x." .. english)
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

