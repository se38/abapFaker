* See https://github.com/se38/abapFaker

********************************************************************************
* The MIT License (MIT)
*
* Copyright (c) 2018 abapFaker Contributors
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
********************************************************************************

CLASS zcl_faker_address_de_de DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider_address
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_faker TYPE REF TO zcl_faker.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_address_de_de IMPLEMENTATION.

  METHOD constructor.

    super->constructor( i_faker ).

    _street_formats = VALUE #(
      ( `{{person-first_name}}-{{person-last_name}}-{{address-street_suffix_long}}` )
      ( `{{person-last_name}}{{address-street_suffix_short}}` )
    ).

    _street_suffixes_long = VALUE #(
      ( |Gasse| )
      ( |Platz| )
      ( |Ring| )
      ( |Straße| )
      ( |Weg| )
      ( |Allee| )
    ).

    _street_suffixes_short = VALUE #(
      ( |gasse| )
      ( |platz| )
      ( |ring| )
      ( |straße| )
      ( |str.| )
      ( |weg| )
      ( |allee| )
    ).

    _postcode_formats = VALUE #(
      ( |#####| )
    ).

    _building_number_formats = VALUE #(
      ( |###| )
      ( |##| )
      ( |#| )
    ).

    _city_names = VALUE #(
        ( |Aachen| ) ( |Ahaus| ) ( |Altentreptow| ) ( |Altötting| ) ( |Amberg| ) ( |Angermünde| )
        ( |Anklam| ) ( |Ansbach| ) ( |Apolda| ) ( |Arnstadt| ) ( |Artern| ) ( |Aschaffenburg| )
        ( |Aue| ) ( |Auerbach| ) ( |Augsburg| ) ( |Aurich| ) ( |Backnang| ) ( |Bad Brückenau| )
        ( |Bad Freienwalde| ) ( |Bad Kissingen| ) ( |Bad Kreuznach| ) ( |Bad Langensalza| )
        ( |Bad Liebenwerda| ) ( |Bad Mergentheim| ) ( |Badalzungen| ) ( |Badibling| )
        ( |Badoberan| ) ( |Bamberg| ) ( |Bautzen| ) ( |Bayreuth| ) ( |Beeskow| ) ( |Beilngries| )
        ( |Belzig| ) ( |Berchtesgaden| ) ( |Bergzabern| ) ( |Berlin| ) ( |Bernburg| )
        ( |Bersenbrück| ) ( |Biedenkopf| ) ( |Bischofswerda| ) ( |Bitterfeld| ) ( |Bogen| )
        ( |Borken| ) ( |Borna| ) ( |Brand| ) ( |Brandenburg| ) ( |Bremen| ) ( |Bremervörde| )
        ( |Brilon| ) ( |Bruchsal| ) ( |Burg| ) ( |Burgdorf| ) ( |Burglengenfeld| )
        ( |Böblingen| ) ( |Büsingenm Hochrhein| ) ( |Bützow| ) ( |Calau| ) ( |Calw| ) ( |Celle| )
        ( |Chemnitz| ) ( |Cloppenburg| ) ( |Coburg| ) ( |Cottbus| ) ( |Crailsheim| )
        ( |Cuxhaven| ) ( |Dachau| ) ( |Darmstadt| ) ( |Deggendorf| ) ( |Delitzsch| ) ( |Demmin| )
        ( |Dessau| ) ( |Dieburg| ) ( |Diepholz| ) ( |Dinkelsbühl| ) ( |Dinslaken| )
        ( |Donaueschingen| ) ( |Dresden| ) ( |Duderstadt| ) ( |Döbeln| ) ( |Düren| )
        ( |Ebermannstadt| ) ( |Ebern| ) ( |Ebersberg| ) ( |Eberswalde| ) ( |Eckernförde| )
        ( |Eggenfelden| ) ( |Eichstätt| ) ( |Eichstätt| ) ( |Eilenburg| ) ( |Einbeck| )
        ( |Eisenach| ) ( |Eisenberg| ) ( |Eisenhüttenstadt| ) ( |Eisleben| ) ( |Emmendingen| )
        ( |Erbisdorf| ) ( |Erding| ) ( |Erfurt| ) ( |Erkelenz| ) ( |Euskirchen| ) ( |Eutin| )
        ( |Fallingbostel| ) ( |Feuchtwangen| ) ( |Finsterwalde| ) ( |Flöha| ) ( |Forchheim| )
        ( |Forst| ) ( |Freising| ) ( |Freital| ) ( |Freudenstadt| ) ( |Fulda| )
        ( |Fürstenfeldbruck| ) ( |Fürstenwalde| ) ( |Füssen| ) ( |Gadebusch| )
        ( |Gardelegen| ) ( |Garmisch-Partenkirchen| ) ( |Geithain| ) ( |Geldern| )
        ( |Gelnhausen| ) ( |Genthin| ) ( |Gera| ) ( |Germersheim| ) ( |Gerolzhofen| )
        ( |Gießen| ) ( |Gifhorn| ) ( |Goslar| ) ( |Gotha| ) ( |Grafenau| ) ( |Gransee| )
        ( |Greifswald| ) ( |Greiz| ) ( |Grevenbroich| ) ( |Grevesmühlen| )
        ( |Griesbach Rottal| ) ( |Grimma| ) ( |Grimmen| ) ( |Groß-Gerau| ) ( |Großenhain| )
        ( |Gräfenhainichen| ) ( |Guben| ) ( |Gunzenhausen| ) ( |Göppingen| ) ( |Görlitz| )
        ( |Göttingen| ) ( |Günzburg| ) ( |Güstrow| ) ( |Gütersloh| ) ( |Hagenow| )
        ( |Hainichen| ) ( |Halberstadt| ) ( |Haldensleben| ) ( |Hamburg| ) ( |Hammelburg| )
        ( |Hannover| ) ( |Hannoversch Münden| ) ( |Hansestadttralsund| ) ( |Havelberg| )
        ( |Hechingen| ) ( |Heiligenstadt| ) ( |Heinsberg| ) ( |Helmstedt| ) ( |Herford| )
        ( |Hersbruck| ) ( |Herzberg| ) ( |Hettstedt| ) ( |Hildburghausen| ) ( |Hildesheim| )
        ( |Hofgeismar| ) ( |Hohenmölsen| ) ( |Hohenstein-Ernstthal| ) ( |Holzminden| )
        ( |Hoyerswerda| ) ( |Husum| ) ( |Höxter| ) ( |Hünfeld| ) ( |Illertissen| ) ( |Ilmenau| )
        ( |Ingolstadt| ) ( |Iserlohn| ) ( |Jena| ) ( |Jessen| ) ( |Jülich| ) ( |Jüterbog| )
        ( |Kaiserslautern| ) ( |Kamenz| ) ( |Karlsruhe| ) ( |Kassel| ) ( |Kehl| ) ( |Kelheim| )
        ( |Kemnath| ) ( |Kitzingen| ) ( |Kleve| ) ( |Klötze| ) ( |Koblenz| ) ( |Konstanz| )
        ( |Kronach| ) ( |Kulmbach| ) ( |Kusel| ) ( |Kyritz| ) ( |Königs Wusterhausen| )
        ( |Kötzting| ) ( |Leipziger Land| ) ( |Lemgo| ) ( |Lichtenfels| ) ( |Lippstadt| )
        ( |Lobenstein| ) ( |Luckau| ) ( |Luckenwalde| ) ( |Ludwigsburg| ) ( |Ludwigslust| )
        ( |Lörrach| ) ( |Lübben| ) ( |Lübeck| ) ( |Lübz| ) ( |Lüdenscheid| ) ( |Lüdinghausen| )
        ( |Lüneburg| ) ( |Magdeburg| ) ( |Main-Höchst)| ) ( |Mainburg| ) ( |Malchin| )
        ( |Mallersdorf| ) ( |Marienberg| ) ( |Marktheidenfeld| ) ( |Mayen| ) ( |Meiningen| )
        ( |Meißen| ) ( |Melle| ) ( |Mellrichstadt| ) ( |Melsungen| ) ( |Meppen| ) ( |Merseburg| )
        ( |Mettmann| ) ( |Miesbach| ) ( |Miltenberg| ) ( |Mittweida| ) ( |Moers| ) ( |Monschau| )
        ( |Mühldorfm Inn| ) ( |Mühlhausen| ) ( |München| ) ( |Nabburg| ) ( |Naila| ) ( |Nauen| )
        ( |Neu-Ulm| ) ( |Neubrandenburg| ) ( |Neunburg vorm Wald| ) ( |Neuruppin| )
        ( |Neuss| ) ( |Neustadtm Rübenberge| ) ( |Neustadtner Waldnaab| ) ( |Neustrelitz| )
        ( |Niesky| ) ( |Norden| ) ( |Nordhausen| ) ( |Northeim| ) ( |Nördlingen| )
        ( |Nürtingen| ) ( |Oberviechtach| ) ( |Ochsenfurt| ) ( |Olpe| ) ( |Oranienburg| )
        ( |Oschatz| ) ( |Osterburg| ) ( |Osterodem Harz| ) ( |Paderborn| ) ( |Parchim| )
        ( |Parsberg| ) ( |Pasewalk| ) ( |Passau| ) ( |Pegnitz| ) ( |Peine| ) ( |Perleberg| )
        ( |Pfaffenhofenner Ilm| ) ( |Pinneberg| ) ( |Pirmasens| ) ( |Plauen| ) ( |Potsdam| )
        ( |Prenzlau| ) ( |Pritzwalk| ) ( |Pößneck| ) ( |Quedlinburg| ) ( |Querfurt| )
        ( |Rastatt| ) ( |Rathenow| ) ( |Ravensburg| ) ( |Recklinghausen| ) ( |Regen| )
        ( |Regensburg| ) ( |Rehau| ) ( |Reutlingen| ) ( |Ribnitz-Damgarten| ) ( |Riesa| )
        ( |Rochlitz| ) ( |Rockenhausen| ) ( |Roding| ) ( |Rosenheim| ) ( |Rostock| ) ( |Roth| )
        ( |Rothenburg oberauber| ) ( |Rottweil| ) ( |Rudolstadt| ) ( |Saarbrücken| )
        ( |Saarlouis| ) ( |Sangerhausen| ) ( |Sankt Goar| ) ( |Sankt Goarshausen| )
        ( |Saulgau| ) ( |Scheinfeld| ) ( |Schleiz| ) ( |Schlüchtern| ) ( |Schmölln| )
        ( |Schongau| ) ( |Schrobenhausen| ) ( |Schwabmünchen| ) ( |Schwandorf| )
        ( |Schwarzenberg| ) ( |Schweinfurt| ) ( |Schwerin| ) ( |Schwäbisch Gmünd| )
        ( |Schwäbisch Hall| ) ( |Sebnitz| ) ( |Seelow| ) ( |Senftenberg| ) ( |Siegen| )
        ( |Sigmaringen| ) ( |Soest| ) ( |Soltau| ) ( |Soltau| ) ( |Sondershausen| )
        ( |Sonneberg| ) ( |Spremberg| ) ( |Stade| ) ( |Stade| ) ( |Stadtroda| )
        ( |Stadtsteinach| ) ( |Staffelstein| ) ( |Starnberg| ) ( |Staßfurt| ) ( |Steinfurt| )
        ( |Stendal| ) ( |Sternberg| ) ( |Stollberg| ) ( |Strasburg| ) ( |Strausberg| )
        ( |Stuttgart| ) ( |Suhl| ) ( |Sulzbach-Rosenberg| ) ( |Säckingen| ) ( |Sömmerda| )
        ( |Tecklenburg| ) ( |Teterow| ) ( |Tirschenreuth| ) ( |Torgau| ) ( |Tuttlingen| )
        ( |Tübingen| ) ( |Ueckermünde| ) ( |Uelzen| ) ( |Uffenheim| ) ( |Vechta| )
        ( |Viechtach| ) ( |Viersen| ) ( |Vilsbiburg| ) ( |Vohenstrauß| ) ( |Waldmünchen| )
        ( |Wanzleben| ) ( |Waren| ) ( |Warendorf| ) ( |Weimar| ) ( |Weißenfels| )
        ( |Weißwasser| ) ( |Werdau| ) ( |Wernigerode| ) ( |Wertingen| ) ( |Wesel| ) ( |Wetzlar| )
        ( |Wiedenbrück| ) ( |Wismar| ) ( |Wittenberg| ) ( |Wittmund| ) ( |Wittstock| )
        ( |Witzenhausen| ) ( |Wolfach| ) ( |Wolfenbüttel| ) ( |Wolfratshausen| ) ( |Wolgast| )
        ( |Wolmirstedt| ) ( |Worbis| ) ( |Wunsiedel| ) ( |Wurzen| ) ( |Zerbst| ) ( |Zeulenroda| )
        ( |Zossen| ) ( |Zschopau| )
    ).

    _city_formats = VALUE #(
        ( `{{address-city_name}}` )
    ).

  ENDMETHOD.

ENDCLASS.
