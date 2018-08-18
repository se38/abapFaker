CLASS zcl_faker_address_default DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider_address
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_faker TYPE REF TO zcl_faker.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_address_default IMPLEMENTATION.

  METHOD constructor.

    super->constructor( i_faker ).

    _street_formats = VALUE #(
      ( `{{person-first_name}}-{{person-last_name}}-Street` )
    ).

    _postcode_formats = VALUE #(
      ( |#####| )
    ).

    _building_number_formats = VALUE #(
      ( |###| )
      ( |##| )
      ( |#| )
    ).

    _city_names = VALUE #(
        ( |Ducktown| )     ).

    _city_formats = VALUE #(
        ( `{{address-city_name}}` )
    ).

  ENDMETHOD.

ENDCLASS.
