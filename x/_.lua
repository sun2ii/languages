- Define the available files with their corresponding descriptions
local files = {
    {path = "../data/yo/1-present.lua", description = "present   - I ______"},
    {path = "../data/yo/a-con-present.lua", description = "cont      - I am ______ing"},
    {path = "../data/yo/i-perfcon-present.lua", description = "perf+cont - I have been ______ing"},
    {path = "../data/yo/x-perf-present.lua", description = "perf      - I have ______ "},
}

local running = true

while running do
    -- Print options
    print("Choose a file by entering the corresponding number:")
    for i, file in ipairs(files) do
        print(i .. ". " .. file.description)
    end

    -- Get user input
    local userInput = io.read()

    if userInput == "x" then
        running = false
    -- Start 
    elseif tonumber(userInput) and tonumber(userInput) >= 1 and tonumber(userInput) <= #files then
        local selectedFile = files[tonumber(userInput)]
        local filePath = selectedFile.path:match("([^/]+)%.lua$")
        local correct = 0
        local total = 0
        local start = os.time()

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

        -- cleanup program
        local finish = os.time()
        local timeSpent = finish - start
        local percentageCorrect = math.floor((correct / total) * 100)

        print("---------------")
        print(timeSpent .. "s || " .. percentageCorrect .. "%")

        print("Enter to continue or x to exit")
        local userInput = io.read()

        if userInput == "x" then
            running = false
        else
            os.execute("clear")  -- Use "cls" on Windows
        end
    else
        print("Invalid option selected.")
    end
end

