local _piedPiper, _piedPiperNS = ...

local mailFrame = CreateFrame("FRAME", "PPFrameOpen");
mailFrame:RegisterEvent("MAIL_SHOW", "MAIL_CLOSED");
local function eventHandler(self, event, ...)
    if event == "MAIL_SHOW" then
        if not (PPSETTINGS) then PPSETTINGS = {} end
        PPSETTINGS["FRAMEOPEN"] = true;

        if _piedPiperNS.testMain() then
            return
        end

        if PP["MAIN"] ~= nil and PP["LIMIT"] ~= nil and GetMoney() > PP["LIMIT"] then
            if PPSETTINGS["AUTOSEND"] == true then
                goldToSend = GetMoney() - ((tonumber(PP["LIMIT"]) + 30))
                _piedPiperNS.sendMoney()
            else
                print("[|cFFFFFF00Pied Piper|r] You are above your limit. It's time to pay the piper! /PP to send or /PP autosend to send automatically!")
            end
        end
    elseif event == "MAIL_CLOSED" then
        PPSETTINGS["FRAMEOPEN"] = false;
    end
end
mailFrame:SetScript("OnEvent", eventHandler);
