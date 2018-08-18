CLASS zcl_faker_phone_en_us DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider_phone
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_faker TYPE REF TO zcl_faker.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_phone_en_us IMPLEMENTATION.
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
