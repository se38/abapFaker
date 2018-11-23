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

CLASS zcl_faker_address_pt_br DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_address_default
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_faker TYPE REF TO zcl_faker.

  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_faker_address_pt_br IMPLEMENTATION.

  METHOD constructor.

    super->constructor( i_faker ).

    _street_name_formats = VALUE #(
      ( `{{person-first_name}} {{address-street_suffix_long}}` )
      ( `{{person-last_name}} {{address-street_suffix_long}}` )
    ).

    _street_suffixes_long = VALUE #(
        ( |Alameda| )
        ( |Avenida| )
        ( |Beco| )
        ( |Boulevard| )
        ( |Caminho| )
        ( |Cais| )
        ( |Campo| )
        ( |Escada| )
        ( |Estrada| )
        ( |Favela| )
        ( |Fazenda| )
        ( |Floresta| )
        ( |Ilha| )
        ( |Jardim| )
        ( |Ladeira| )
        ( |Largo| )
        ( |Loteamento| )
        ( |Lugar| )
        ( |Morro| )
        ( |Parque| )
        ( |Passeio| )
        ( |Praia| )
        ( |Praça| )
        ( |Recanto| )
        ( |Rodovia| )
        ( |Rua| )
        ( |Servidao| )
        ( |Travessa| )
        ( |Via| )
        ( |Vila| )
    ).

    _street_suffixes_short = VALUE #(
        ( |Alm| )
        ( |Avn| )
        ( |Bec| )
        ( |Blv| )
        ( |Cam| )
        ( |Cas| )
        ( |Cmp| )
        ( |Esc| )
        ( |Etr| )
        ( |Fav| )
        ( |Faz| )
        ( |Flt| )
        ( |Ilh| )
        ( |Jrd| )
        ( |Lad| )
        ( |Lrg| )
        ( |Ltm| )
        ( |Lug| )
        ( |Mrr| )
        ( |Pqe| )
        ( |Pas| )
        ( |Pra| )
        ( |Prc| )
        ( |Rec| )
        ( |Rod| )
        ( |R| )
        ( |Srv| )
        ( |Trv| )
        ( |Via| )
        ( |VIL| )
    ).

    _postcode_formats = VALUE #(
      (  |#####-####| )
    ).

    _building_number_formats = VALUE #(
      ( |%####| )
      ( |%###| )
      ( |%##| )
    ).

    _city_formats = value #(
        ( `{{address-city_prefix}} {{person-first_name}}{{address-city_suffix}}` )
        ( `{{person-first_name}}{{address-city_suffix}}` )
        ( `{{address-city_prefix}} {{person-first_name}}` )
        ( `{{person-first_name}}{{address-city_suffix}}` )
        ( `{{person-last_name}}{{address-city_suffix}}` )
    ).

    _states_abbr = value #(
        ( |AL| ) ( |AK| ) ( |AS| ) ( |AZ| ) ( |AR| ) ( |CA| ) ( |CO| ) ( |CT| ) ( |DE| ) ( |DC| ) ( |FM| ) ( |FL| )
        ( |GA| ) ( |GU| ) ( |HI| ) ( |ID| ) ( |IL| ) ( |IN| ) ( |IA| ) ( |KS| ) ( |KY| ) ( |LA| ) ( |ME| ) ( |MH| )
        ( |MD| ) ( |MA| ) ( |MI| ) ( |MN| ) ( |MS| ) ( |MO| ) ( |MT| ) ( |NE| ) ( |NV| ) ( |NH| ) ( |NJ| ) ( |NM| )
        ( |NY| ) ( |NC| ) ( |ND| ) ( |MP| ) ( |OH| ) ( |OK| ) ( |OR| ) ( |PW| ) ( |PA| ) ( |PR| ) ( |RI| ) ( |SC| )
        ( |SD| ) ( |TN| ) ( |TX| ) ( |UT| ) ( |VT| ) ( |VI| ) ( |VA| ) ( |WA| ) ( |WV| ) ( |WI| ) ( |WY| )
    ).
    _city_address_formats = VALUE #(
        ( `{{address-city}}, {{address-state_abbr}} {{address-postcode}}` )
    ).

  ENDMETHOD.

ENDCLASS.
