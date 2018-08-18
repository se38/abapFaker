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

CLASS zcl_faker_provider_company DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider
  ABSTRACT .

  PUBLIC SECTION.
    METHODS company_name
      RETURNING VALUE(r_result) TYPE string.
    METHODS company_frame
      RETURNING VALUE(r_result) TYPE string.
    METHODS company_suffix
      RETURNING VALUE(r_result) TYPE string.
    METHODS catch_phrase_words_part_1
      RETURNING VALUE(r_result) TYPE string.
    METHODS catch_phrase_words_part_2
      RETURNING VALUE(r_result) TYPE string.
    METHODS catch_phrase_words_part_3
      RETURNING VALUE(r_result) TYPE string.
    METHODS bs_words_part_1
      RETURNING VALUE(r_result) TYPE string.
    METHODS bs_words_part_2
      RETURNING VALUE(r_result) TYPE string.
    METHODS bs_words_part_3
      RETURNING VALUE(r_result) TYPE string.

  PROTECTED SECTION.
    DATA _formats TYPE string_table.
    data _frame_formats TYPE string_table.
    DATA _company_suffixes TYPE string_table.
    DATA _catch_phrase_words_part_1 TYPE string_table.
    DATA _catch_phrase_words_part_2 TYPE string_table.
    DATA _catch_phrase_words_part_3 TYPE string_table.
    DATA _bs_words_part_1 TYPE string_table.
    DATA _bs_words_part_2 TYPE string_table.
    DATA _bs_words_part_3 TYPE string_table.


  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_provider_company IMPLEMENTATION.

  METHOD company_name.
    r_result = formatter( _formats[ random( lines( _formats ) ) ] ).
  ENDMETHOD.

  METHOD bs_words_part_1.
    r_result = _bs_words_part_1[ random( lines( _bs_words_part_1 ) ) ].
  ENDMETHOD.

  METHOD bs_words_part_2.
    r_result = _bs_words_part_2[ random( lines( _bs_words_part_2 ) ) ].
  ENDMETHOD.

  METHOD bs_words_part_3.
    r_result = _bs_words_part_3[ random( lines( _bs_words_part_3 ) ) ].
  ENDMETHOD.

  METHOD catch_phrase_words_part_1.
    r_result = _catch_phrase_words_part_1[ random( lines( _catch_phrase_words_part_1 ) ) ].
  ENDMETHOD.

  METHOD catch_phrase_words_part_2.
    r_result = _catch_phrase_words_part_2[ random( lines( _catch_phrase_words_part_2 ) ) ].
  ENDMETHOD.

  METHOD catch_phrase_words_part_3.
    r_result = _catch_phrase_words_part_3[ random( lines( _catch_phrase_words_part_3 ) ) ].
  ENDMETHOD.

  METHOD company_suffix.
    r_result = _company_suffixes[ random( lines( _company_suffixes ) ) ].
  ENDMETHOD.

  METHOD company_frame.
    r_result = formatter( _frame_formats[ random( lines( _frame_formats ) ) ] ).
  ENDMETHOD.

ENDCLASS.
