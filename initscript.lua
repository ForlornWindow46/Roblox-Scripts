local genv = getgenv()

genv["identifyexecutor"] = function()
	return "Forlorn 1.0.8"
end

genv["whatexecutor"] = function()
	return "Forlorn 1.0.8"
end

genv["printidentity"] = function()
	print("Current identity is 5")
end

genv["getexecutorname"] = function()
	return "Forlorn"
end
