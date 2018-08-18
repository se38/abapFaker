CLASS zcl_faker_provider_phone DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider
  ABSTRACT .

  PUBLIC SECTION.
    METHODS number
      RETURNING VALUE(r_result) TYPE string.

  PROTECTED SECTION.
    DATA _formats TYPE string_table.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_provider_phone IMPLEMENTATION.

  METHOD number.
    r_result = numerify( _formats[ random( lines( _formats ) ) ] ).
  ENDMETHOD.

ENDCLASS.
