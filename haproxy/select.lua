core.Debug("EXECUTED!...")
local function select_backend_using_path(txn)
     core.Debug("inside register_fetches!...")
     local path = txn.sf:path()
     local path_first = string.match(path, '([^/]+)')
	core.Debug("Path is: "..path) 
	return path_first
end

core.register_fetches("backend_select", select_backend_using_path)
