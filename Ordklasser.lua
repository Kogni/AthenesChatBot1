local ACB_Temp = {}
if ( _G.ACB_Temp == nil ) then
	_G.ACB_Temp = ACB_Temp
else
	ACB_Temp = _G.ACB_Temp
end

ACB_Temp.Ordklasser = {}

function ACB_Temp.Ordklasser:SjekkOrdklasser( Forrest, Bakerst ) --Forsøker å finne frem til ordklassen for forskjellige ord, ved hjelp av elimineringsmetoden
	--print( "ACB ordklasser 11", Forrest, Bakerst )
	if ( type( ACB_ordforraad[Forrest] ) == "string" ) then
		ACB_ordforraad[Forrest] = ACB_Temp.Ordforraad:FormOrd( Forrest )
	end
	if ( type( ACB_ordforraad[Bakerst] ) == "string" ) then
		ACB_ordforraad[Bakerst] = ACB_Temp.Ordforraad:FormOrd( Bakerst )
	end
	--print( "ACB 261", Forrest, Bakerst )
	local startPos, endPos = string.find( Forrest, ",");
	if ( startPos ~= nil ) then
		--print( "ACB 271", ACB_ordforraad[Bakerst] )
		ACB_ordforraad[Bakerst].KMulig = true
	end
	
	if ( ACB_ordforraad[Forrest].OrdKlasse ~= "" ) then
		ACB_ordforraad[Forrest].AdjMulig = false
		ACB_ordforraad[Forrest].AdvMulig = false
		ACB_ordforraad[Forrest].ArtMulig = false
		ACB_ordforraad[Forrest].DMulig = false
		ACB_ordforraad[Forrest].PrnMulig = false
		ACB_ordforraad[Forrest].PrpMulig = false
		ACB_ordforraad[Forrest].SbsMulig = false
		ACB_ordforraad[Forrest].VMulig = false		
	end
	
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Adjektiv" ) then
		ACB_ordforraad[Forrest].AdjMulig = true
		
		--ACB_ordforraad[Bakerst].AdjMulig = false
		ACB_ordforraad[Bakerst].DMulig = false
		--ACB_ordforraad[Bakerst].PrnMulig = false
		--ACB_ordforraad[Bakerst].SbsMulig = false
		--ACB_ordforraad[Bakerst].VMulig = false
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Adverb" ) then
		ACB_ordforraad[Forrest].AdvMulig = true
		
		--ACB_ordforraad[Bakerst].AdjMulig = false
		--ACB_ordforraad[Bakerst].DMulig = false
		ACB_ordforraad[Bakerst].PrpMulig = false
		ACB_ordforraad[Bakerst].VMulig = false
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Determinativ" ) then
		ACB_ordforraad[Forrest].DMulig = true
		
		--ACB_ordforraad[Bakerst].AdjMulig = false
		--ACB_ordforraad[Bakerst].DMulig = false
		ACB_ordforraad[Bakerst].PrnMulig = false
		--ACB_ordforraad[Bakerst].VMulig = false
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Konjunksjon" ) then
		ACB_ordforraad[Forrest].KMulig = true
	
		ACB_ordforraad[Bakerst].AdvMulig = false
		ACB_ordforraad[Bakerst].PrpMulig = false
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Pronomen" ) then
		ACB_ordforraad[Forrest].PrnMulig = true
	
		--bakerst kan kun være Sbs eller V
		--ACB_ordforraad[Bakerst].AdjMulig = false
		ACB_ordforraad[Bakerst].AdvMulig = false
		--ACB_ordforraad[Bakerst].DMulig = false
		ACB_ordforraad[Bakerst].PrnMulig = false
		--ACB_ordforraad[Bakerst].SbsMulig = false
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Preposisjon" ) then
		ACB_ordforraad[Forrest].PrpMulig = true
	
		--ACB_ordforraad[Bakerst].AdjMulig = false
		ACB_ordforraad[Bakerst].AdvMulig = false
		--ACB_ordforraad[Bakerst].VMulig = false
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Substantiv" ) then
		ACB_ordforraad[Forrest].SbsMulig = true
	
		--bakerst kan kun være Prp eller V
		--ACB_ordforraad[Bakerst].AdjMulig = false
		--ACB_ordforraad[Bakerst].AdvMulig = false
		--ACB_ordforraad[Bakerst].DMulig = false
		--ACB_ordforraad[Bakerst].PrnMulig = false
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Verb" ) then
		ACB_ordforraad[Forrest].VMulig = true
		
		--ACB_ordforraad[Bakerst].VMulig = false
		ACB_ordforraad[Bakerst].AdjMulig = false
	end
	---
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adjektiv" ) then
		ACB_ordforraad[Bakerst].AdjMulig = true
		
		--ACB_ordforraad[Forrest].AdvMulig = false
		--ACB_ordforraad[Forrest].PrnMulig = false
		--ACB_ordforraad[Forrest].SbsMulig = false
		ACB_ordforraad[Forrest].VMulig = false
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adverb" ) then
		ACB_ordforraad[Bakerst].AdvMulig = true
	
		ACB_ordforraad[Forrest].AdvMulig = false
		--ACB_ordforraad[Forrest].DMulig = false
		ACB_ordforraad[Forrest].PrnMulig = false
		--ACB_ordforraad[Forrest].SbsMulig = false
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Determinativ" ) then
		ACB_ordforraad[Bakerst].DMulig = true
	
		ACB_ordforraad[Forrest].AdvMulig = false
		--ACB_ordforraad[Forrest].PrnMulig = false
		--ACB_ordforraad[Forrest].SbsMulig = false
		--ACB_ordforraad[Forrest].VMulig = false
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Konjunksjon" ) then
		print( "ACB ordforraas 256 WARNING: Bakerste ord er satt til konjunksjon, dette er gramatisk umulig! Bak:", Bakerst, "Foran:", Forrest )
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Pronomen" ) then
		ACB_ordforraad[Bakerst].PrnMulig = true
		
		--ACB_ordforraad[Forrest].AdJMulig = false
		ACB_ordforraad[Forrest].AdvMulig = false
		--ACB_ordforraad[Forrest].DMulig = false
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Preposisjon" ) then
		ACB_ordforraad[Bakerst].PrpMulig = true
		
		ACB_ordforraad[Forrest].AdvMulig = false
		--ACB_ordforraad[Forrest].VMulig = false
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Substantiv" ) then
		ACB_ordforraad[Bakerst].SbsMulig = true
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Verb" ) then
		ACB_ordforraad[Bakerst].VMulig = true
		
		--ACB_ordforraad[Forrest].AdjMulig = false
		--ACB_ordforraad[Forrest].DMulig = false
		--ACB_ordforraad[Forrest].PrnMulig = false
		--ACB_ordforraad[Forrest].SbsMulig = false
	end
end

function ACB_Temp.Ordklasser:VurderOrdklasser()
	for Ord, Data in pairs( ACB_ordforraad ) do
		--persongjenkjenning
		if ( Data.PersonTeller ) and ( Data.PersonNevner ) then
			if ( (Data.PersonTeller/Data.PersonNevner) > 0.9 ) then --90% forekommelse som avsender
				Data.OrdKlasse = "Substantiv"
			end
		end
		if ( Data.OrdKlasse == "Substantiv" ) then
			--utelukk som spørreord
			if ( Data.SpmTeller == nil ) then
				Data.SpmTeller = 0
			end
			if ( Data.SpmNevner == nil ) then
				Data.SpmNevner = 0
			end
		end
		--språkgjenkjenning
		if ( ACB_ordforraad[Ord].Foran ) then
			for OrdForan, Tyngde in pairs( ACB_ordforraad[Ord].Foran ) do --sjekker assosiering med norske ord
				if ( string.find(Ord, "æ") ~= nil ) then
					Data.NorskTeller = Data.NorskTeller + 1
					Data.NorskNevner = Data.NorskNevner + 1
				elseif ( string.find(Ord, "ø") ~= nil ) then
					Data.NorskTeller = Data.NorskTeller + 1
					Data.NorskNevner = Data.NorskNevner + 1
				elseif ( string.find(Ord, "å") ~= nil ) then
					Data.NorskTeller = Data.NorskTeller + 1
					Data.NorskNevner = Data.NorskNevner + 1
				end
			end
		end
		if ( ACB_ordforraad[Ord].Bak ) then
			for OrdForan, Tyngde in pairs( ACB_ordforraad[Ord].Bak ) do --sjekker assosiering med norske ord
				if ( string.find(Ord, "æ") ~= nil ) then
					Data.NorskTeller = Data.NorskTeller + 1
					Data.NorskNevner = Data.NorskNevner + 1
				elseif ( string.find(Ord, "ø") ~= nil ) then
					Data.NorskTeller = Data.NorskTeller + 1
					Data.NorskNevner = Data.NorskNevner + 1
				elseif ( string.find(Ord, "å") ~= nil ) then
					Data.NorskTeller = Data.NorskTeller + 1
					Data.NorskNevner = Data.NorskNevner + 1
				end
			end
		end
		
		if ( string.find(Ord, "æ") ~= nil ) then
			Data.NorskTeller = 1
			Data.NorskNevner = 1
		elseif ( string.find(Ord, "ø") ~= nil ) then
			Data.NorskTeller = 1
			Data.NorskNevner = 1
		elseif ( string.find(Ord, "å") ~= nil ) then
			Data.NorskTeller = 1
			Data.NorskNevner = 1
		end
		if ( Data.NorskTeller ) and ( Data.NorskNevner ) then
			if ( (Data.NorskTeller/Data.NorskNevner) > 0.8 ) then --80%+ forekommelse med norsk ord
				Data.Spraak = "Norsk"
			end
		end
		if ( Data.EngelskTeller ) and ( Data.EngelskNevner ) then
			if ( (Data.EngelskTeller/Data.EngelskNevner) > 0.8 ) then --80%+ forekommelse som engelsk ord
				Data.Spraak = "Engelsk"
			end
		end
		
	end
end

function ACB_Temp.Ordklasser:SjekkOmOrdklasserMatcher( Forrest, Bakerst ) --passer på at boten ikke setter to ord ved siden av hverandre som er grammatisk ulovlig

	if ( ACB_ordforraad[Forrest] == nil ) then
		ACB_ordforraad[Forrest] = ACB_Temp.Ordforraad:FormOrd( Forrest )
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == nil ) then
		ACB_ordforraad[Forrest] = ACB_Temp.Ordforraad:FormOrd( Forrest )
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == nil ) then
		ACB_ordforraad[Bakerst] = ACB_Temp.Ordforraad:FormOrd( Bakerst )
	end
	local startPos, endPos = string.find( Forrest, ",");
	if ( startPos == nil ) then --har ikke komma
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Konjunksjon" ) then
			return false --matcher ikke, fordi Bakerst er en konjunksjon og Forrest ikke inneholder komma
		end
	end
	
	--print( "ACB 831", Forrest, ACB_ordforraad[Forrest] )
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Adjektiv" ) then
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adverb" ) then
			--return false --ikke adverb etter adjektiv
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Determinativ" ) then
			return false --ikke Determinativ etter adjektiv
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Substantiv" ) then
			--return false --ikke Substantiv etter adjektiv
		end
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Adverb" ) then
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adjektiv" ) then
			--return false --ikke Adjektiv etter Adverb
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Determinativ" ) then
			--return false --ikke Determinativ etter Adverb
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Preposisjon" ) then
			return false --ikke Preposisjon etter Adverb
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Pronomen" ) then
			return false --ikke Pronomen etter Adverb
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Verb" ) then
			return false --ikke Verb etter Adverb
		end
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Determinativ" ) then
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adjektiv" ) then
			--return false --ikke Adjektiv etter Determinativ
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Determinativ" ) then
			--return false --ikke Determinativ etter Determinativ
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Verb" ) then
			--return false --ikke Verb etter Determinativ
		end
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Konjunksjon" ) then
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adverb" ) then
			return false --ikke Adverb etter Konjunksjon
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Preposisjon" ) then
			return false --ikke Preposisjon etter Konjunksjon
		end
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Pronomen" ) then--bakerst kan kun være Sbs eller V
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adjektiv" ) then
			--return false --ikke Adjektiv etter Pronomen
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adverb" ) then
			return false --ikke Adverb etter Pronomen
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Determinativ" ) then
			--return false --ikke Determinativ etter Pronomen
		end
		
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Substantiv" ) then
			--return false --ikke Substantiv etter Pronomen
		end
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Preposisjon" ) then
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adjektiv" ) then
			--return false --ikke Adjektiv etter Preposisjon
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adverb" ) then
			return false --ikke Adverb etter Preposisjon
		end
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Substantiv" ) then--bakerst kan kun være Prp eller V
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adjektiv" ) then
			--return false --ikke Adjektiv etter Substantiv
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adverb" ) then
			--return false --ikke Adverb etter Substantiv
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Determinativ" ) then
			--return false --ikke Determinativ etter Substantiv
		end
		if ( ACB_ordforraad[Bakerst].OrdKlasse == "Substantiv" ) then
			--return false --ikke Substantiv etter Substantiv
		end
	end
	if ( ACB_ordforraad[Forrest].OrdKlasse == "Verb" ) then
	end
	---
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adjektiv" ) then
		if ( ACB_ordforraad[Forrest].OrdKlasse == "Adverb" ) then
			--return false --ikke Adverb foran Adjektiv
		end
		if ( ACB_ordforraad[Forrest].OrdKlasse == "Verb" ) then
			return false --ikke Verb foran Adjektiv
		end
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Adverb" ) then
		if ( ACB_ordforraad[Forrest].OrdKlasse == "Adverb" ) then
			--return false --ikke Adverb foran Adverb
		end
		if ( ACB_ordforraad[Forrest].OrdKlasse == "Determinativ" ) then
			--return false --ikke Determinativ foran Adverb
		end
		if ( ACB_ordforraad[Forrest].OrdKlasse == "Pronomen" ) then
			return false --ikke Pronomen foran Adverb
		end
		if ( ACB_ordforraad[Forrest].OrdKlasse == "Substantiv" ) then
			--return false --ikke Substantiv foran Adverb
		end
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Determinativ" ) then
		if ( ACB_ordforraad[Forrest].OrdKlasse == "Adverb" ) then
			return false --ikke Adverb foran Determinativ
		end
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Konjunksjon" ) then
		print( "ACB ordforraad 922 WARNING: Bakerste ord er satt til konjunksjon, dette er gramatisk umulig! Bak:", Bakerst, "Foran:", Forrest )
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Pronomen" ) then
		if ( ACB_ordforraad[Forrest].OrdKlasse == "Adjektiv" ) then
			--return false --ikke Adjektiv foran Pronomen
		end
		if ( ACB_ordforraad[Forrest].OrdKlasse == "Adverb" ) then
			return false --ikke Adverb foran Pronomen
		end
		if ( ACB_ordforraad[Forrest].OrdKlasse == "Determinativ" ) then
			--return false --ikke Determinativ foran Pronomen
		end
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Preposisjon" ) then
		if ( ACB_ordforraad[Forrest].OrdKlasse == "Adverb" ) then
			return false --ikke Adverb foran Preposisjon
		end
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Substantiv" ) then
	end
	if ( ACB_ordforraad[Bakerst].OrdKlasse == "Verb" ) then
		if ( ACB_ordforraad[Forrest].OrdKlasse == "Adverb" ) then
			return false --ikke Adverb foran Verb
		end
		if ( ACB_ordforraad[Forrest].OrdKlasse == "Determinativ" ) then
			--return false --ikke Determinativ foran Verb
		end
	end
	return true
end

function ACB_Temp.Ordklasser:FinnOrdKlasse( Ordet )

	if ( ACB_ordforraad[Ordet].AdvMulig == false ) and ( ACB_ordforraad[Ordet].DMulig == false ) and ( ACB_ordforraad[Ordet].KMulig == false ) and ( ACB_ordforraad[Ordet].PrnMulig == false ) and ( ACB_ordforraad[Ordet].PrpMulig == false ) and ( ACB_ordforraad[Ordet].SbsMulig == false ) and ( ACB_ordforraad[Ordet].VMulig == false ) then
		ACB_ordforraad[Ordet].OrdKlasse = "Adjektiv"
	end
	if ( ACB_ordforraad[Ordet].AdjMulig == false ) and ( ACB_ordforraad[Ordet].DMulig == false ) and ( ACB_ordforraad[Ordet].KMulig == false ) and ( ACB_ordforraad[Ordet].PrnMulig == false ) and ( ACB_ordforraad[Ordet].PrpMulig == false ) and ( ACB_ordforraad[Ordet].SbsMulig == false ) and ( ACB_ordforraad[Ordet].VMulig == false ) then
		ACB_ordforraad[Ordet].OrdKlasse = "Adverb"
	end
	if ( ACB_ordforraad[Ordet].AdjMulig == false ) and ( ACB_ordforraad[Ordet].AdvMulig == false ) and ( ACB_ordforraad[Ordet].KMulig == false ) and ( ACB_ordforraad[Ordet].PrnMulig == false ) and ( ACB_ordforraad[Ordet].PrpMulig == false ) and ( ACB_ordforraad[Ordet].SbsMulig == false ) and ( ACB_ordforraad[Ordet].VMulig == false ) then
		ACB_ordforraad[Ordet].OrdKlasse = "Determinativ"
	end
	if ( ACB_ordforraad[Ordet].AdjMulig == false ) and ( ACB_ordforraad[Ordet].AdvMulig == false ) and ( ACB_ordforraad[Ordet].DMulig == false ) and ( ACB_ordforraad[Ordet].PrnMulig == false ) and ( ACB_ordforraad[Ordet].PrpMulig == false ) and ( ACB_ordforraad[Ordet].SbsMulig == false ) and ( ACB_ordforraad[Ordet].VMulig == false ) then
		ACB_ordforraad[Ordet].OrdKlasse = "Konjunksjon"
	end
	if ( ACB_ordforraad[Ordet].AdjMulig == false ) and ( ACB_ordforraad[Ordet].AdvMulig == false ) and ( ACB_ordforraad[Ordet].DMulig == false ) and ( ACB_ordforraad[Ordet].KMulig == false ) and ( ACB_ordforraad[Ordet].PrpMulig == false ) and ( ACB_ordforraad[Ordet].SbsMulig == false ) and ( ACB_ordforraad[Ordet].VMulig == false ) then
		ACB_ordforraad[Ordet].OrdKlasse = "Pronomen"
	end
	if ( ACB_ordforraad[Ordet].AdjMulig == false ) and ( ACB_ordforraad[Ordet].AdvMulig == false ) and ( ACB_ordforraad[Ordet].DMulig == false ) and ( ACB_ordforraad[Ordet].KMulig == false ) and ( ACB_ordforraad[Ordet].PrnMulig == false ) and ( ACB_ordforraad[Ordet].SbsMulig == false ) and ( ACB_ordforraad[Ordet].VMulig == false ) then
		ACB_ordforraad[Ordet].OrdKlasse = "Preposisjon"
	end
	if ( ACB_ordforraad[Ordet].AdjMulig == false ) and ( ACB_ordforraad[Ordet].AdvMulig == false ) and ( ACB_ordforraad[Ordet].DMulig == false ) and ( ACB_ordforraad[Ordet].KMulig == false ) and ( ACB_ordforraad[Ordet].PrnMulig == false ) and ( ACB_ordforraad[Ordet].PrpMulig == false ) and ( ACB_ordforraad[Ordet].VMulig == false ) then
		ACB_ordforraad[Ordet].OrdKlasse = "Substantiv"
	end
	if ( ACB_ordforraad[Ordet].AdjMulig == false ) and ( ACB_ordforraad[Ordet].AdvMulig == false ) and ( ACB_ordforraad[Ordet].DMulig == false ) and ( ACB_ordforraad[Ordet].KMulig == false ) and ( ACB_ordforraad[Ordet].PrnMulig == false ) and ( ACB_ordforraad[Ordet].PrpMulig == false ) and ( ACB_ordforraad[Ordet].SbsMulig == false ) then
		ACB_ordforraad[Ordet].OrdKlasse = "Verb"
	end
	--ACB_ordforraad[Ordet].AdjMulig
	--ACB_ordforraad[Ordet].AdvMulig
	--ACB_ordforraad[Ordet].DMulig
	--ACB_ordforraad[Ordet].KMulig
	--ACB_ordforraad[Ordet].PrnMulig
	--ACB_ordforraad[Ordet].PrpMulig
	--ACB_ordforraad[Ordet].SbsMulig
	--ACB_ordforraad[Ordet].VMulig
	
end

function ACB_Temp.Ordklasser:ValidierSomOrdklasse( Ordklasse, Ord )
	--print( "ACB ordklasser 387 leter etter", Ordklasse, Ord, ACB_ordforraad[Ord].OrdKlasse, ACB_ordforraad[Ord].VMulig )
	if ( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) then
		--print( "A", Ord, Ordklasse )
		return true
	end
	if ( Ordklasse == "Adjektiv" ) and ( ACB_ordforraad[Ord].AdjMulig == true )  and ( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) then
	--if ( Ordklasse == "Adjektiv" ) and ( ACB_ordforraad[Ord].AdjMulig == true )  and (( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) or ( ACB_ordforraad[Ord].OrdKlasse == "" )) then
		--print( "B", Ord, Ordklasse )
		return true
	end
	if ( Ordklasse == "Adverb" ) and ( ACB_ordforraad[Ord].AdvMulig == true )  and ( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) then
	--if ( Ordklasse == "Adverb" ) and ( ACB_ordforraad[Ord].AdvMulig == true )  and (( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) or ( ACB_ordforraad[Ord].OrdKlasse == "" )) then
		--print( "C", Ord, Ordklasse )
		return true
	end
	if ( Ordklasse == "Determinativ" ) and ( ACB_ordforraad[Ord].DMulig == true )  and ( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) then
	--if ( Ordklasse == "Determinativ" ) and ( ACB_ordforraad[Ord].DMulig == true )  and (( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) or ( ACB_ordforraad[Ord].OrdKlasse == "" )) then
		--print( "D", Ord, Ordklasse )
		return true
	end
	if ( Ordklasse == "Konjunksjon" ) and ( ACB_ordforraad[Ord].KMulig == true )  and ( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) then
	--if ( Ordklasse == "Konjunksjon" ) and ( ACB_ordforraad[Ord].KMulig == true )  and (( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) or ( ACB_ordforraad[Ord].OrdKlasse == "" )) then
		--print( "E", Ord, Ordklasse )
		return true
	end
	if ( Ordklasse == "Pronomen" ) and ( ACB_ordforraad[Ord].PrnMulig == true )  and ( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) then
	--if ( Ordklasse == "Pronomen" ) and ( ACB_ordforraad[Ord].PrnMulig == true )  and (( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) or ( ACB_ordforraad[Ord].OrdKlasse == "" )) then
		--print( "F", Ord, Ordklasse )
		return true
	end
	if ( Ordklasse == "Preposisjon" ) and ( ACB_ordforraad[Ord].PrpMulig == true )  and ( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) then
	--if ( Ordklasse == "Preposisjon" ) and ( ACB_ordforraad[Ord].PrpMulig == true )  and (( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) or ( ACB_ordforraad[Ord].OrdKlasse == "" )) then
		--print( "G", Ord, Ordklasse )
		return true
	end
	if ( Ordklasse == "Substantiv" ) and ( ACB_ordforraad[Ord].SbsMulig == true )  and ( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) then
	--if ( Ordklasse == "Substantiv" ) and ( ACB_ordforraad[Ord].SbsMulig == true )  and (( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) or ( ACB_ordforraad[Ord].OrdKlasse == "" )) then
		--print( "H", Ord, Ordklasse )
		return true
	end
	if ( Ordklasse == "Verb" ) and ( ACB_ordforraad[Ord].VMulig == true ) and ( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) then
	--if ( Ordklasse == "Verb" ) and ( ACB_ordforraad[Ord].VMulig == true ) and (( ACB_ordforraad[Ord].OrdKlasse == Ordklasse ) or ( ACB_ordforraad[Ord].OrdKlasse == "" )) then
		--print( "ACB ordklasser 387 leter etter", Ordklasse, Ord, ACB_ordforraad[Ord].OrdKlasse, ACB_ordforraad[Ord].VMulig )
		--if ( Ord == "pia" ) then
			--print( "I", Ord, Ordklasse, ACB_ordforraad[Ord].VMulig )
		--end
		return true
	end
	return false
end