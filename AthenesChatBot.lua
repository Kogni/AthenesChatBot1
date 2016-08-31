local ACB_Temp = {}
if ( _G.ACB_Temp == nil ) then
	_G.ACB_Temp = ACB_Temp
else
	ACB_Temp = _G.ACB_Temp
end

if ( ACB_Settings == nil ) then
	ACB_Settings = {}
	ACB_Settings.Snakk = true
end

if ( ACB_ordforraad == nil ) then
	ACB_ordforraad = {}
end
for Ord, Data in pairs( ACB_ordforraad ) do
	if ( Ord == nil ) then
		Data = nil
	end
end

if ( ACB_Chatlog == nil ) then
	ACB_Chatlog = {}
end

function ACB_Temp.OnEvent( ukjent, event, melding, avsender, spraak, arg1, arg2, arg3, arg4, arg5, arg6, arg7 )
	local ChannelID = arg4
	_G.Event = event
	_G.Spoersmaal = strlower(melding)
	if ( avsender ) then
		avsender = strlower(avsender)
	end
	_G.Avsender = avsender
	_G.Spraak = spraak
	_G.KanalID = arg4
	if ( event == "ADDON_LOADED" ) then
		SlashCmdList["AthenesChatBot"] = ACB_Temp.SlashHandler;
		SLASH_AthenesMasterControl1 = "/AthenesChatBot";
		SLASH_AthenesMasterControl2 = "/ACB";
		SLASH_AthenesMasterControl3 = "/acb";
		ACB_Temp:SlettAlleOrdklasser()
		ACB_Temp:NicksTilSubstantiver()
	elseif ( event == "CHAT_MSG_RAID" ) or ( event == "CHAT_MSG_GUILD" ) then
		--print( "ACB 65 ", ukjent, event, melding, avsender, spraak, arg1, arg2, arg3, arg4, arg5, arg6, arg7 )
		--      ACB 65  table: 1BA073B0 CHAT_MSG_RAID *test* Athenes Orcish  Athenes  0 0  0
		melding = strlower(melding)
		ACB_Temp.Lesing:StuderSetning( melding, _G.Avsender ) --lærer uten å svare
		--ACB_Temp:VektleggOrd( melding ) --lærer uten å svare
	elseif ( string.find(strlower(melding), "pia") ) then
		--ACB_Temp.Skriving:Test()
		--ACB_Temp.Lesing:Test()
		
		local Dato = date("%m/%d/%y %H:%M:%S")
		melding = strlower(melding)
		ACB_Chatlog[Dato] = {}
		ACB_Chatlog[Dato].Melding = melding
		ACB_Chatlog[Dato].Kanal = event
		
		if ( string.find(strlower(melding), "-pia-") ) then
			ACB_Chatlog[Dato].Avsender = "PIA"
			return
		else
			ACB_Chatlog[Dato].Avsender = avsender
			if ( string.find(strlower(melding), "hold kjeft") ) and ( avsender == strlower(UnitName("player")) ) then
				ACB_Temp:FinnKanal( "-PIA-: Unnskyld, jeg skal holde kjeft", event, nil )
				ACB_Settings.Snakk = false
				return
			end
			if ( string.find(strlower(melding), "du får snakke") ) and ( avsender == strlower(UnitName("player")) ) then
				ACB_Temp:FinnKanal( "-PIA-: Takk:)", event, nil )
				ACB_Settings.Snakk = true
				return
			end
			if ( ACB_Settings.Snakk == true ) then
				local kanal = event
				ACB_Temp.Lesing:Leslinje( melding, _G.Avsender, kanal, ChannelID ) --vil prøve å svare
			end
		end
	else
		melding = strlower(melding)
		ACB_Temp.Lesing:StuderSetning( melding, _G.Avsender ) --lærer uten å svare
	end
end

function ACB_Temp:SlettAlleOrdklasser()
	for Assosiert, Data in pairs( ACB_ordforraad ) do
		Data.OrdKlasse = ""
		Data.AdvMulig = true
		Data.AdjMulig = true
		Data.DMulig = true
		Data.KMulig = true
		Data.PrnMulig = true
		Data.PrpMulig = true
		Data.SbsMulig = true
		Data.VMulig = true
	end
end

function ACB_Temp:NicksTilSubstantiver()
	for Assosiert, Data in pairs( ACB_ordforraad ) do
		if ( ACB_ordforraad[strlower(Assosiert)] ) and ( ACB_ordforraad[strlower(Assosiert)] ~= ACB_ordforraad[Assosiert] ) then
			if ( ACB_ordforraad[Assosiert].OrdKlasse ~= "" ) then
				for Variabel, Verdi in pairs( ACB_ordforraad[strlower(Assosiert)] ) do
					if ( type(Variabel) == "number" ) then
						Verdi = Verdi + Data[Variabel]
						Data[Variabel] = 0
					end
					if ( type(Variabel) == "table" ) then
						Verdi = Data[Variabel]
						Data[Variabel] = nil
					end
				end
				ACB_ordforraad[strlower(Assosiert)].OrdKlasse = ACB_ordforraad[Assosiert].OrdKlasse
				
				ACB_ordforraad[Assosiert] = nil
				Data = nil
			end
		end
	end
end

function ACB_Temp:Snakk( melding, kanal, ChannelID )
	if ( kanal == "Whisper" ) then
		SendChatMessage( melding, kanal, nil, _G.KanalID)
	else
		SendChatMessage( melding, kanal, nil, _G.Avsender)
	end
end

function ACB_Temp.PrintChatLog()
	for Dato, Data in pairs( SisteOrdbruk ) do
		print( Dato, Data.Avsender, Data.Kanal, Data.Melding )
	end
end

function ACB_Temp.SlashHandler(cmd)
	cmd = strlower(cmd);
	if ( cmd == "print chatlog" ) then
		ACB_Temp.PrintChatLog()
	else
		print( "Athene's Chat Bot:" )
	end
end

function ACB_Temp:FinnKanal( melding, kanal, ChannelID )

	local Kanalen
	if ( kanal == "CHAT_MSG_WHISPER" ) then
		Kanalen = "WHISPER"
	elseif ( kanal == "CHAT_MSG_CHANNEL" ) then
		Kanalen = "CHANNEL"
	elseif ( kanal == "CHAT_MSG_GUILD" ) then
		Kanalen = "GUILD"
	elseif ( kanal == "CHAT_MSG_PARTY" ) then
		Kanalen = "PARTY"
	elseif ( kanal == "CHAT_MSG_SAY" ) then
		Kanalen = "SAY"
	end

	ACB_Temp:Snakk( melding, Kanalen, ChannelID )
end
 
local f = CreateFrame("Frame", "ACB", UIParent);
f:SetScript("OnEvent", ACB_Temp.OnEvent);
f:RegisterEvent("ADDON_LOADED");
f:RegisterEvent("CHAT_MSG_RAID");
f:RegisterEvent("CHAT_MSG_CHANNEL");
f:RegisterEvent("CHAT_MSG_WHISPER");
f:RegisterEvent("CHAT_MSG_GUILD");
f:RegisterEvent("CHAT_MSG_PARTY");
f:RegisterEvent("CHAT_MSG_SAY");