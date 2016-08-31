local ACB_Temp = {}
if ( _G.ACB_Temp == nil ) then
	_G.ACB_Temp = ACB_Temp
else
	ACB_Temp = _G.ACB_Temp
end

ACB_Temp.Ordforraad = {}

if ( _G.ACB_ordforraad == nil ) then
	_G.ACB_ordforraad = {}
end
ACB_Temp.Ordbok.ImplementerOrdbok(  )

function ACB_Temp.Ordforraad:FormOrd( Ord ) --Lager en base som inkluderer alle egenskaper som alle ord trenger, for at addonen skal kunne gjøre nødvendige vurderinger av alle slags ord.
	--print( "ACB ordforraad 29", Ord )
	if ( ACB_ordforraad[Ord] == nil ) or ( type(ACB_ordforraad[Ord]) == "string" ) then
		ACB_ordforraad[Ord] = {}
	end
	----Tellere og nevnere
	--Person
	if ( ACB_ordforraad[Ord].PersonTeller == nil ) then
		ACB_ordforraad[Ord].PersonTeller = 0
	end
	if ( ACB_ordforraad[Ord].PersonNevner == nil ) then
		ACB_ordforraad[Ord].PersonNevner = 0
	end
	--Spørreord
	if ( ACB_ordforraad[Ord].SpmTeller == nil ) then
		ACB_ordforraad[Ord].SpmTeller = 0
	end
	if ( ACB_ordforraad[Ord].SpmNevner == nil ) then
		ACB_ordforraad[Ord].SpmNevner = 0
	end
	--Start setning
	if ( ACB_ordforraad[Ord].StartTeller == nil ) then
		ACB_ordforraad[Ord].StartTeller = 0
	end
	if ( ACB_ordforraad[Ord].StartNevner == nil ) then
		ACB_ordforraad[Ord].StartNevner = 0
	end	
	--Slutter setning
	if ( ACB_ordforraad[Ord].SluttTeller == nil ) then
		ACB_ordforraad[Ord].SluttTeller = 0
	end
	if ( ACB_ordforraad[Ord].SluttNevner == nil ) then
		ACB_ordforraad[Ord].SluttNevner = 0
	end	
	--Norsk språk
	if ( ACB_ordforraad[Ord].NorskTeller == nil ) then
		ACB_ordforraad[Ord].NorskTeller = 0
	end
	if ( ACB_ordforraad[Ord].NorskNevner == nil ) then
		ACB_ordforraad[Ord].NorskNevner = 0
	end
	--Engelsk språk
	if ( ACB_ordforraad[Ord].EngelskTeller == nil ) then
		ACB_ordforraad[Ord].EngelskTeller = 0
	end
	if ( ACB_ordforraad[Ord].EngelskNevner == nil ) then
		ACB_ordforraad[Ord].EngelskNevner = 0
	end
	--Adverb
	if ( ACB_ordforraad[Ord].AdvTeller == nil ) then
		ACB_ordforraad[Ord].AdvTeller = 0
	end
	if ( ACB_ordforraad[Ord].AdvNevner == nil ) then
		ACB_ordforraad[Ord].AdvNevner = 0
	end
	if ( ACB_ordforraad[Ord].AdvMulig == nil ) then
		ACB_ordforraad[Ord].AdvMulig = true
	end
	--Adjektiv
	if ( ACB_ordforraad[Ord].AdjTeller == nil ) then
		ACB_ordforraad[Ord].AdjTeller = 0
	end
	if ( ACB_ordforraad[Ord].AdjNevner == nil ) then
		ACB_ordforraad[Ord].AdjNevner = 0
	end
	if ( ACB_ordforraad[Ord].AdjMulig == nil ) then
		ACB_ordforraad[Ord].AdjMulig = true
	end
	--Deteminant
	if ( ACB_ordforraad[Ord].DTeller == nil ) then
		ACB_ordforraad[Ord].DTeller = 0
	end
	if ( ACB_ordforraad[Ord].DNevner == nil ) then
		ACB_ordforraad[Ord].DNevner = 0
	end
	if ( ACB_ordforraad[Ord].DMulig == nil ) then
		ACB_ordforraad[Ord].DMulig = true
	end
	--Konjunksjon
	if ( ACB_ordforraad[Ord].KTeller == nil ) then
		ACB_ordforraad[Ord].KTeller = 0
	end
	if ( ACB_ordforraad[Ord].KNevner == nil ) then
		ACB_ordforraad[Ord].KNevner = 0
	end
	if ( ACB_ordforraad[Ord].KMulig == nil ) then
		ACB_ordforraad[Ord].KMulig = false
	end
	--Pronomen
	if ( ACB_ordforraad[Ord].PrnTeller == nil ) then
		ACB_ordforraad[Ord].PrnTeller = 0
	end
	if ( ACB_ordforraad[Ord].PrnNevner == nil ) then
		ACB_ordforraad[Ord].PrnNevner = 0
	end
	if ( ACB_ordforraad[Ord].PrnMulig == nil ) then
		ACB_ordforraad[Ord].PrnMulig = true
	end
	--Preposisjon
	if ( ACB_ordforraad[Ord].PrpTeller == nil ) then
		ACB_ordforraad[Ord].PrpTeller = 0
	end
	if ( ACB_ordforraad[Ord].PrpNevner == nil ) then
		ACB_ordforraad[Ord].PrpNevner = 0
	end
	if ( ACB_ordforraad[Ord].PrpMulig == nil ) then
		ACB_ordforraad[Ord].PrpMulig = true
	end
	--Substantiv
	if ( ACB_ordforraad[Ord].SbsTeller == nil ) then
		ACB_ordforraad[Ord].SbsTeller = 0
	end
	if ( ACB_ordforraad[Ord].SbsNevner == nil ) then
		ACB_ordforraad[Ord].SbsNevner = 0
	end
	if ( ACB_ordforraad[Ord].SbsMulig == nil ) then
		ACB_ordforraad[Ord].SbsMulig = true
	end
	--Verb
	if ( ACB_ordforraad[Ord].VTeller == nil ) then
		ACB_ordforraad[Ord].VTeller = 0
	end
	if ( ACB_ordforraad[Ord].VNevner == nil ) then
		ACB_ordforraad[Ord].VNevner = 0
	end
	if ( ACB_ordforraad[Ord].VMulig == nil ) then
		ACB_ordforraad[Ord].VMulig = true
	end
	----Andre ting
	if ( ACB_ordforraad[Ord].OrdKlasse == nil ) then
		ACB_ordforraad[Ord].OrdKlasse = ""
	end	
	if ( ACB_ordforraad[Ord].Forekomst == nil ) then
		ACB_ordforraad[Ord].Forekomst = 0
	end
	--print( "ACB 241", ACB_ordforraad[Ord], ACB_ordforraad[Ord].Forekomst )
	if ( ACB_ordforraad[Ord].Foran == nil ) then
		ACB_ordforraad[Ord].Foran = {}
	end	
	if ( ACB_ordforraad[Ord].Bak == nil ) then
		ACB_ordforraad[Ord].Bak = {}
	end	
	if ( ACB_ordforraad[Ord].Assosiasjoner == nil ) then
		ACB_ordforraad[Ord].Assosiasjoner = {}
	end
	if ( ACB_ordforraad[Ord].Assosiasjon ) then --brukes ikke lenger
		ACB_ordforraad[Ord].Assosiasjon = nil
	end
	
	for Assosiert, Data in pairs( ACB_ordforraad[Ord].Bak ) do
		ACB_Temp.Ordklasser:SjekkOrdklasser( Ord, Assosiert )
	end
	for Assosiert, Data in pairs( ACB_ordforraad[Ord].Foran ) do
		if ( ACB_ordforraad[Assosiert] ) then
			ACB_Temp.Ordklasser:SjekkOrdklasser( Assosiert, Ord )
		end
	end
	return ACB_ordforraad[Ord]
end

function ACB_Temp.Ordforraad:SjekkOmSpraakeneMatcher( Forrest, Bakerst )
	if ( ACB_ordforraad[Forrest].NorskTeller > 0 ) or ( ACB_ordforraad[Bakerst].NorskTeller > 0 ) then
		if ( ACB_ordforraad[Forrest].NorskTeller > 0 ) then --forrest inneholder æ\ø\å
			if ( ( ACB_ordforraad[Bakerst].NorskNevner / ACB_ordforraad[Bakerst].Forekomst ) > 0.1 ) then --bakerst er som oftest brukt sammen et norsk ord
				return true
			end
		end
		if ( ACB_ordforraad[Bakerst].NorskTeller > 0 ) then --Bakerst inneholder æ\ø\å
			if ( ( ACB_ordforraad[Forrest].NorskNevner / ACB_ordforraad[Forrest].Forekomst ) > 0.1 ) then --Forrest er som oftest brukt sammen et norsk ord
				return true
			end
		end
		return false--Det ene ordet er desidert norsk, men det andre ser ikke norsk ut
	end
	return true --ingen av ordene trenger å være norske
end