local ACB_Temp = {}
if ( _G.ACB_Temp == nil ) then
	_G.ACB_Temp = ACB_Temp
else
	ACB_Temp = _G.ACB_Temp
end

ACB_Temp.Lesing = {}
_G.SisteOrdbruk = {}
_G.TyngsteAssosiasjoner = {}
TyngsteAssosiasjoner.AllOver = {}

function ACB_Temp.Lesing:Test( melding )
	--print( "ACB Lesing 11" )
end

function ACB_Temp.Lesing:Leslinje( melding, Avsender, kanal, ChannelID )
	_G.SisteOrdbruk = {}
	_G.TyngsteAssosiasjoner = {}
	ACB_Temp.Lesing:StuderSetning( melding, Avsender )
	ACB_Temp.Ordklasser:VurderOrdklasser()
	ACB_Temp.Setningsanalyse:AnalyserSetning( melding )
	ACB_Temp.Skriving:LagSvar( kanal, ChannelID )
end

function ACB_Temp.Lesing:StuderSetning( melding, Avsender )
	
	ACB_ordforraad[Avsender] = ACB_Temp.Ordforraad:FormOrd( Avsender )
	--print( "ACB 365 avsender", Avsender, ACB_ordforraad[Avsender] )
	ACB_ordforraad[Avsender].PersonTeller = ACB_ordforraad[Avsender].PersonTeller + 1
	ACB_ordforraad[Avsender].PersonNevner = ACB_ordforraad[Avsender].PersonNevner + 1
	
	ACB_ordforraad[Avsender].Forekomst = ACB_ordforraad[Avsender].Forekomst + 1 --vektlegger avsender 1 gang per setning
	ACB_ordforraad[Avsender].AdjMulig = false
	ACB_ordforraad[Avsender].AdvMulig = false
	ACB_ordforraad[Avsender].DMulig = false
	ACB_ordforraad[Avsender].KMulig = false
	ACB_ordforraad[Avsender].PrnMulig = false
	ACB_ordforraad[Avsender].PrpMulig = false
	ACB_ordforraad[Avsender].SbsMulig = true
	ACB_ordforraad[Avsender].VMulig = false
	
	local Unprocessed = melding
	local OrdPrev = ""
	local OrdCurr = ""
	local Count = 0
	local Question = false
	local startPos, endPos = string.find( melding, "?");
	if startpos then
		Question = true
	end
	while ( strlen(Unprocessed) > 0 ) do
		if ( string.sub(Unprocessed, 0, 1 ) == " " ) then
			Unprocessed = string.sub(Unprocessed, 2, strlen(Unprocessed) )
		else
			Count = Count+1
			local startPos1, endPos1 = string.find( Unprocessed, " ")
			local startPos2, endPos2 = string.find( Unprocessed, ". ")
			local startPos3, endPos3 = string.find( Unprocessed, ", ")
			local startPos4, endPos4 = string.find( Unprocessed, "?")
			local startPos5, endPos5 = string.find( Unprocessed, "!")
			local First = startPos1
			local Last = endPos1
			
			if ( startPos2 ) then
				if ( ( First ) and ( startPos2 < First ) ) or ( First == nil ) then
					First = startPos2
					Last = endPos2
				end
			end
			if ( startPos3 ) then
				if ( ( First ) and ( startPos3 < First ) ) or ( First == nil ) then
					First = startPos3
					Last = endPos3
				end
			end
			if ( startPos4 ) then
				if ( ( First ) and ( startPos4 < First ) ) or ( First == nil ) then
					First = startPos4
					Last = endPos4
				end
			end
			if ( startPos5 ) then
				if ( ( First ) and ( startPos5 < First ) ) or ( First == nil ) then
					First = startPos5
					Last = endPos5
				end
			end
			
			if ( First ) then
				local OrdCurrA = string.sub(Unprocessed, 0, First )
				local AUnprocessed = string.sub(Unprocessed, (Last+0), strlen(Unprocessed))
				local OrdCurrB = string.sub(Unprocessed, 0, First )
				local BUnprocessed = string.sub(Unprocessed, (Last+0), strlen(Unprocessed))
				if ( string.sub(OrdCurrB, (strlen(OrdCurrB)), (strlen(OrdCurrB)+1) ) == "," ) and ( OrdCurrB ~= ",") then --hvis siste char er komma, og ikke hele stringen er komma
					OrdCurrB = string.sub(Unprocessed, 0, (First-1) )
					BUnprocessed = string.sub(Unprocessed, (Last-1), strlen(Unprocessed))
				elseif ( string.sub(OrdCurrB, (strlen(OrdCurrB)), (strlen(OrdCurrB)+1) ) == "?" ) and ( OrdCurrB ~= "?") then --hvis siste char er komma, og ikke hele stringen er komma
					OrdCurrB = string.sub(Unprocessed, 0, (First-1) )
					BUnprocessed = string.sub(Unprocessed, (Last-1), strlen(Unprocessed))
				elseif ( string.sub(OrdCurrB, (strlen(OrdCurrB)), (strlen(OrdCurrB)+1) ) == "!" ) and ( OrdCurrB ~= "!") then --hvis siste char er komma, og ikke hele stringen er komma
					OrdCurrB = string.sub(Unprocessed, 0, (First-1) )
					BUnprocessed = string.sub(Unprocessed, (Last-1), strlen(Unprocessed))
				elseif ( string.sub(OrdCurrB, (strlen(OrdCurrB)), (strlen(OrdCurrB)+1) ) == "." ) and ( OrdCurrB ~= ".") then --hvis siste char er komma, og ikke hele stringen er komma
					OrdCurrB = string.sub(Unprocessed, 0, (First-1) )
					BUnprocessed = string.sub(Unprocessed, (Last-1), strlen(Unprocessed))
				end
				OrdCurr = OrdCurrB
				if ( Unprocessed ~= BUnprocessed ) then
					Unprocessed = BUnprocessed
				else
					Unprocessed = string.sub(Unprocessed, (Last+1), strlen(Unprocessed))
				end
			else
				OrdCurr = Unprocessed
				Unprocessed = ""
			end
			if ( OrdCurr ) then
				if ( OrdCurr ~= " " ) and ( OrdCurr ~= "" ) and ( strlen(OrdCurr) < 11 ) then
					ACB_ordforraad[OrdCurr] = ACB_Temp.Ordforraad:FormOrd( OrdCurr )
					ACB_ordforraad[OrdPrev] = ACB_Temp.Ordforraad:FormOrd( OrdPrev )
					ACB_Temp.Lesing:AssosierNaboOrd( OrdCurr, OrdPrev, Avsender )
					ACB_Temp.Ordklasser:SjekkOrdklasser( OrdPrev, OrdCurr )

					if ( string.find( Unprocessed, "?") ) then
						ACB_ordforraad[OrdCurr].SpmTeller = ACB_ordforraad[OrdCurr].SpmTeller + 1
					end
					ACB_ordforraad[OrdCurr].SpmNevner = ACB_ordforraad[OrdCurr].SpmNevner + 1
					
					SisteOrdbruk[Count] = OrdCurr
					OrdPrev = OrdCurr
				end
			else
			end
		end
	end
	if ( TyngsteAssosiasjoner.AllOver == nil ) then
		TyngsteAssosiasjoner.AllOver = {}
	end
	local FantStart = false
	--Vektlegger og assosierer alle ord som er direkte nevnt, slik at svaret relateres til spørsmålet
	for OrdNr, OrdBrukt in pairs( SisteOrdbruk ) do
		if ( strlen(OrdBrukt) > 10 ) then
			SisteOrdbruk[OrdNr] = nil
		elseif ( OrdBrukt == " " ) then
			SisteOrdbruk[OrdNr] = nil
		elseif ( OrdBrukt == "" ) then
			SisteOrdbruk[OrdNr] = nil
		else
			for OrdBrukt2, Data2 in pairs( SisteOrdbruk ) do --alle ord som brukes i samme setning, blir assosiert med hverandre
				if ( ACB_ordforraad[OrdBrukt].Assosiasjoner[OrdBrukt2] == nil ) then
					ACB_ordforraad[OrdBrukt].Assosiasjoner[OrdBrukt2] = 0
				end
				ACB_ordforraad[OrdBrukt].Assosiasjoner[OrdBrukt2] = ACB_ordforraad[OrdBrukt].Assosiasjoner[OrdBrukt2] + 1
			end
			
			if ( TyngsteAssosiasjoner.AllOver[OrdBrukt] == nil ) then
				TyngsteAssosiasjoner.AllOver[OrdBrukt] = 3
			else
				TyngsteAssosiasjoner.AllOver[OrdBrukt] = TyngsteAssosiasjoner.AllOver[OrdBrukt] + 3
			end
			--start variabler
			if ( FantStart == false ) then
				FantStart = true
				ACB_ordforraad[OrdBrukt].StartTeller = ACB_ordforraad[OrdBrukt].StartTeller + 1
			end
			ACB_ordforraad[OrdBrukt].StartNevner = ACB_ordforraad[OrdBrukt].StartNevner + 1
			--slutt variabler
			if ( SisteOrdbruk[OrdNr+1] == nil ) then
				ACB_ordforraad[OrdBrukt].SluttTeller = ACB_ordforraad[OrdBrukt].SluttTeller + 1
			end
			ACB_ordforraad[OrdBrukt].SluttNevner = ACB_ordforraad[OrdBrukt].SluttNevner + 1
		end
		ACB_Temp.Ordklasser:FinnOrdKlasse( OrdBrukt )
	end
	local MinstTyngde = 99
	local MestTyngde = 0
	local MinstOrd = ""
	local MestOrd = ""
	--Snu opp-ned på hvilket ord som har mest tyngde, slik at sjeldne ord blir gjentatt. For å fikse problemer som 'hvilken årstid liker du best'
	for Ordnr, OrdBrukt in pairs( SisteOrdbruk ) do
		if ( ACB_ordforraad[OrdBrukt].Forekomst > MestTyngde ) then
			MestOrd = Assosiasjon
			MestTyngde = ACB_ordforraad[OrdBrukt].Forekomst
		end
		if ( ACB_ordforraad[OrdBrukt].Forekomst < MinstTyngde ) then
			MinstOrd = Assosiasjon
			MinstTyngde = ACB_ordforraad[OrdBrukt].Forekomst
		end
	end
	for Ordnr, OrdBrukt in pairs( SisteOrdbruk ) do
		TyngsteAssosiasjoner.AllOver[OrdBrukt] = ((MestTyngde - ACB_ordforraad[OrdBrukt].Forekomst) + 1)*2
	end
	
end

function ACB_Temp.Lesing:AssosierNaboOrd( Bakerst, Forrest, Avsender )

	ACB_ordforraad[Bakerst].Forekomst = ACB_ordforraad[Bakerst].Forekomst + 1
	--1: vektlegger hvilke ord som dukker opp foran og bak hverandre, slik at den permanente relasjonen mellom dem styrkes
	if ( ACB_ordforraad[Bakerst].Foran[Forrest] == nil ) then
		ACB_ordforraad[Bakerst].Foran[Forrest] = 0
	end
	ACB_ordforraad[Bakerst].Foran[Forrest] = ACB_ordforraad[Bakerst].Foran[Forrest] + 1
	
	--if ( ACB_ordforraad[Forrest] ) then
		if ( ACB_ordforraad[Forrest].Bak[Bakerst] == nil ) then
			ACB_ordforraad[Forrest].Bak[Bakerst] = 0
		end
		ACB_ordforraad[Forrest].Bak[Bakerst] = ACB_ordforraad[Forrest].Bak[Bakerst] + 1
	--end
	
	--relatere avsender med sin ordbruk
	if ( ACB_ordforraad[Avsender].Foran[Bakerst] == nil ) then
		ACB_ordforraad[Avsender].Foran[Bakerst] = 0
	end
	ACB_ordforraad[Avsender].Foran[Bakerst] = ACB_ordforraad[Avsender].Foran[Bakerst] + 1
	
	if ( ACB_ordforraad[Avsender].Bak[Bakerst] == nil ) then
		ACB_ordforraad[Avsender].Bak[Bakerst] = 0
	end
	ACB_ordforraad[Avsender].Bak[Bakerst] = ACB_ordforraad[Avsender].Bak[Bakerst] + 1
	
	if ( ACB_ordforraad[Avsender].Assosiasjoner[Bakerst] == nil ) then
		ACB_ordforraad[Avsender].Assosiasjoner[Bakerst] = 0
	end
	ACB_ordforraad[Avsender].Assosiasjoner[Bakerst] = ACB_ordforraad[Avsender].Assosiasjoner[Bakerst] + 1
	
	--3: Vektlegger ord som er relatert til dem som er nevnt, slik at svaret relateres til spørsmålet
	-- bakerste ord. feks 'Pia' i 'Pia', 'har' i 'Pia har', eller 'du' i 'har du'
	if ( ACB_ordforraad[Bakerst].Foran ) then
		for Assosiasjon, Tyngde in pairs( ACB_ordforraad[Bakerst].Foran ) do
			if ( TyngsteAssosiasjoner.AllOver == nil ) then
				TyngsteAssosiasjoner.AllOver = {}
			elseif ( TyngsteAssosiasjoner.AllOver[Assosiasjon] == nil ) then
				TyngsteAssosiasjoner.AllOver[Assosiasjon] = 1
			else
				TyngsteAssosiasjoner.AllOver[Assosiasjon] = TyngsteAssosiasjoner.AllOver[Assosiasjon] + 1
			end
		end
	end
	if ( ACB_ordforraad[Bakerst].Bak ) then
		for Assosiasjon, Tyngde in pairs( ACB_ordforraad[Bakerst].Bak ) do
			if ( TyngsteAssosiasjoner.AllOver[Assosiasjon] == nil ) then
				TyngsteAssosiasjoner.AllOver[Assosiasjon] = 1
			else
				TyngsteAssosiasjoner.AllOver[Assosiasjon] = TyngsteAssosiasjoner.AllOver[Assosiasjon] + 1
			end
		end
	end
	if ( ACB_ordforraad[Bakerst].Assosiasjoner ) then
		for Assosiasjon, Tyngde in pairs( ACB_ordforraad[Bakerst].Assosiasjoner ) do
			if ( TyngsteAssosiasjoner.AllOver[Assosiasjon] == nil ) then
				TyngsteAssosiasjoner.AllOver[Assosiasjon] = 1
			else
				TyngsteAssosiasjoner.AllOver[Assosiasjon] = TyngsteAssosiasjoner.AllOver[Assosiasjon] + 1
			end
		end
	end
	
	if ( ACB_ordforraad[Avsender].Foran ) then
		for Assosiasjon, Tyngde in pairs( ACB_ordforraad[Avsender].Foran ) do
			if ( TyngsteAssosiasjoner.AllOver[Assosiasjon] == nil ) then
				TyngsteAssosiasjoner.AllOver[Assosiasjon] = 1
			else
				TyngsteAssosiasjoner.AllOver[Assosiasjon] = TyngsteAssosiasjoner.AllOver[Assosiasjon] + 1
			end
		end
	end
	if ( ACB_ordforraad[Avsender].Bak ) then
		for Assosiasjon, Tyngde in pairs( ACB_ordforraad[Avsender].Bak ) do
			if ( TyngsteAssosiasjoner.AllOver[Assosiasjon] == nil ) then
				TyngsteAssosiasjoner.AllOver[Assosiasjon] = 1
			else
				TyngsteAssosiasjoner.AllOver[Assosiasjon] = TyngsteAssosiasjoner.AllOver[Assosiasjon] + 1
			end
		end
	end
	
	--språk
	if ( ACB_ordforraad[Bakerst].NorskTeller > 0 ) then
		ACB_ordforraad[Forrest].NorskNevner = ACB_ordforraad[Forrest].NorskNevner + 1
	end
	if ( ACB_ordforraad[Forrest] ) then
		if ( ACB_ordforraad[Forrest].NorskTeller > 0 ) then
			ACB_ordforraad[Forrest].NorskNevner = ACB_ordforraad[Forrest].NorskNevner + 1
		end
	end
end