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


https://github.com/paintception/Deep-Transfer-Learning-for-Art-Classification-Problems

# nog te lezen
* https://shinesolutions.com/2018/03/14/using-google-cloud-automl-vision-to-classify-poisonous-australian-spiders/
* https://medium.com/mit-technology-review/googles-self-training-ai-turns-coders-into-machine-learning-masters-6c2fe9a079a2
* https://www.christies.com/Features/A-collaboration-between-two-artists-one-human-one-a-machine-9332-1.aspx
* https://www.artnome.com/news/2018/10/13/the-truth-behind-christies-432k-ai-art-sale
* https://goberoi.com/comparing-the-top-five-computer-vision-apis-98e3e3d7c647
* https://dzone.com/articles/beginners-guide-image-recognition-and-deep-learnin

