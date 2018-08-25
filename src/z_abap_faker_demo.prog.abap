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

REPORT z_abap_faker_demo.

CLASS app DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS main.

ENDCLASS.

NEW app( )->main( ).

CLASS app IMPLEMENTATION.

  METHOD main.
    DATA(faker) = NEW zcl_faker( 'en_US' ).
*    DATA(faker) = NEW zcl_faker( 'en_xx' ).


    DO 10 TIMES.
      cl_demo_output=>write(
        |{ faker->person->first_name( ) } { faker->person->last_name( ) }\n| &&
        |{ faker->address->street_address( ) }\n| &&
        |{ faker->address->city_address( ) }\n\n| &&
        |Phone { faker->phone->number( ) }\n| &&
        |{ faker->company->company_name( ) }\n| &&
        |{ faker->job->job_title( ) }\n| &&
        |{ sy-uline }|
      ).
    ENDDO.

    faker = NEW zcl_faker( 'de_DE' ).

    DO 10 TIMES.
      cl_demo_output=>write(
        |{ faker->person->first_name( ) } { faker->person->last_name( ) }\n| &&
        |{ faker->address->street_address( ) }\n| &&
        |{ faker->address->city_address( ) }\n\n| &&
        |Telefon { faker->phone->number( ) }\n| &&
        |{ faker->company->company_name( ) }\n| &&
        |{ faker->job->job_title( ) }\n| &&
        |{ sy-uline }|
      ).
    ENDDO.

    cl_demo_output=>display( ).
  ENDMETHOD.

ENDCLASS.
