## bachelorproef

Bachelorproef en voorstle in tex voor het behalen van de titel professionele bachelor in de toegepaste informatica.

Vind hier het [voorstel](voorstel/vanderperren_nastasia_voorstel.pdf) en de [bachelorproef](paper/bachproef-tin.pdf).

## Inhoud

* [paper](paper): bestanden (vnl. .tex, maar ook een pdf) waarin de bachelorproef geschreven wordt [[PDF](paper/bachproef-tin.pdf)]
* [research](research): alles met betrekking tot het gevoerde onderzoek. Clarifai werd gebruikt om het onderzoek uit te voeren omdat die over goede documentatie beschikte en het mogelijk is om eigen modellen te maken, zelfs met een grafische inteface voor mensen met een minder technische achtergrond. Je kan volgende zaken in deze map vinden:
  * [dataset](reseach/dataset): bevat de gebruikte dataset en enkele delen van de dataset om kleinere testen te doen;
  * [models-info](research/models-info): bevat txt-bestanden met de concepten die terug te vinden zijn in de gebruikte built-in modellen van Clarifai;
  * [output](research/output): bevat de responses in JSON die ontvangen werden van de Clarifai API;
  * [results](research/result): alle JSON-responses werden samengevoegd in één CSV-bestand met de informatie die nodig was voor validatie: URL van het beeldbestand, de naam van het gebruikte model en de tags (namen + percentages) voor ieder beeldbestand. Per gebruikt model werd een apart CSV-bestand gemaakt.
  * [scripts](research/scripts): alle scripts die geschreven werden voor het uitvoeren van het onderzoek, gaande van het extraheren van alle informatie van de beeldbestanden tot het extraheren van de nodige informatie uit de JSON-bestanden voor de CSV's.
* [vooronderzoek](vooronderzoek): In deze map kan je alle testen vinden die gedaan werden om mij de gebruikte software eigen te maken.
* [voorstel](voorstel): het originele voorstel dat ingediend werd voor het uitvoeren van dit onderzoek. In [Bronnen](voorstel/bronnen/bronnen.md) kan je de verzamelde bronnen lezen voor het maken van het voorstel. [[PDF](voorstel/vanderperren_nastasia_voorstel.pdf)]
