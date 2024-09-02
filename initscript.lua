_G.isscriptable = function(self, prop)
 local s = pcall(function()
  self[prop] = self[prop]
 end)
 return s
end

getgenv().printidentity = function ()
	print("Current identity is 5")
end
