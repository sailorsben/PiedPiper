local _piedPiper, _piedPiperNS = ...

function _piedPiperNS.testMain()
	local fullName, realm = UnitFullName("player")
	local testMain = fullName .. "-" .. realm
	if PP["MAIN"] == testMain then
		return true;
	end
end