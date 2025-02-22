-- It needs a file
local file = IBScript.Utils.ReadFullFile(arg[1]);
local tokens = IBScript.Tokenize(file);
local parsedTokens = IBScript.Parser(tokens);

IBScript.Interpret(parsedTokens);

--print(IBScript.Utils.PrintIndexedTable(IBScript.Data));
--print(IBScript.Utils.PrintTable(tokens));