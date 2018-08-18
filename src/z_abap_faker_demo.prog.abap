*&---------------------------------------------------------------------*
*& Report YSTSTF00
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
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
*    DATA(faker) = NEW zcl_faker( ).

    DO 10 TIMES.
      cl_demo_output=>write(
        |{ faker->person->first_name( ) } { faker->person->last_name( ) }\n| &&
        |{ faker->address->street_name( ) } { faker->address->building_number( ) }\n| &&
        |{ faker->address->post_code( ) } { faker->address->city( ) }\n| &&
        |Phone { faker->phone->number( ) }|
      ).
    ENDDO.

    cl_demo_output=>display( ).
  ENDMETHOD.

ENDCLASS.
