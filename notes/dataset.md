# Dataset

In dit document vind je informatie over de verkregen dataset van Huis van Alijn.
Een [overzicht van de testset](../research/dataset/testset_pictures_HvA.csv) is te vinden in CSV-bestand. Je vindt hier een link naar alle beelden, bestandsnaam, origineel bestandsformaat (.tif of .jpg), medium (dia of foto), thema en periode.

## TL;DR

Aantal: 845 beelden.

|    &nbsp;    | Geboorte | Huwelijk | Sinterklaas | Speelgoed | Vakantie | Totaal  |
| :----------: | :------: | :------: | :---------: | :-------: | :------- | :------ |
|   __00s__    |    6     |    1     |      0      |     2     | 0        | __9__   |
|   __10s__    |    10    |    4     |      0      |     2     | 0        | __16__  |
|   __20s__    |    4     |    13    |      0      |     4     | 11       | __32__  |
|   __30s__    |    2     |    20    |      0      |    10     | 22       | __54__  |
|   __40s__    |    6     |    26    |     13      |    16     | 0        | __61__  |
|   __50s__    |    15    |    82    |     82      |    14     | 16       | __209__ |
|   __60s__    |    18    |   169    |      0      |    11     | 28       | __226__ |
|   __70s__    |    21    |    55    |      2      |    19     | 17       | __114__ |
|   __80s__    |    11    |    14    |      0      |    17     | 19       | __61__  |
|   __90s__    |    3     |    9     |      0      |     6     | 3        | __21__  |
| __onbekend__ |    0     |    7     |      0      |     0     | 35       | __42__  |
|  __Totaal__  |  __96__  | __400__  |   __97__    |  __101__  | __151__  | __845__ |

Thema's:

* huwelijk (400 foto's)
* geboorte (96 foto's)
* sinterklaas (97 foto's)
* speelgoed (101 foto's)
* vakantie (151 foto's)

Periode:

* jaren 00 (9 foto's)
* jaren 10 (16 foto's)
* jaren 20 (32 foto's)
* jaren 30 (54 foto's)
* jaren 40 (61 foto's)
* jaren 50 (209 foto's)
* jaren 60 (226 foto's)
* jaren 70 (114 foto's)
* jaren 80 (61 foto's)
* jaren 90 (21 foto's)
* onbekend (42 foto's)

## Details

De aangeleverde dataset van Huis van Alijn bestond uit 845 beelden van de _Anonieme Snapshot collectie_. Deze collectie bestaat uit duizenden gedigitaliseerde foto's en dia's waarvan de oorspronkelijke eigenaars of gefotografeerden niet gekend zijn. Het zijn foto's die te koop aangeboden worden op rommelmarkten, in kringloopwinkels, online op tweedehandswebsites of die geschonken worden aan het museum. Ze belanden daar na een overlijden of een verhuis. Door hun afkomst is er vaak weinig geweten over de foto's. Het ontbreekt ook vaak aan metadata. Soms staat er een plaatsnaam of een jaartal op een diaraampje of op de achterkant van een foto.

De 845 beelden die door Huis van Alijn als testset aangeboden werden, overspanden een periode van 1900 tot eind jaren 90. Er werd ingbedde metadata bij aangeleverd. Het was wel mogelijk om op basis van de bestandsnamen het decennium en het medium (foto of dia) van het beeldbestand te identificeren. De bestandsnamen hadden volgende logica: __MEDIUM-DECENNIUM-VOLGNR__. Zo waren bestanden die starten met _FO_ afkomstig van foto's, zij die starten met _DIA_ waren afkomstig van diapositieven. De aangeleverde bestanden waren hogeresolutiebestanden - doorgaans in TIF - met een grootte van ongeveer 10 tot 13 MB. __(note to self: nog info geven over resolutie).__

Bij Huis van Alijn worden de collecties opgedeeld in thema's. De verkregen beelden waren ingedeeld in de thema's huwelijk, geboorte, Sinterklaas, speelgoed en vakantie. Ze waren niet evenredig verdeeld. Zo gaan de meeste foto's over trouwen (400 foto's); op ruime afstand gevolgd door foto's over vakanties (151 foto's). Voor de andere drie thema's zijn er ongeveer 100 foto's per thema. Ook de decennia zijn onregelmatig verdeeld. Het zwaartepunt van de foto's is afkomstig uit de periode 1950-1979. Er zijn zelfs maar 9 foto's uit de periode 1900. Ook heeft niet ieder thema foto's uit ieder decennium. Foto's van Sinterklaas zijn er zelfs enkel uit de jaren 40, 50 en 70 (er zijn maar twee foto's uit de jaren 70). Voor het testen van de out of the box modellen zijn deze onregelmatigheden geen probleem, maar bij het trainen kan dit voor problemen zorgen. Het is namelijk belangrijk dat de testset overeenkomt met de real life voorbeelden.

## Verwerking van beelden

De beelden werden op een beeldenserver geplaatst en via een shell script werden de URL van de beelden, bestandsnamen en andere metadata van de beeldbestanden in een CSV geplaatst waarmee verder gewerkt kon worden. Om eenvoudige analyses te maken van de beelden werd de CSV ook ingeladen in een MySQL-databank. Voor meer info, zie de beschrijving van de [methode](method.md).

## TODO

* Nagaan bij het museum of deze testset overeenkomt met hun eigen collectie. Zijn m.a.w. het merendeel van de foto's huwelijksfoto's en is ook daar het zwaartepunt 1950-1970?
* Zo nee, checken bij Astrid of we nog extra beelden kunnen krijgen voor het trainen en zorgen dat er een evenredigere verdeling is.
* Wanneer we een model maken om decennia te herkennen, sluiten we dan de Sinterklaasbeelden uit van de testset? Anders gaat het model mogelijk beelden met een Sinterklaas op enkel indelen in de jaren 40 of 50.
* Nagaan bij het museum wat het resultaat van de tagging oproep geweest is: wat is hiermee gebeurd? wat was de kwaliteit? waar werd deze informatie opgeslagen, etc. Zie volgende link <https://www.heemkunde-vlaanderen.be/huis-van-alijn-zoekt-taggers-mv-voor-beschrijven-van-anonieme-snapshots/>
