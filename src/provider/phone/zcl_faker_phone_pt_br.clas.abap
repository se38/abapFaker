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

CLASS zcl_faker_phone_pt_br DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_phone_default
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_faker TYPE REF TO zcl_faker.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_phone_pt_br IMPLEMENTATION.
  METHOD constructor.

    super->constructor( i_faker ).

    _formats = VALUE #(
        ( |+##(#)##########| )
        ( |+##(#)##########| )
        ( |0##########| )
        ( |0##########| )
        ( |###-###-####| )
        ( |(###)###-####| )
        ( |1-###-###-####| )
        ( |###.###.####| )
        ( |###-###-####| )
        ( |(###)###-####| )
        ( |1-###-###-####| )
        ( |###.###.####| )
        ( |###-###-####x###| )
        ( |(###)###-####x###| )
        ( |1-###-###-####x###| )
        ( |###.###.####x###| )
        ( |###-###-####x####| )
        ( |(###)###-####x####| )
        ( |1-###-###-####x####| )
        ( |###.###.####x####| )
        ( |###-###-####x#####| )
        ( |(###)###-####x#####| )
        ( |1-###-###-####x#####| )
        ( |###.###.####x#####| )
    ).

  ENDMETHOD.

ENDCLASS.
