IBScript.Utils = {}

function IBScript.Utils.PrintTable(table)
    local text = "{";
    for _, value in ipairs(table) do
        if type(value) ~= "table" then
            text = text.." "..value..",";
        else
            text = text.."{"

            for _, value1 in ipairs(value) do
                if type(value1) ~= "table" then
                    text = text.." "..value1..",";
                end
            end
            text = text.."}"
        end
    end

    return text.."}";
end

function IBScript.Utils.PrintIndexedTable(table)
    local text = "";

    for key, value in pairs(table) do
        text = text..key..": "..tostring(value).."\n";
    end

    return text;
end

function IBScript.Utils.ReadFullFile(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end