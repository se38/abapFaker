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

CLASS zcl_faker_provider_phone DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider
  ABSTRACT .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_faker TYPE REF TO zcl_faker.
    METHODS number
      RETURNING VALUE(r_result) TYPE string.
    METHODS label
      RETURNING VALUE(r_result) TYPE string.

  PROTECTED SECTION.
    DATA _formats TYPE string_table.
    DATA _label TYPE string.

  PRIVATE SECTION.
    METHODS get_label
      RETURNING
        value(r_result) TYPE string.

ENDCLASS.



CLASS zcl_faker_provider_phone IMPLEMENTATION.

  METHOD number.
    r_result = numerify( _formats[ random( lines( _formats ) ) ] ).
  ENDMETHOD.

  METHOD label.
    r_result = _label.
  ENDMETHOD.

  METHOD constructor.

    super->constructor( i_faker ).
    _label = get_label( ).

  ENDMETHOD.


  METHOD get_label.

    DATA(language) = _faker->get_language( ).

    SELECT scrtext_s
      INTO @r_result
      UP TO 1 ROWS
      FROM dd04t
      WHERE rollname = 'AD_TLNMBR1'  ##no_text
      AND   ddlanguage = @language.
    ENDSELECT.

  ENDMETHOD.

ENDCLASS.
