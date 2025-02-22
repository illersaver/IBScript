function IBScript.Parser(tokens)
    local parsedTokens = {}

    for _, token in ipairs(tokens) do
        table.insert(parsedTokens, IBScript.Parse(token));
    end

    return parsedTokens;
end

function IBScript.Parse(token)
    local statement = {}

    local first = {
        ["variable:"] = function ()
            statement["action"] = "assign";
            statement["name"] = token[2];
            statement["value"] = token[4];
        end,
        ["func:"] = function ()
            statement["action"] = "function";
            statement["name"] = token[2];
            statement["length"] = token[3];
        end,
        ["call:"] = function ()
            statement["action"] = "callFunction";
            statement["name"] = token[2];
        end,
        ["if:"] = function ()
            statement["action"] = "if";
            statement["bool"] = token[2];
            statement["stateTrue"] = token[3];
            statement["stateFalse"] = token[4];
        end,
        ["stop:"] = function ()
            statement["action"] = "stop";
        end,
        ["return:"] = function ()
            statement["action"] = "return";
        end,
        ["print:"] = function ()
            statement["action"] = "print";
            statement["value"] = token[2];
        end
    }

    local second = {
        ["=="] = function ()
            statement["action"] = "equals";
            statement["firstVariable"] = token[1];
            statement["secondVariable"] = token[3];
            statement["outputVariable"] = token[4];
        end,
        [">"] = function ()
            statement["action"] = "more";
            statement["firstVariable"] = token[1];
            statement["secondVariable"] = token[3];
            statement["outputVariable"] = token[4];
        end,
        ["<"] = function ()
            statement["action"] = "less";
            statement["firstVariable"] = token[1];
            statement["secondVariable"] = token[3];
            statement["outputVariable"] = token[4];
        end,
        ["+"] = function ()
            statement["action"] = "plus";
            statement["firstVariable"] = token[1];
            statement["secondVariable"] = token[3];
            statement["outputVariable"] = token[4];
        end,
        ["-"] = function ()
            statement["action"] = "minus";
            statement["firstVariable"] = token[1];
            statement["secondVariable"] = token[3];
            statement["outputVariable"] = token[4];
        end,
        ["*"] = function ()
            statement["action"] = "multiplication";
            statement["firstVariable"] = token[1];
            statement["secondVariable"] = token[3];
            statement["outputVariable"] = token[4];
        end,
        ["/"] = function ()
            statement["action"] = "division";
            statement["firstVariable"] = token[1];
            statement["secondVariable"] = token[3];
            statement["outputVariable"] = token[4];
        end,
        [".."] = function ()
            statement["action"] = "textManipulation";
            statement["firstVariable"] = token[1];
            statement["secondVariable"] = token[3];
            statement["outputVariable"] = token[4];
        end
    }

    if first[token[1]] then
        first[token[1]]();
    elseif second[token[2]] then
        second[token[2]]();
    end
    return statement;
end