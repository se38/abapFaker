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

CLASS zcl_faker_address_en_us DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_address_default
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_faker TYPE REF TO zcl_faker.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_address_en_us IMPLEMENTATION.

  METHOD constructor.

    super->constructor( i_faker ).

    _street_name_formats = VALUE #(
      ( `{{person-first_name}} {{address-street_suffix_long}}` )
      ( `{{person-last_name}} {{address-street_suffix_long}}` )
    ).

    _street_suffixes_long = VALUE #(
        ( |Alley| )
        ( |Avenue| )
        ( |Branch| )
        ( |Bridge| )
        ( |Brook| )
        ( |Brooks| )
        ( |Burg| )
        ( |Burgs| )
        ( |Bypass| )
        ( |Camp| )
        ( |Canyon| )
        ( |Cape| )
        ( |Causeway| )
        ( |Center| )
        ( |Centers| )
        ( |Circle| )
        ( |Circles| )
        ( |Cliff| )
        ( |Cliffs| )
        ( |Club| )
        ( |Common| )
        ( |Corner| )
        ( |Corners| )
        ( |Course| )
        ( |Court| )
        ( |Courts| )
        ( |Cove| )
        ( |Coves| )
        ( |Creek| )
        ( |Crescent| )
        ( |Crest| )
        ( |Crossing| )
        ( |Crossroad| )
        ( |Curve| )
        ( |Dale| )
        ( |Dam| )
        ( |Divide| )
        ( |Drive| )
        ( |Drive| )
        ( |Drives| )
        ( |Estate| )
        ( |Estates| )
        ( |Expressway| )
        ( |Extension| )
        ( |Extensions| )
        ( |Fall| )
        ( |Falls| )
        ( |Ferry| )
        ( |Field| )
        ( |Fields| )
        ( |Flat| )
        ( |Flats| )
        ( |Ford| )
        ( |Fords| )
        ( |Forest| )
        ( |Forge| )
        ( |Forges| )
        ( |Fork| )
        ( |Forks| )
        ( |Fort| )
        ( |Freeway| )
        ( |Garden| )
        ( |Gardens| )
        ( |Gateway| )
        ( |Glen| )
        ( |Glens| )
        ( |Green| )
        ( |Greens| )
        ( |Grove| )
        ( |Groves| )
        ( |Harbor| )
        ( |Harbors| )
        ( |Haven| )
        ( |Heights| )
        ( |Highway| )
        ( |Hill| )
        ( |Hills| )
        ( |Hollow| )
        ( |Inlet| )
        ( |Inlet| )
        ( |Island| )
        ( |Island| )
        ( |Islands| )
        ( |Islands| )
        ( |Isle| )
        ( |Isle| )
        ( |Junction| )
        ( |Junctions| )
        ( |Key| )
        ( |Keys| )
        ( |Knoll| )
        ( |Knolls| )
        ( |Lake| )
        ( |Lakes| )
        ( |Land| )
        ( |Landing| )
        ( |Lane| )
        ( |Light| )
        ( |Lights| )
        ( |Loaf| )
        ( |Lock| )
        ( |Locks| )
        ( |Locks| )
        ( |Lodge| )
        ( |Lodge| )
        ( |Loop| )
        ( |Mall| )
        ( |Manor| )
        ( |Manors| )
        ( |Meadow| )
        ( |Meadows| )
        ( |Mews| )
        ( |Mill| )
        ( |Mills| )
        ( |Mission| )
        ( |Mission| )
        ( |Motorway| )
        ( |Mount| )
        ( |Mountain| )
        ( |Mountain| )
        ( |Mountains| )
        ( |Mountains| )
        ( |Neck| )
        ( |Orchard| )
        ( |Oval| )
        ( |Overpass| )
        ( |Park| )
        ( |Parks| )
        ( |Parkway| )
        ( |Parkways| )
        ( |Pass| )
        ( |Passage| )
        ( |Path| )
        ( |Pike| )
        ( |Pine| )
        ( |Pines| )
        ( |Place| )
        ( |Plain| )
        ( |Plains| )
        ( |Plains| )
        ( |Plaza| )
        ( |Plaza| )
        ( |Point| )
        ( |Points| )
        ( |Port| )
        ( |Port| )
        ( |Ports| )
        ( |Ports| )
        ( |Prairie| )
        ( |Prairie| )
        ( |Radial| )
        ( |Ramp| )
        ( |Ranch| )
        ( |Rapid| )
        ( |Rapids| )
        ( |Rest| )
        ( |Ridge| )
        ( |Ridges| )
        ( |River| )
        ( |Road| )
        ( |Road| )
        ( |Roads| )
        ( |Roads| )
        ( |Route| )
        ( |Row| )
        ( |Rue| )
        ( |Run| )
        ( |Shoal| )
        ( |Shoals| )
        ( |Shore| )
        ( |Shores| )
        ( |Skyway| )
        ( |Spring| )
        ( |Springs| )
        ( |Springs| )
        ( |Spur| )
        ( |Spurs| )
        ( |Square| )
        ( |Square| )
        ( |Squares| )
        ( |Squares| )
        ( |Station| )
        ( |Station| )
        ( |Stravenue| )
        ( |Stravenue| )
        ( |Stream| )
        ( |Stream| )
        ( |Street| )
        ( |Street| )
        ( |Streets| )
        ( |Summit| )
        ( |Summit| )
        ( |Terrace| )
        ( |Throughway| )
        ( |Trace| )
        ( |Track| )
        ( |Trafficway| )
        ( |Trail| )
        ( |Trail| )
        ( |Tunnel| )
        ( |Tunnel| )
        ( |Turnpike| )
        ( |Turnpike| )
        ( |Underpass| )
        ( |Union| )
        ( |Unions| )
        ( |Valley| )
        ( |Valleys| )
        ( |Via| )
        ( |Viaduct| )
        ( |View| )
        ( |Views| )
        ( |Village| )
        ( |Village| )
        ( |Villages| )
        ( |Ville| )
        ( |Vista| )
        ( |Vista| )
        ( |Walk| )
        ( |Walks| )
        ( |Wall| )
        ( |Way| )
        ( |Ways| )
        ( |Well| )
        ( |Wells| )
    ).

    _postcode_formats = VALUE #(
      (  |#####| )
      (  |#####-####| )
    ).

    _building_number_formats = VALUE #(
      ( |%####| )
      ( |%###| )
      ( |%##| )
    ).

    _city_prefixes = VALUE #(
      ( |North| )
      ( |East| )
      ( |West| )
      ( |South| )
      ( |New| )
      ( |Lake| )
      ( |Port| )
    ).

    _city_suffixes = VALUE #(
        ( |town| )
        ( |ton| )
        ( |land| )
        ( |ville| )
        ( |berg| )
        ( |burgh| )
        ( |borough| )
        ( |bury| )
        ( |view| )
        ( |port| )
        ( |mouth| )
        ( |stad| )
        ( |furt| )
        ( |chester| )
        ( |mouth| )
        ( |fort| )
        ( |haven| )
        ( |side| )
        ( |shire| )
    ).

    _city_formats = value #(
        ( `{{address-city_prefix}} {{person-first_name}}{{address-city_suffix}}` )
        ( `{{person-first_name}}{{address-city_suffix}}` )
        ( `{{address-city_prefix}} {{person-first_name}}` )
        ( `{{person-first_name}}{{address-city_suffix}}` )
        ( `{{person-last_name}}{{address-city_suffix}}` )
    ).

    _city_address_formats = VALUE #(
        ( `{{address-city}} {{address-postcode}}` )
    ).

  ENDMETHOD.

ENDCLASS.
