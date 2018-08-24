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

CLASS zcl_faker_provider_job DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider
  ABSTRACT .

  PUBLIC SECTION.
    METHODS job_title
      RETURNING VALUE(r_result) TYPE string.

  PROTECTED SECTION.
    DATA _job_titles TYPE string_table.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_provider_job IMPLEMENTATION.

  METHOD job_title.
    r_result = _job_titles[ random( lines( _job_titles ) ) ].
  ENDMETHOD.

ENDCLASS.
