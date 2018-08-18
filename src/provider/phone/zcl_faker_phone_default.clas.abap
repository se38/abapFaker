CLASS zcl_faker_phone_default DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider_phone
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_faker TYPE REF TO zcl_faker.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_phone_default IMPLEMENTATION.
  METHOD constructor.

    super->constructor( i_faker ).

    _formats = VALUE #(
      ( |+1 555-%####| )
    ).

  ENDMETHOD.

ENDCLASS.
