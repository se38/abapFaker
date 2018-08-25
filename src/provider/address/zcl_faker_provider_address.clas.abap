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

CLASS zcl_faker_provider_address DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider
  ABSTRACT .

  PUBLIC SECTION.
    METHODS street_name
      RETURNING VALUE(r_result) TYPE string.
    METHODS street_address
      RETURNING VALUE(r_result) TYPE string.
    METHODS street_suffix_long
      RETURNING VALUE(r_result) TYPE string.
    METHODS street_suffix_short
      RETURNING VALUE(r_result) TYPE string.
    METHODS postcode
      RETURNING VALUE(r_result) TYPE string.
    METHODS building_number
      RETURNING VALUE(r_result) TYPE string.
    METHODS city_prefix
      RETURNING VALUE(r_result) TYPE string.
    METHODS city_suffix
      RETURNING VALUE(r_result) TYPE string.
    METHODS city_name
      RETURNING VALUE(r_result) TYPE string.
    METHODS city
      RETURNING VALUE(r_result) TYPE string.
    METHODS city_address
      RETURNING VALUE(r_result) TYPE string.

  PROTECTED SECTION.
    DATA _street_name_formats TYPE string_table.
    DATA _street_address_formats TYPE string_table.
    DATA _street_suffixes_long TYPE string_table.
    DATA _street_suffixes_short TYPE string_table.
    DATA _building_number_formats TYPE string_table.
    DATA _postcode_formats TYPE string_table.
    DATA _city_prefixes TYPE string_table.
    DATA _city_suffixes TYPE string_table.
    DATA _city_names TYPE string_table.
    DATA _city_formats TYPE string_table.
    DATA _city_address_formats TYPE string_table.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_provider_address IMPLEMENTATION.

  METHOD street_name.
    r_result = formatter( _street_name_formats[ random( lines( _street_name_formats ) ) ] ).
  ENDMETHOD.

  METHOD street_suffix_long.
    r_result = _street_suffixes_long[ random( lines( _street_suffixes_long ) ) ].
  ENDMETHOD.

  METHOD street_suffix_short.
    r_result = _street_suffixes_short[ random( lines( _street_suffixes_short ) ) ].
  ENDMETHOD.

  METHOD postcode.
    r_result = numerify( _postcode_formats[ random( lines( _postcode_formats ) ) ] ).
  ENDMETHOD.

  METHOD building_number.
    r_result = numerify( _building_number_formats[ random( lines( _building_number_formats ) ) ] ).
  ENDMETHOD.

  METHOD city_prefix.
    r_result = _city_prefixes[ random( lines( _city_prefixes ) ) ].
  ENDMETHOD.

  METHOD city_suffix.
    r_result = _city_suffixes[ random( lines( _city_suffixes ) ) ].
  ENDMETHOD.

  METHOD city_name.
    r_result = _city_names[ random( lines( _city_names ) ) ].
  ENDMETHOD.

  METHOD city.
    r_result = formatter( _city_formats[ random( lines( _city_formats ) ) ] ).
  ENDMETHOD.

  METHOD street_address.
    r_result = formatter( _street_address_formats[ random( lines( _street_address_formats ) ) ] ).
  ENDMETHOD.

  METHOD city_address.
    r_result = formatter( _city_address_formats[ random( lines( _city_address_formats ) ) ] ).
  ENDMETHOD.

ENDCLASS.
