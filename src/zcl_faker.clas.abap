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


"! <p class="shorttext synchronized" lang="en">ABAP Faker</p>
"! Inspired by https://github.com/joke2k/faker
CLASS zcl_faker DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA person TYPE REF TO zcl_faker_provider_person.
    DATA phone TYPE REF TO zcl_faker_provider_phone.
    DATA address TYPE REF TO zcl_faker_provider_address.
    DATA company TYPE REF TO zcl_faker_provider_company.
    DATA job TYPE REF TO zcl_faker_provider_job.

    METHODS constructor
      IMPORTING i_locale TYPE string OPTIONAL.

  PRIVATE SECTION.
    DATA _locale TYPE string.

    METHODS get_locale
      RETURNING VALUE(r_result) TYPE string.

ENDCLASS.



CLASS zcl_faker IMPLEMENTATION.
  METHOD constructor.

    _locale = SWITCH #( i_locale
                WHEN `` THEN get_locale( )
                ELSE i_locale
              ).

    person  ?= zcl_faker_generator=>create(
                 i_type   = 'PERSON'
                 i_locale = _locale
                 i_faker  = me
               ).

    phone   ?= zcl_faker_generator=>create(
                 i_type   = 'PHONE'
                 i_locale = _locale
                 i_faker  = me
               ).

    address ?= zcl_faker_generator=>create(
                 i_type   = 'ADDRESS'
                 i_locale = _locale
                 i_faker  = me
               ).

    company ?= zcl_faker_generator=>create(
                 i_type   = 'COMPANY'
                 i_locale = _locale
                 i_faker  = me
               ).

    job ?= zcl_faker_generator=>create(
                 i_type   = 'JOB'
                 i_locale = _locale
                 i_faker  = me
               ).

  ENDMETHOD.

  METHOD get_locale.

    DATA user_address TYPE addr3_val.

    CALL FUNCTION 'SUSR_USER_ADDRESS_READ'
      EXPORTING
        user_name    = sy-uname    " User Name
      IMPORTING
        user_address = user_address    " Address data in CAM structure
      EXCEPTIONS
        OTHERS       = 0.

    DATA language TYPE c LENGTH 2.
    WRITE user_address-langu TO language.

    IF language IS INITIAL
    OR user_address-country IS INITIAL.
      r_result = zcl_faker_generator=>__locale_default.
    ENDIF.

    r_result = |{ language CASE = LOWER }_{ user_address-country }|.
  ENDMETHOD.

ENDCLASS.
