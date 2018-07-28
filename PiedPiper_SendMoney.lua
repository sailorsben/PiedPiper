local _piedPiper, _piedPiperNS = ...

function _piedPiperNS.sendMoney() 
	SetSendMailMoney(goldToSend)
	SendMail(PP["MAIN"], "Pied Piper", "")
	print("[|cFFFFFF00Pied Piper|r] Sent " .. GetCoinTextureString(goldToSend) .. " to |cFF00FF00" .. PP["MAIN"] .. "|r!")
end