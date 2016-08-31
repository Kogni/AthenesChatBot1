local ACB_Temp = {}
if ( _G.ACB_Temp == nil ) then
	_G.ACB_Temp = ACB_Temp
else
	ACB_Temp = _G.ACB_Temp
end

ACB_Temp.Skriving = {}
_G.SvarTemp = ""

function ACB_Temp.Skriving:Test( melding )
	--print( "ACB Skriving 11" )
end

function ACB_Temp.Skriving:LagSvar( kanal, ChannelID )
	ACB_ordforraad["pia"].OrdKlasse = "Substantiv"
	local Midten = ((getn(_G.SisteOrdbruk))/2)+1 --finner midten av setningen, for å bygge opp svaret derifra og forover\bakover
	Midten = getn(_G.SisteOrdbruk)
	local StartSubstantiv = ACB_Temp.Skriving:FinnTyngsteAssosiasjonTilSvar( "Substantiv", "" )
	--local StartSubstantiv = _G.Avsender
	local StartVerb = ACB_Temp.Skriving:FinnTyngsteAssosiasjonTilSvar( "Verb", StartSubstantiv )
	local ForrigeVenstreOrd = StartSubstantiv
	local ForrigeHoeyreOrd = StartVerb
	local Teller = Midten
	SvarTemp = StartSubstantiv.." "..StartVerb
	print( "ACB Skriving 25 setningsstart=", _G.SvarTemp )
	while (( ForrigeHoeyreOrd ~= "" ) and ( strlen(_G.SvarTemp) < 100 )) do
		--[[
		if ( ForrigeVenstreOrd ~= "" ) then
			if ( (ACB_ordforraad[ForrigeVenstreOrd].StartTeller / ACB_ordforraad[ForrigeVenstreOrd].StartNevner) > 0.5 ) then
				ForrigeVenstreOrd = ""
			else
				ForrigeVenstreOrd = ACB_Temp.Ordforraad:FinnNesteOrd( ForrigeVenstreOrd, "Venstre" )
				SvarTemp = ForrigeVenstreOrd.." "..SvarTemp
			end
		end
		]]
		local A, B = strfind( ForrigeHoeyreOrd, ".", 0 )
		local Sub = ""
		if ( A ) then
			Sub = string.sub( ForrigeHoeyreOrd, A, B )
			--print( "ACB Ordforraad 653", ForrigeHoeyreOrd, A, B, Sub )
		end
		if ( Sub ~= "." ) and ( ForrigeHoeyreOrd ~= "" ) and ( string.find( ForrigeHoeyreOrd, "?" ) == nil ) and ( string.find( ForrigeHoeyreOrd, "!" ) == nil ) then
			ACB_ordforraad[ForrigeHoeyreOrd] = ACB_Temp.Ordforraad:FormOrd( ForrigeHoeyreOrd )
			if ( (ACB_ordforraad[ForrigeHoeyreOrd].SluttTeller / ACB_ordforraad[ForrigeHoeyreOrd].SluttNevner) > 0.5 ) then
				ForrigeHoeyreOrd = "."
			else
				ForrigeHoeyreOrd = ACB_Temp.Skriving:FinnNesteOrd( ForrigeHoeyreOrd, "Høyre" )
				_G.SvarTemp = _G.SvarTemp.." "..ForrigeHoeyreOrd
			end
		else
			ForrigeHoeyreOrd = ""
		end
		Teller = Teller - 1
	end
	local IndexStart, IndexEnd = string.find(_G.SvarTemp, "pia ")
	while ( IndexStart ~= nil ) do
		local FoerPia = string.sub( _G.SvarTemp, 0, (IndexStart-1) )
		local EtterPia = string.sub( _G.SvarTemp, (IndexEnd+1), strlen(_G.SvarTemp) )
		_G.SvarTemp = FoerPia.."jeg "..EtterPia
		IndexStart, IndexEnd = string.find(_G.SvarTemp, "pia ")
	end
	local IndexStart, IndexEnd = string.find(_G.SvarTemp, " pia")
	while ( IndexStart ~= nil ) do
		local FoerPia = string.sub( _G.SvarTemp, 0, (IndexStart-1) )
		local EtterPia = string.sub( _G.SvarTemp, (IndexEnd+1), strlen(_G.SvarTemp) )
		_G.SvarTemp = FoerPia.." jeg"..EtterPia
		IndexStart, IndexEnd = string.find(_G.SvarTemp, " pia")
	end
	
	ACB_Temp:FinnKanal( "-PIA-: ".._G.SvarTemp, kanal, spraak, ChannelID )
end

function ACB_Temp.Skriving:FinnTyngsteAssosiasjonTilSvar( Ordklasse, ForrigeOrd )
	local TyngstOrd = ""
	local NestTyngstOrd = ""
	local TyngstTyngde = 0
	local NestTyngstTyngde = 0
	if ( TyngsteAssosiasjoner.AllOver ) then
		for Assosiasjon, Tyngde in pairs( TyngsteAssosiasjoner.AllOver ) do
			if ( strlen(Assosiasjon) > 10 ) then
				TyngsteAssosiasjoner.AllOver[Assosiasjon] = nil
			elseif ( Assosiasjon == " " ) then
				TyngsteAssosiasjoner.AllOver[" "] = nil
			elseif ( Assosiasjon == "" ) then
				TyngsteAssosiasjoner.AllOver[""] = nil
			elseif ( Assosiasjon == ForrigeOrd ) then
			else
				if ( ACB_ordforraad[Assosiasjon] ~= nil ) then
					if ( ACB_Temp.Ordklasser:ValidierSomOrdklasse( Ordklasse, Assosiasjon ) == true ) then
						if ( Tyngde > TyngstTyngde ) then
							--if ( Ordklasse == "Verb" ) and ( ( ACB_ordforraad[Assosiasjon].StartTeller/ACB_ordforraad[Assosiasjon].StartNevner) < 0.2 ) then
							--else
								--print( "ACB skriving 94", Assosiasjon, Ordklasse, ACB_Temp.Ordklasser:ValidierSomOrdklasse( Ordklasse, Assosiasjon ), ACB_ordforraad[Assosiasjon].OrdKlasse, ACB_ordforraad[Assosiasjon].VMulig )
								NestTyngstOrd = TyngstOrd
								TyngstOrd = Assosiasjon
								NestTyngstTyngde = TyngstTyngde
								TyngstTyngde = Tyngde
							--end
						end
					end
				end
			end
		end
	end
	ACB_Temp.Skriving:FokuserSvar( TyngstOrd )
	if ( TyngstOrd ~= "" ) then 
		TyngsteAssosiasjoner.AllOver[TyngstOrd] = TyngsteAssosiasjoner.AllOver[TyngstOrd] - ((TyngstTyngde-NestTyngstTyngde)+1) --prøver å sette ordet langt nok ned til å ikke bli både startverb og startsubstantiv
	end
	return TyngstOrd
end

function ACB_Temp.Skriving:FinnNesteOrd( Ord, Side )
	local TyngstOrd = ""
	local TyngstTyngde = 0
	
	if ( ( ACB_ordforraad[Ord].SluttTeller / ACB_ordforraad[Ord].SluttNevner ) > 0.2 ) then
		return "."
	end
	if ( ( ACB_ordforraad[Ord].SpmTeller / ACB_ordforraad[Ord].SpmNevner ) > 0.5 ) then
		return "?"
	end
	
	for Assosiasjonen, Tyngde in pairs( TyngsteAssosiasjoner.AllOver ) do
		if ( ACB_ordforraad[Assosiasjonen] == nil ) then
		elseif ( strlen(Assosiasjonen) > 10 ) then
			ACB_ordforraad[Assosiasjonen] = nil
		elseif ( Assosiasjonen == " " ) then
		elseif ( Assosiasjonen == "" ) then
		elseif ( ( ACB_ordforraad[Assosiasjonen].OrdKlasse == "Substantiv" ) and ( string.find( SvarTemp, Assosiasjonen ) ~= nil ) ) then
		elseif ( Side == "Venstre" ) and ( ACB_ordforraad[Ord].Foran[Assosiasjonen] == nil ) then
		elseif ( Side == "Høyre" ) and ( ACB_ordforraad[Ord].Bak[Assosiasjonen] == nil ) then
		else		
			local Validiering = ACB_Temp.Skriving:ValidierNesteOrd( Ord, Assosiasjonen, Tyngde, TyngstTyngde )--Forrest, Bakerst
			if ( Side == "Venstre" ) then
				Validiering = ACB_Temp.Skriving:ValidierNesteOrd( Assosiasjonen, Ord, Tyngde, TyngstTyngde )--Forrest, Bakerst
			end
			if ( Validiering == true ) then
				TyngstOrd = Assosiasjonen
				TyngstTyngde = Tyngde
			end		
		end
	end
	ACB_Temp.Skriving:FokuserSvar( TyngstOrd )
	if ( TyngstOrd ~= "" ) then
		TyngsteAssosiasjoner.AllOver[TyngstOrd] = TyngsteAssosiasjoner.AllOver[TyngstOrd] - (TyngsteAssosiasjoner.AllOver[TyngstOrd] / 1)
	end
	return TyngstOrd
	
	--[[
	local TyngstArray = TyngsteAssosiasjoner.Hoeyre
	local OrdforraadArray = ACB_ordforraad[Ord].Bak
	if ( Side == "Høyre" ) then
		TyngstArray = TyngsteAssosiasjoner.Hoeyre
		OrdforraadArray = ACB_ordforraad[Ord].Bak
	elseif ( Side == "Venstre" ) then
		TyngstArray = TyngsteAssosiasjoner.Venstre
		OrdforraadArray = ACB_ordforraad[Ord].Foran
	end
	if ( TyngstArray == nil ) then
		TyngstArray = {}
	end
	if ( TyngstArray[Ord] == nil ) then
		TyngstArray[Ord] = {}
		TyngstArray[Ord].Assosiasjon = {}
		if ( OrdforraadArray ) then
			for Assosiasjonen, Tyngde in pairs( OrdforraadArray ) do
				if ( strlen(Assosiasjonen) > 10 ) then
					OrdforraadArray[Assosiasjonen] = nil
				elseif ( Assosiasjonen == " " ) then
					OrdforraadArray[" "] = nil
				elseif ( Assosiasjonen == "" ) then
					OrdforraadArray[""] = nil
				else
					TyngstArray[Ord].Assosiasjon[Assosiasjonen] = Tyngde
					if ( ACB_Temp.Skriving:ValidierNesteOrd( Ord, Assosiasjonen, Tyngde, TyngstTyngde ) == true ) then
						TyngstOrd = Assosiasjonen
						TyngstTyngde = Tyngde				
					end
				end
			end
			for Assosiasjonen, Tyngde in pairs( TyngsteAssosiasjoner.AllOver ) do
				if ( TyngstArray[Ord].Assosiasjon[Assosiasjonen] == nil ) then
					TyngstArray[Ord].Assosiasjon[Assosiasjonen] = Tyngde
				else
					TyngstArray[Ord].Assosiasjon[Assosiasjonen] = TyngstArray[Ord].Assosiasjon[Assosiasjonen] + Tyngde
				end
			end
		end
		if ( TyngstArray[Ord].Assosiasjon[TyngstOrd] == nil ) then
			TyngstArray[Ord].Assosiasjon[TyngstOrd] = 0
		end
		TyngstArray[Ord].Assosiasjon[TyngstOrd] = TyngstArray[Ord].Assosiasjon[TyngstOrd] - (TyngstArray[Ord].Assosiasjon[TyngstOrd] / 2) --for å unngå at ordet repeteres
		--print( "ACB 499", TyngstOrd, TyngstTyngde )
		if ( Side == "Høyre" ) then
			TyngsteAssosiasjoner.Hoeyre = TyngstArray
		elseif ( Side == "Venstre" ) then
			TyngsteAssosiasjoner.Venstre = TyngstArray
		end
	
		return TyngstOrd
	else --ordet er allerede brukt i svaret, prøver å unngå repetering av ord med sterke relasjoner
		for Assosiasjonen, Tyngde in pairs( TyngstArray[Ord].Assosiasjon ) do
			if ( ACB_Temp.Skriving:ValidierNesteOrd( Ord, Assosiasjonen, Tyngde, TyngstTyngde ) == true ) then
				TyngstOrd = Assosiasjonen
				TyngstTyngde = Tyngde
			end
		end
		TyngstArray[Ord].Assosiasjon[TyngstOrd] = TyngstArray[Ord].Assosiasjon[TyngstOrd] - (TyngstArray[Ord].Assosiasjon[TyngstOrd] / 3) --for å unngå at ordet repeteres
		print( "ACB 508", TyngstOrd, TyngstTyngde )
		if ( Side == "Høyre" ) then
			TyngsteAssosiasjoner.Hoeyre = TyngstArray
		elseif ( Side == "Venstre" ) then
			TyngsteAssosiasjoner.Venstre = TyngstArray
		end
		return TyngstOrd
	end
	]]
end

function ACB_Temp.Skriving:FokuserSvar( ReturOrd )
	for Assosiasjonen, Tyngde in pairs( ACB_ordforraad[ReturOrd].Assosiasjoner ) do
		if ( TyngsteAssosiasjoner.AllOver[Assosiasjonen] == nil ) then
			TyngsteAssosiasjoner.AllOver[Assosiasjonen] = Tyngde
		else
			TyngsteAssosiasjoner.AllOver[Assosiasjonen] = TyngsteAssosiasjoner.AllOver[Assosiasjonen] + Tyngde
		end
	end
end

function ACB_Temp.Skriving:ValidierNesteOrd( Ord, Assosiasjonen, Tyngde, TyngstTyngde )--Forrest, Bakerst
	if ( ACB_ordforraad[Assosiasjonen] ) then
		if ( strlen(Assosiasjonen)> strlen(SvarTemp) ) and ( string.find( SvarTemp, Assosiasjonen ) ~= nil ) then
			TyngstArray[Ord].Assosiasjon[Assosiasjonen] = TyngstArray[Ord].Assosiasjon[Assosiasjonen] - 1
		else
			if ( ACB_Temp.Ordklasser:SjekkOmOrdklasserMatcher( Ord, Assosiasjonen ) == true ) then --Forrest, Bakerst
				if ( ACB_Temp.Ordforraad:SjekkOmSpraakeneMatcher( Ord, Assosiasjonen ) == true ) then
					if ( Ord ~= Assosiasjonen ) or ( ACB_ordforraad[Ord].OrdKlasse == "Adjektiv" ) then
						if ( Tyngde > TyngstTyngde ) then
							return true
						else
							return false
						end
					end
				end
			end
		end
	end
	return false
end