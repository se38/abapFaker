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

CLASS zcl_faker_provider DEFINITION
  PUBLIC
  ABSTRACT .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_faker TYPE REF TO zcl_faker.

  PROTECTED SECTION.
    DATA _seed TYPE t.
    DATA _faker TYPE REF TO zcl_faker.

    METHODS formatter
      IMPORTING i_format        TYPE string
      RETURNING VALUE(r_result) TYPE string.

    METHODS random
      IMPORTING i_from          TYPE i DEFAULT 1
                i_to            TYPE i
      RETURNING VALUE(r_result) TYPE i.

    "!  Replaces all placeholders in given text with randomized values,
    "!  replacing: all hash sign ('#') occurrences with a random digit
    "!  (from 0 to 9); all percentage sign ('%') occurrences with a
    "!  random non-zero digit (from 1 to 9); all exclamation mark ('!')
    "!  occurrences with a random digit (from 0 to 9) or an empty string;
    "!  and all "at"-symbol occurrences with a random non-zero digit
    "!  (from 1 to 9) or an empty string.
    "!
    "! @parameter i_text | text with placeholders
    "! @parameter r_result | result
    METHODS numerify
      IMPORTING i_text          TYPE string DEFAULT '###'
      RETURNING VALUE(r_result) TYPE string.

    METHODS random_letter
      IMPORTING i_upper         TYPE boolean DEFAULT abap_true
                i_lower         TYPE boolean DEFAULT abap_false
      RETURNING VALUE(r_result) TYPE char01.

  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_faker_provider IMPLEMENTATION.

  METHOD constructor.
    _faker = i_faker.
  ENDMETHOD.

  METHOD random.

    GET TIME.
    IF _seed IS INITIAL.
      _seed = sy-timlo.
    ELSE.
      _seed = _seed + 1.
    ENDIF.

    TRY.
        r_result = cl_abap_random_int=>create(
                     seed           = CONV #( _seed )
                     min            = i_from
                     max            = i_to
                   )->get_next( ).
      CATCH cx_abap_random ##no_handler.
    ENDTRY.

  ENDMETHOD.

  METHOD numerify.

    r_result = i_text.

    DO.
      DATA(found) = abap_false.

      DATA(digit) = |{ random( i_from = 0 i_to = 9 ) WIDTH = 1 }|.

      REPLACE '#' WITH digit INTO r_result.
      IF sy-subrc = 0.
        found = abap_true.
      ENDIF.

      digit = |{ random( i_from = 1 i_to = 9 ) WIDTH = 1 }|.

      REPLACE '%' WITH digit INTO r_result.
      IF sy-subrc = 0.
        found = abap_true.
      ENDIF.

      DATA(number) = random( i_from = 0 i_to = 10 ).
      IF number = 10.
        digit = ` `.
      ELSE.
        digit = |{ number WIDTH = 1 }|.
      ENDIF.

      REPLACE '!' WITH digit INTO r_result.
      IF sy-subrc = 0.
        found = abap_true.
      ENDIF.

      number = random( i_from = 1 i_to = 10 ).
      IF number = 10.
        digit = ` `.
      ELSE.
        digit = |{ number WIDTH = 1 }|.
      ENDIF.

      REPLACE '@' WITH digit INTO r_result.
      IF sy-subrc = 0.
        found = abap_true.
      ENDIF.

      IF found = abap_false.
        EXIT.
      ENDIF.

    ENDDO.

  ENDMETHOD.

  METHOD formatter.

    r_result = i_format.


    DO.
      FIND REGEX '\{\{(\w+)-(\w+)\}\}' IN r_result SUBMATCHES DATA(provider_name) DATA(method).
      IF sy-subrc <> 0.
        EXIT.
      ENDIF.

      DATA value TYPE string.
      CLEAR value.

      DATA provider TYPE REF TO zcl_faker_provider.
      CASE provider_name.
        WHEN 'person'.
          provider ?= _faker->person.
        WHEN 'phone'.
          provider ?= _faker->phone.
        WHEN 'address'.
          provider ?= _faker->address.
        WHEN 'company'.
          provider ?= _faker->company.
      ENDCASE.

      IF provider IS BOUND.
        method = to_upper( method ).
        TRY.
            CALL METHOD provider->(method)
              RECEIVING
                r_result = value.
          CATCH cx_sy_dyn_call_illegal_method.
            value = |Not found: { provider_name }->{ method }|.
        ENDTRY.
      ELSE.
        value = |Provider for type { provider_name } not bound|.
      ENDIF.

      REPLACE REGEX '\{\{(\w+)-(\w+)\}\}' IN r_result WITH value.
    ENDDO.

  ENDMETHOD.

  METHOD random_letter.

    DATA(offset) = random( strlen( sy-abcde ) ) - 1.
    r_result = sy-abcde+offset(1).

    IF  i_upper = abap_false
    AND i_lower = abap_true.
      "lower chars only
      r_result = to_lower( r_result ).
    ELSEIF i_upper = abap_true
    AND i_lower = abap_true.
      "random lower and upper chars
      IF random( 2 ) = 2.
        r_result = to_lower( r_result ).
      ENDIF.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
