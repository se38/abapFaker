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

CLASS zcl_faker_company_pt_br DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_company_default
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_faker TYPE REF TO zcl_faker.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_company_pt_br IMPLEMENTATION.
  METHOD constructor.

    super->constructor( i_faker ).

    _company_suffixes = VALUE #( ( |S/A| ) ( |S.A.| ) ( |Ltda.| ) ( |- ME| ) ( |- EI| ) ( |e Filhos| ) ).

    _catch_phrase_words_part_1 = VALUE #(
        ( |a segurança| )
        ( |o prazer| )
        ( |o conforto| )
        ( |a simplicidade| )
        ( |a certeza| )
        ( |a arte| )
        ( |o poder| )
        ( |o direito| )
        ( |a possibilidade| )
        ( |a vantagem| )
        ( |a liberdade| )
    ).

    _catch_phrase_words_part_2 = VALUE #(
        ( |de conseguir| )
        ( |de avançar| )
        ( |de evoluir| )
        ( |de mudar| )
        ( |de inovar| )
        ( |de ganhar| )
        ( |de atingir seus objetivos| )
        ( |de concretizar seus projetos| )
        ( |de realizar seus sonhos | )
    ).

    _catch_phrase_words_part_3 = VALUE #(
        ( |de maneira eficaz| )
        ( |mais rapidamente| )
        ( |mais facilmente| )
        ( |simplesmente| )
        ( |com toda a tranquilidade| )
        ( |antes de tudo| )
        ( |naturalmente| )
        ( |sem preocupação| )
        ( |em estado puro| )
        ( |com força total| )
        ( |direto da fonte| )
        ( |com confiança| )
    ).

  ENDMETHOD.

ENDCLASS.
