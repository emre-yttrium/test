
local func_head = [[local userfunc = function(unit,world)]]
local func_foot = [[end; return userfunc]]
local func_body = [[ return unit]]

local GetUserFunction = assert(loadstring(func_head..func_body..func_foot))
userdefFunc = GetUserFunction();	-- Call the Constructor

print(userdefFunc(38, 4))

-- local func = assert(loadstring( [[ local con = function(unit, plate) return unit+plate end; return con]])); local userfunc = func(); print(userfunc(1, 2)) -- works