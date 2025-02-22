function IBScript.Tokenize(text)
    local tokens = {}
    local subToken = {}

    for word in text:gmatch("%S+") do
        -- if word is the of the command, we send subToken to the tokens, else we just add new words
        if word:sub(#word,#word) == ";" then
            word = word:sub(0,#word - 1);

            table.insert(subToken, word);
            table.insert(tokens, subToken);

            subToken = {};
        else
            table.insert(subToken, word)
        end
    end

    for index, _ in ipairs(tokens) do
        if tokens[index][1] == "###" then
            table.remove(tokens, index);
        end
    end

    return tokens;
end