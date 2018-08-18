CLASS zcl_faker_provider_person DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider
  ABSTRACT.

  PUBLIC SECTION.
    METHODS first_name_female
      RETURNING VALUE(r_result) TYPE string.
    METHODS first_name_male
      RETURNING VALUE(r_result) TYPE string.
    METHODS first_name
      RETURNING VALUE(r_result) TYPE string.
    METHODS last_name
      RETURNING VALUE(r_result) TYPE string.
    METHODS name
      RETURNING VALUE(r_result) TYPE string.

  PROTECTED SECTION.
    DATA _first_names_male TYPE string_table.
    DATA _first_names_female TYPE string_table.
    DATA _last_names TYPE string_table.

  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_faker_provider_person IMPLEMENTATION.

  METHOD name.
    r_result = |{ first_name( ) } { last_name( ) }|.
  ENDMETHOD.

  METHOD first_name.
    r_result = SWITCH #(
      random( 2 )
      WHEN 1 THEN first_name_female( )
      WHEN 2 THEN first_name_male( )
    ).
  ENDMETHOD.

  METHOD first_name_male.
    r_result = _first_names_male[ random( lines( _first_names_male ) ) ].
  ENDMETHOD.

  METHOD first_name_female.
    r_result = _first_names_female[ random( lines( _first_names_female ) ) ].
  ENDMETHOD.

  METHOD last_name.
    r_result = _last_names[ random( lines( _last_names ) ) ].
  ENDMETHOD.

ENDCLASS.
