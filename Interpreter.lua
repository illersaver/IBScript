function IBScript.Interpret(parsedTokens)
    if parsedTokens == nil then
        return
    end

    local current = 1
    while current <= #parsedTokens do
        local parsedData = parsedTokens[current]

        if parsedData.action == "function" then
            local functionBody = {}

            for i = current + 1, current + tonumber(parsedData.length), 1 do
                table.insert(functionBody, parsedTokens[i])
            end

            IBScript.Data[parsedData.name] = functionBody

            current = current + tonumber(parsedData.length) + 1
        else
            if parsedData.action == "assign" then
                IBScript.Data[parsedData.name] = parsedData.value
            elseif parsedData.action == "print" then
                local text = parsedData.value

                if text:sub(1, 1) == '"' and text:sub(#text, #text) == '"' then
                    text = text:sub(2, #text - 1)
                    print(text)
                else
                    print(IBScript.Data[text])
                end
            elseif parsedData.action == "if" then
                if IBScript.Data[parsedData.bool] == "1" then
                    IBScript.Interpret(IBScript.Data[parsedData.stateTrue]);
                else
                    IBScript.Interpret(IBScript.Data[parsedData.stateFalse]);
                end
            elseif parsedData.action == "callFunction" then
                IBScript.Interpret(IBScript.Data[parsedData.name])
            elseif parsedData.action == "stop" then
                os.exit();
            elseif parsedData.action == "return" then
                return;
            elseif parsedData.action == "equals" then
                if tostring(IBScript.Data[parsedData.firstVariable]) == tostring(IBScript.Data[parsedData.secondVariable]) then
                    IBScript.Data[parsedData.outputVariable] = "1";
                else
                    IBScript.Data[parsedData.outputVariable] = "0";
                end
            elseif parsedData.action == "more" then
                if tonumber(IBScript.Data[parsedData.firstVariable]) > tonumber(IBScript.Data[parsedData.secondVariable]) then
                    IBScript.Data[parsedData.outputVariable] = "1";
                else
                    IBScript.Data[parsedData.outputVariable] = "0";
                end
            elseif parsedData.action == "less" then
                if tonumber(IBScript.Data[parsedData.firstVariable]) < tonumber(IBScript.Data[parsedData.secondVariable]) then
                    IBScript.Data[parsedData.outputVariable] = "1";
                else
                    IBScript.Data[parsedData.outputVariable] = "0";
                end
            elseif parsedData.action == "plus" then
                IBScript.Data[parsedData.outputVariable] = tonumber(IBScript.Data[parsedData.firstVariable]) + tonumber(IBScript.Data[parsedData.secondVariable])
            elseif parsedData.action == "minus" then
                IBScript.Data[parsedData.outputVariable] = tonumber(IBScript.Data[parsedData.firstVariable]) - tonumber(IBScript.Data[parsedData.secondVariable])
            elseif parsedData.action == "multiplication" then
                IBScript.Data[parsedData.outputVariable] = tonumber(IBScript.Data[parsedData.firstVariable]) * tonumber(IBScript.Data[parsedData.secondVariable])
            elseif parsedData.action == "division" then
                IBScript.Data[parsedData.outputVariable] = tonumber(IBScript.Data[parsedData.firstVariable]) / tonumber(IBScript.Data[parsedData.secondVariable])
            elseif parsedData.action == "textManipulation" then
                IBScript.Data[parsedData.outputVariable] = IBScript.Data[parsedData.firstVariable] .. IBScript.Data[parsedData.secondVariable]
            end

            current = current + 1
        end
    end
end