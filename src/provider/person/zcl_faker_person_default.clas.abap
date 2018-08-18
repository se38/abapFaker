CLASS zcl_faker_person_default DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider_person
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_faker TYPE REF TO zcl_faker.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_person_default IMPLEMENTATION.

  METHOD constructor.

    super->constructor( i_faker ).

    _first_names_male = VALUE #(
      ( |Mickey| )
    ).

    _first_names_female = VALUE #(
      ( |Minnie| )
    ).

    _last_names = VALUE #(
      ( |Mouse| )
    ).

  ENDMETHOD.

ENDCLASS.
