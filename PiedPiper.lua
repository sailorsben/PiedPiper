local _piedPiper, _piedPiperNS = ...

function _piedPiperNS.piedPiper(msg, editbox) 
	local _, _, cmd, args = string.find(msg, "%s?(%w+)%s?(.*)")
	if not ( PP ) then PP = {}; end
	if not ( PPSETTINGS ) then PPSETTINGS = {}; end

	if cmd == "main" then
		local fullName, realm = UnitFullName("player")
		PP["MAIN"] = fullName .. "-" .. realm
		print("[|cFFFFFF00Pied Piper|r] The Pied Piper is now: |cFF00FF00" .. PP["MAIN"])
	elseif cmd == "limit" then
		args = tonumber(args)
		if args then
			PP["LIMIT"] = args*10000
			print("[|cFFFFFF00Pied Piper|r] Your limit has been set to: " .. GetCoinTextureString(PP["LIMIT"]))
		else
			print("[|cFFFFFF00Pied Piper|r] Your current limit is: " .. GetCoinTextureString(tonumber(PP["LIMIT"])))
			print("[|cFFFFFF00Pied Piper|r] Change your gold limit using |cFF00FF00/PP limit <gold>|r")
		end
	elseif cmd == "help" then
		_piedPiperNS.instructions()
	elseif cmd == "autosend" then 
		if PPSETTINGS["AUTOSEND"] == nil then
			PPSETTINGS["AUTOSEND"] = true;
		else
			PPSETTINGS["AUTOSEND"] = not PPSETTINGS["AUTOSEND"];
		end

		if PPSETTINGS["AUTOSEND"] == true then
			print("[|cFF00FF00Pied Piper|r] Autosend has been turned on.")
		else
			print("[|cFFFF0000Pied Piper|r] Autosend has been turned off.")
		end
	else
		if PP["MAIN"] == nil then
			print("[|cFFFFFF00Pied Piper|r] You have not determined who the Pied Piper is! Use |cFF00FF00/PP main|r to set one.")
			return
		end
		if PP["LIMIT"] == nil then
			print("[|cFFFFFF00Pied Piper|r] You have not set a gold limit! Use |cFF00FF00/PP limit <gold>|r to set one.")
			return
		end
		
		if _piedPiperNS.testMain() then
			print("[|cFFFFFF00Pied Piper|r] You are the Pied Piper! People pay you!")
			return
		end
		
		if (PPSETTINGS["FRAMEOPEN"] == true) then 
			goldToSend = GetMoney() - ((tonumber(PP["LIMIT"]) + 30))
			if goldToSend < GetMoney() then
				_piedPiperNS.sendMoney()
			else 
				print("[|cFFFFFF00Pied Piper|r] You haven't reached your limit yet. Continue making gold!")
			end
		elseif msg == "" and testMain() == false then
			print("[|cFFFFFF00Pied Piper|r] You are not at a mailbox!")
		else
			_piedPiperNS.instructions()
		end
	end
end