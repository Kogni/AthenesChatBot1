local ACB_Temp = {}
if ( _G.ACB_Temp == nil ) then
	_G.ACB_Temp = ACB_Temp
else
	ACB_Temp = _G.ACB_Temp
end

ACB_Temp.Ordbok = {}

function ACB_Temp.Ordbok:ImplementerOrdbok(  )

	for Ord, Data in pairs( ACB_ordforraad ) do
		if ( false == true ) then
		elseif ( Ord == "nødvendig" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Adjektiv"
			ACB_ordforraad[Ord].Entall = "nødvendig"
			ACB_ordforraad[Ord].Flertall = "nødvendige"
		elseif ( Ord == "sjelden" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Adjektiv"
			ACB_ordforraad[Ord].Entall = "sjelden"
			ACB_ordforraad[Ord].Flertall = "sjeldne"
		elseif ( Ord == "ledig" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Adjektiv"
			ACB_ordforraad[Ord].Entall = "ledig"
			ACB_ordforraad[Ord].Flertall = "ledige"
		elseif ( Ord == "utholden" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Adjektiv"
			ACB_ordforraad[Ord].Entall = "utholden"
			ACB_ordforraad[Ord].Flertall = "utholdne"
		elseif ( Ord == "gammal" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Adjektiv"
			ACB_ordforraad[Ord].AdjMulig = true
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "sykt" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Adjektiv"
			ACB_ordforraad[Ord].AdjMulig = true
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "hellig" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Adjektiv"
			ACB_ordforraad[Ord].AdjMulig = true
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "spesielt" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Adjektiv"
			ACB_ordforraad[Ord].AdjMulig = true
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "mental" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Adjektiv"
			ACB_ordforraad[Ord].AdjMulig = true
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "feig" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Adjektiv"
			ACB_ordforraad[Ord].AdjMulig = true
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = false	
			
		-----
		elseif ( Ord == "en" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Artikkel"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = true
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = false		
		elseif ( Ord == "et" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Artikkel"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = true
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "ei" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Artikkel"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = true
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = false	
		
		----
		elseif ( Ord == "på" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Preposisjon"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = true
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = false	
			
		----
		elseif ( Ord == "prest" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "onyxia" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "mimiron" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "boomkin" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "sted" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "heroics" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "chips" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "titanium" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "posten" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "kjelleren" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "scrub" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "heis" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "skjegget" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "biten" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "byer" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "person" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "healer" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "portaler" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "osten" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "skill" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "gem" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false	
		elseif ( Ord == "runden" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false
		elseif ( Ord == "faction" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false
		elseif ( Ord == "faenskapen" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false
		elseif ( Ord == "poengene" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false
		elseif ( Ord == "cobalt" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Substantiv"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = true
			ACB_ordforraad[Ord].VMulig = false
		
			
		---
		elseif ( Ord == "er" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "v�re" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "var" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "blir" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
			
		elseif ( Ord == "kryper" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
			
		elseif ( Ord == "få" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "fikk" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
			
		elseif ( Ord == "gå" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "gikk" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
			
		elseif ( Ord == "må" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "tviler" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "feiler" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "rømte" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "mater" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "slipper" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "flipper" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "runket" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "trykka" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "kjører" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "reiste" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true	
		elseif ( Ord == "finne" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true
		elseif ( Ord == "vinne" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true
		elseif ( Ord == "downloade" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true
		elseif ( Ord == "melde" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true
		elseif ( Ord == "sendte" ) then
			ACB_ordforraad[Ord].OrdKlasse = "Verb"
			ACB_ordforraad[Ord].AdjMulig = false
			ACB_ordforraad[Ord].AdvMulig = false
			ACB_ordforraad[Ord].ArtMulig = false
			ACB_ordforraad[Ord].DMulig = false
			ACB_ordforraad[Ord].PrnMulig = false
			ACB_ordforraad[Ord].PrpMulig = false
			ACB_ordforraad[Ord].SbsMulig = false
			ACB_ordforraad[Ord].VMulig = true
		
		end
	end
	
end