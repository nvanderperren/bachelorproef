# Google is using AI to help The New York Times digitize 5 million historical photos
author: James Vincent

* grote collectie foto’s
* Google voor storage
* categorizeren van informatie
* gebruik maken van Google Cloud Vision
* allemaal diensten om afbeeldingen te bewaren en metadata toe te voegen
	* resizing
	* metadata in databank
	* ImageMagick
	* ExifTool
* machine learning voor tekstherkenning en extra beschrijvende informatie

https://cloud.google.com/blog/products/ai-machine-learning/how-the-new-york-times-is-using-google-cloud-to-find-untold-stories-in-millions-of-archived-photos

https://www.theverge.com/2018/11/9/18079386/google-ai-new-york-times-digitize-archive-history-photos

#  Identifying art through machine learning
## A project with Google Arts & Culture Lab
MOMA

Ook MOMA heeft Google Cloud Vision gebruikt
koppelen van afbeeldingen van schilderijen aan foto’s van tentoonstellingszichten.
Samen met Google Arts & Culture Labs. zij hebben het algoritme aangepast.
links leggen tussen exhibition history en online collection.
—> mismatches beperken.
vooral goed in tweedimensionale statische afbeeldingen.
false positives

https://www.moma.org/calendar/exhibitions/history/identifying-art

# DHBenelux 2018
http://2018.dhbenelux.org/programme/

# Seeing history
https://melvinwevers.github.io/pdf/Wevers_Smits_SEEING_HISTORY_small.pdf

http://2018.dhbenelux.org/wp-content/uploads/sites/8/2018/05/Wevers_Smits_Seeing_History_DHBenelux2018.pdf

https://melvinwevers.github.io/publication/dh_benelux18/

3 manieren om computer vision te gebruiken in functie van digital humanities
wordt hier gebruikt om personen en gebouwen op krantenfoto’s te herkennen.
dataset van ImageNet is te beperkt, omdat dit enkel over hedendaagse onderwerpen gaat. Historische beelden of tekeningen werken hier niet goed mee.

Theoretische studie.
gedaan met CNN

https://pbs.twimg.com/media/DfJ4cJ7X4AEXxz-.jpg:large

CHRONIC

http://lab.kb.nl/dataset/chronic

Onderzoek naar de speeches van Castro: http://2018.dhbenelux.org/wp-content/uploads/sites/8/2018/05/SergioPeignier_FidelCastroSpeeches_DHBenelux2018.pdf

# The Rijksmuseum Challenge: Museum-Centered Visual Recognition
organiseren van beelden in een museum: schilderijen, foto’s, keramieken, meubels, etc.

challenges:
* voorspel artiest
* voorspel type
* voorspel materiaal
* voorspel creatiejaar
—> helpt medewerker bij het registreren
van de oudheid tot de late 19e eeuw. grootste deel van 1500-1900

moeilijkheid: goede dataset vinden. meestal gericht op 1 type, klein en niet te downloaden.

publicatie: https://ivi.fnwi.uva.nl/isis/publications/2014/MensinkICMIR2014/MensinkICMIR2014.pdf
data en code: https://staff.fnwi.uva.nl/t.e.j.mensink/uva12/rijks/

# INSIGHT
http://uahost.uantwerpen.be/insight/index.php/about/

2017 - 2020

ontwikkelingen in AI gaan gebruiken om collecties uit CE-sector te voorzien van beschrijvende metadata
overbrengen van kennis van open collecties (rijksmuseum) naar andere spelers in het veld.
—> ontwikkelen en uitrollen van tools voor het beheren van digitale collecties
KMSKB en KMKG

na digitaliseren krijg je rauwe data: de scans
die moeten voorzien worden van informatie; vaak komt dit uit terminologieën en volgt dit bepaalde standaarden en thesauri (vnl. AAT)
wordt manueel gedaan door collectieregistratoren.

voordelen van open data —> ook een eis van de Vlaamse Overheid

neural networks en deep learning.

focus hier op het vrijgegeven van die data als open datasets; ook als er geen systeem is door closed vendor en vendor lock-in.

# Deep Transfer Learning for Art Classification Problems

doel: onderzoeken of DCNN netwerken kunnen gebruikt worden op drie classfiicatieproblemen.

## Introduction
* DCNN meest succesvol op CV problemen
* probleem: veel datasets, maar kleiner dan die van ImageNET.
* Transfer Learning: kennis die het algoritme verworven heeft bij het uitvoreren van een voorgaande taak meebrengen naar deze taak.
* gebruik van twee datasets:
    * Rijksmuseum
    * Beelden van Antwerpen uit het DAMS.
* drie uitdagingen:
    * herkennen van het materiaal
    * type
    * artiest
* veelbelovende resultaten

https://github.com/paintception/Deep-Transfer-Learning-for-Art-Classification-Problems

# P*rincipal Components
* twee resultaten:
    * compositionele gelijkenissen in kunstwerken
    * classificatie op basis van subject keywords --> Iconclass
    * ook testen met face recognition

# Smithsonian
* classificeren van planten

# Using Machine Learning for Identification of Art Paintings
* promising field
* classificeren van kunstwerken van 7 kunstenaars: Cézanne, Dali, Dürer, Monet, Picasso, Rembrandt en Van Gogh
* kunstenaars van wie veel kunstwerken te vinden zijn
* kunstenaars die gelijkend zijn (Monet en Cézanne), maar ook verschillend (Dürer en Dali)
* script om de afbeeldingen te vinden op Google Images
    * eerste focus op hogekwaliteitsbeelden
    * maar ook van lagere resolutie, geen verschil in classification rate van algoritme
* 200 beelden per kunstenaar, testset van 1400 beelden
* Naive Bayes classifier
* 85,13% correctheid  --> afhankelijk van grootte dataset. gok op betere resultaten wanneer de training set groter is.
* ontdekt ook gelijkenissen tussen de kunstenaars.

# Automated image analysis with IIIF
* beelden van Qatar Digital Library
* beelden van andere IIIF repositories
* hoe herkennen van beelden die visueel interessant zijn? (bv. illustraties en diagrammen in online publicaties)
* niet mogelijk om bijhorende metadata te gebruiken --> zitten in aparte EAD of MODS records; kan niet geëxtraheed worden of worden niet beschreven.
* interessante afbeeldingen op basis van kleur
* automatische tagging --> Clarifai
    * eigen custom sets maken
    * via een python script
    * zeer goede resultaten ondanks kleine sets
    * bijna 100% accuraatheid
* kleuranalyse:
    * beelden van [Internet Archive](https://archive.org) via hun experimentele [IIIF-service](https://blog.archive.org/2015/10/23/zoom-in-to-9-3-million-internet-archive-books-and-images-through-iiif/)
    * 23,000 unieke kleuren
    * regenboog: http://labs.cogapp.com/raiiinbow/
* similar beelden vinden:
    * Scikit-Learn
    * te moeilijk
* term extraction
    * Clarifai, Google Vision API en Microsoft Computer Vision
    * afbeeldingen afkomstig van Nationalmuseum Sweden via de [Europeana API](http://labs.europeana.eu/api)
    * gevisualiseerd via Searchkit en ElasticSearch
    * http://labs.cogapp.com/iiif-ml
* beste:
    * gelijkaardig
    * Google Vision API probeert meer precies te zijn
    * computer vision begint erg accuraat, eenvoudig in gebruik en een tool voor developers om data meer sense te geven.

# nog te lezen
* https://shinesolutions.com/2018/03/14/using-google-cloud-automl-vision-to-classify-poisonous-australian-spiders/
* https://medium.com/mit-technology-review/googles-self-training-ai-turns-coders-into-machine-learning-masters-6c2fe9a079a2
* https://www.christies.com/Features/A-collaboration-between-two-artists-one-human-one-a-machine-9332-1.aspx
* https://www.artnome.com/news/2018/10/13/the-truth-behind-christies-432k-ai-art-sale
* https://goberoi.com/comparing-the-top-five-computer-vision-apis-98e3e3d7c647
* https://dzone.com/articles/beginners-guide-image-recognition-and-deep-learnin

