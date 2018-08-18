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

CLASS zcl_faker_provider_person DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider
  ABSTRACT.

  PUBLIC SECTION.
    METHODS first_name_female
      RETURNING VALUE(r_result) TYPE string.
    METHODS first_name_male
      RETURNING VALUE(r_result) TYPE string.
    METHODS first_name
      RETURNING VALUE(r_result) TYPE string.
    METHODS last_name
      RETURNING VALUE(r_result) TYPE string.
    METHODS name
      RETURNING VALUE(r_result) TYPE string.

  PROTECTED SECTION.
    DATA _first_names_male TYPE string_table.
    DATA _first_names_female TYPE string_table.
    DATA _last_names TYPE string_table.

  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_faker_provider_person IMPLEMENTATION.

  METHOD name.
    r_result = |{ first_name( ) } { last_name( ) }|.
  ENDMETHOD.

  METHOD first_name.
    r_result = SWITCH #(
      random( 2 )
      WHEN 1 THEN first_name_female( )
      WHEN 2 THEN first_name_male( )
    ).
  ENDMETHOD.

  METHOD first_name_male.
    r_result = _first_names_male[ random( lines( _first_names_male ) ) ].
  ENDMETHOD.

  METHOD first_name_female.
    r_result = _first_names_female[ random( lines( _first_names_female ) ) ].
  ENDMETHOD.

  METHOD last_name.
    r_result = _last_names[ random( lines( _last_names ) ) ].
  ENDMETHOD.

ENDCLASS.
