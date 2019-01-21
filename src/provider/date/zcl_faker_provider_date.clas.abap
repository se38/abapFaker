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

CLASS zcl_faker_provider_date DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS date
      RETURNING VALUE(r_result) TYPE string.
    METHODS today
      RETURNING VALUE(r_result) TYPE string.
    METHODS tomorrow
      RETURNING VALUE(r_result) TYPE string.
    METHODS yesterday
      RETURNING VALUE(r_result) TYPE string.
    METHODS date_of_birth
      RETURNING VALUE(r_result) TYPE string.
    METHODS date_of_birth_adult
      RETURNING VALUE(r_result) TYPE string.

  PROTECTED SECTION.
    DATA _format TYPE string.

  PRIVATE SECTION.
    METHODS get_date
      IMPORTING i_min_years     TYPE i OPTIONAL
                i_max_years     TYPE i DEFAULT 500
                i_future        TYPE boolean OPTIONAL
      RETURNING VALUE(r_result) TYPE d.
    METHODS format
      IMPORTING i_date          TYPE d
      RETURNING VALUE(r_result) TYPE string.

ENDCLASS.



CLASS zcl_faker_provider_date IMPLEMENTATION.

  METHOD date.
    r_result = format( get_date( ) ).
  ENDMETHOD.

  METHOD date_of_birth.
    r_result = format( get_date(
                         i_max_years = 100
                       )
                     ).
  ENDMETHOD.

  METHOD date_of_birth_adult.
    r_result = format( get_date(
                         i_min_years = 18
                         i_max_years = 100
                       )
                     ).
  ENDMETHOD.

  METHOD today.
    r_result = format( sy-datum ).
  ENDMETHOD.

  METHOD tomorrow.
    r_result = format( CONV d( sy-datum + 1 ) ).
  ENDMETHOD.

  METHOD yesterday.
    r_result = format( CONV d( sy-datum - 1 ) ).
  ENDMETHOD.

  METHOD get_date.

    DATA(max_days) = i_max_years * 365.
    DATA(min_days) = i_min_years * 365.

    DATA(days) = random(
                 i_from   = min_days
                 i_to     = max_days
             ).

    r_result = SWITCH #( i_future
                         WHEN abap_true  THEN sy-datum + days
                         WHEN abap_false THEN sy-datum - days ).

  ENDMETHOD.

  METHOD format.

    r_result = _format.
    REPLACE 'YYYY' IN r_result WITH i_date(4).
    REPLACE 'MM'   IN r_result WITH i_date+4(2).
    REPLACE 'DD'   IN r_result WITH i_date+6(2).

  ENDMETHOD.

ENDCLASS.
