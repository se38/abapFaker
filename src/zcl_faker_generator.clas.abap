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

CLASS zcl_faker_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CONSTANTS __locale_default TYPE string VALUE 'DEFAULT'.

    CLASS-METHODS create
      IMPORTING i_type          TYPE string
                i_locale        TYPE string
                i_faker         TYPE REF TO zcl_faker
      RETURNING VALUE(r_result) TYPE REF TO zcl_faker_provider.

ENDCLASS.



CLASS zcl_faker_generator IMPLEMENTATION.
  METHOD create.
    DATA(class_name) = |ZCL_FAKER_{ i_type }_{ i_locale CASE = UPPER }|.

    TRY.
        CREATE OBJECT r_result TYPE (class_name)
          EXPORTING i_faker = i_faker.
      CATCH cx_sy_create_object_error.
        class_name = |ZCL_FAKER_{ i_type }_{ __locale_default CASE = UPPER }|.
        CREATE OBJECT r_result TYPE (class_name)
          EXPORTING i_faker = i_faker.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
