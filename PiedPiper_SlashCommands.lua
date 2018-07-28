local _piedPiper, _piedPiperNS = ...

SLASH_COMMAND1 = "/pp"
SLASH_COMMAND2 = "/piper"

SlashCmdList["COMMAND"] = function(msg, editbox)
    _piedPiperNS.piedPiper(msg, editbox)
end