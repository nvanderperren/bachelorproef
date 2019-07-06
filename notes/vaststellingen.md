# Vaststellingen bij het aanroepen van Clarifai

## Vaststellingen bij het proces van aanroepen

- gemiddelde duur: 2 à 2 seconden per beeld
- slechts 2 beelden die niet lukten, omdat de image size too large was
- voordeel aan IIIF
- twee beelden die niet slaagden:
  - een van die twee was 23,3MB en 4341x2872
  - andere was 21,5MB en 4391x2868
- Nederlandse vertaling van general model is niet tip top (_hart_ in plaats van _teder_)

## algemene vraag

- beter om modelversie op te nemen? dit verzekert dat per beeld dezelfde versie van het model bevraagd wordt.
- nu hebben we alle tags opgenomen in de google sheets. misschien moeten we het slechts doen tot een bepaalde grens, bv. 70% voor de specifiekere modellen en 85% bij het general model.

## vastestellingen per model

### informatie modellen

- general heeft 9144 actieve concepten
- travel heeft 77 actieve concepten
- wedding heeft 444 active concepten

zie [models info](../research/models_info) voor de concepten per model

### travel model

- wel zeer mager model met weinig concepten. kan bv. geen vliegtuigen herkennen. jammer, want er zijn veel beelden met vliegtuigen
- als het een hoge score geeft aan een tag, dan zit het er wel spot on (bv. gift shop (> 97%!) bij DIA-0001-0197)

### wedding model

- scoort beter dan het general model op trouwfeesten. wat uiteraard logisch is, omdat het uit minder concepten moet kiezen. zit er vaak goed kop bij hoge scores, maar kan er ook erg naast zitten
- positieve voorbeelden: first dance bij DIA-80-00358
- negatieve voorbeelden: fashion (85%, is tag met hoogste score) of Vera Wang (77%) bij FO-20-00083
- scoort in het algemeen enkel goed op de meer typische trouwfoto's (wit kleed, sluier, man in pak). In de eerste helft van de 20e eeuw lijkt dit (op basis van de foto's) niet de gangbare kledij te zijn voor bruiden.

### general model

- geeft veel ruis. het gevoel dat het soms beter wat minder tags, maar dan meer to the point zou moeten geven.
- kan, zoals verwacht, geen Sinterklaas herkennen of hier goede tags aan geven.
- scoort beter op recentere foto's (kleurenfoto's).
- niet meteen een logica te zien waarom ie in sommige foto's wel iets herkent en in andere niet. (bv. ook bij huwelijksfoto's waar foto's toch meestal een vast sjabloon hebben.)
- kan soms ook wel straffe relevante tags geven: souvenir, bazaar, jet, airbus, tourist, grassland, hut, camper, jaunt, etc.
- ook begrijpbare fouten, zoals een hotel dat als een appartement gezien wordt; of een paraplu als een parasol
- geeft ook woorden zoals adventure, fun en enjoyment of music of dancing
- of zelfs beoordelingen zoals 'beautiful'
- spreekt zich soms ook tegen, bv. no person en ook adult samen.
- bij het valideren soms zelfs assumpties gemaakt, bv. als er volwassenen en kinderen opstaan, dan zijn we ervan uitgegaan dat het een gezin was. Past bij de collectie. ook of iets 'scenic' of 'fun' is, hangt af van wat de validator ervan vindt.
- son: als er man en kind op staat, hebben we dit als juist beoordeeld. ook sibling niet altijd makkelijk te herkennen als er enkel kinderen op staan.
- herkent ook goed een military uniform
- bij baby's wordt altijd het woord 'son' gegeven, nooit dochter
- dining room, reclining
- kan zelfs een bridesmaid herkennen
- soms kan quasi dezelfde foto (zelfde thema, fzelfde compositie), maar van dichterbij of andere belichting andere tags opleveren
- als er een man en een vrouw in deftige kledij op staan, dan gaan we er van uit dat het de trouwders zijn, tenzij dat bv. uit compositie lijkt dat het een vader is die zijn dochter weggeeft.
- zelfs het woordje sexy! of een roos.
- herkent een schildersezel en het schilderen.

## Google Cloud Vision

Niet meteen zicht op het aantal woorden dat voorkomen in de modellen. In de documentatie kan ik geen REST call vinden die mij laat weten welke concepten het model kent. Er is een mindere keuze aan modellen dan in Clarifai. Daarnaast geeft het ook minde resultaten. Max. 10, soms slechts 1. Opvallend is ook dat Cloud Vision minder vertrouwen heeft in zijn resultaten dan Clarifai. Op het eerste zicht lijkt Google Cloud Vision het niet veel beter te doen dan Clarifai. De tags zijn minder redundant, omdat er minder voorkomen, maar GCV scoort niet beter op oude foto's. Noch weet het niets aan te vangen met de figuur van Sinterklaas. Bij oude foto's focust het zich ook meer op het retro-effect (retro clothing, retro, stock photography) dan op de inhoud van de foto. Het is ook opvallend dat het in tegenstelling tot Clarifai beduidend minder emoties of activiteiten tagt. In het algemeen kunnen we stellen dat hoe recenter de foto is, hoe meer tags er zijn.

Wat betreft speelgoed kan het wel, i.t.t. Clarifai, 'toy' als label geven. het kan zelfs lego herkennen! Heeft ook een veel rijkere woordenschat als het om speelgoed gaat.

## TO DO

- checken of foto's FO-40-00693 en FO-40-00612 dezelfde zijn.
