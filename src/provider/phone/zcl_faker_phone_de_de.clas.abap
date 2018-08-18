CLASS zcl_faker_phone_de_de DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider_phone
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_faker TYPE REF TO zcl_faker.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_phone_de_de IMPLEMENTATION.
  METHOD constructor.

    super->constructor( i_faker ).

    _formats = VALUE #(
        ( |+49(0)##########| )
        ( |+49(0)#### ######| )
        ( |+49 (0) #### ######| )
        ( |+49(0) #########| )
        ( |+49(0)#### #####| )
        ( |0##########| )
        ( |0#########| )
        ( |0#### ######| )
        ( |0#### #####| )
        ( |(0####) ######| )
        ( |(0####) #####| )
    ).

  ENDMETHOD.

ENDCLASS.
