-- Define the available files with their corresponding descriptions
local files = {
    {path = "_easy/yo/1-present.lua", description = "present   - I ______"},
    {path = "_easy/yo/a-con-present.lua", description = "cont      - I am ______ing"},
    {path = "_easy/yo/x-perf-present.lua", description = "perf      - I have ______ "},
    {path = "_easy/yo/i-perfcon-present.lua", description = "perf+cont - I have been ______ing"}
}


-- Display options to the user
print("Choose a file by entering the corresponding number:")
for i, file in ipairs(files) do
    print(i .. ". " .. file.description)
end

-- Get user input
local selectedOption = tonumber(io.read())

-- Validate user input
if selectedOption >= 1 and selectedOption <= #files then
    local selectedFile = files[selectedOption]
    dofile(selectedFile.path)
    print(selectedFile.path)
    print("---------------")

    local correct = 0
    local total = 0
    local start = os.time()

    for verb, translation in pairs(data) do
        io.write(total + 1 .. ". " .. selectedFile.description:gsub("______", verb) .. ": ")
        local userInput = io.read()

        if userInput == translation then
            correct = correct + 1
        else
            print("x." .. translation)
        end
        total = total + 1
    end

    local finish = os.time()
    local timeSpent = finish - start
    local percentageCorrect = math.floor((correct / total) * 100)

    print("---------------")
    print(timeSpent .. "s || " .. percentageCorrect .. "%")
else
    print("Invalid option selected.")
end

