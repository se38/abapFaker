CLASS zcl_faker_provider_address DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_provider
  ABSTRACT .

  PUBLIC SECTION.
    METHODS street_name
      RETURNING VALUE(r_result) TYPE string.
    METHODS street_suffix_long
      RETURNING VALUE(r_result) TYPE string.
    METHODS street_suffix_short
      RETURNING VALUE(r_result) TYPE string.
    METHODS post_code
      RETURNING VALUE(r_result) TYPE string.
    METHODS building_number
      RETURNING VALUE(r_result) TYPE string.
    METHODS city_prefix
      RETURNING VALUE(r_result) TYPE string.
    METHODS city_suffix
      RETURNING VALUE(r_result) TYPE string.
    METHODS city_name
      RETURNING VALUE(r_result) TYPE string.
    METHODS city
      RETURNING VALUE(r_result) TYPE string.

  PROTECTED SECTION.
    DATA _street_formats TYPE string_table.
    DATA _street_suffixes_long TYPE string_table.
    DATA _street_suffixes_short TYPE string_table.
    DATA _building_number_formats TYPE string_table.
    DATA _postcode_formats TYPE string_table.
    DATA _city_prefixes TYPE string_table.
    DATA _city_suffixes TYPE string_table.
    DATA _city_names TYPE string_table.
    DATA _city_formats TYPE string_table.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_provider_address IMPLEMENTATION.

  METHOD street_name.
    r_result = formatter( _street_formats[ random( lines( _street_formats ) ) ] ).
  ENDMETHOD.

  METHOD street_suffix_long.
    r_result = _street_suffixes_long[ random( lines( _street_suffixes_long ) ) ].
  ENDMETHOD.

  METHOD street_suffix_short.
    r_result = _street_suffixes_short[ random( lines( _street_suffixes_short ) ) ].
  ENDMETHOD.

  METHOD post_code.
    r_result = numerify( _postcode_formats[ random( lines( _postcode_formats ) ) ] ).
  ENDMETHOD.

  METHOD building_number.
    r_result = numerify( _building_number_formats[ random( lines( _building_number_formats ) ) ] ).
  ENDMETHOD.

  METHOD city_prefix.
    r_result = _city_prefixes[ random( lines( _city_prefixes ) ) ].
  ENDMETHOD.

  METHOD city_suffix.
    r_result = _city_suffixes[ random( lines( _city_suffixes ) ) ].
  ENDMETHOD.

  METHOD city_name.
    r_result = _city_names[ random( lines( _city_names ) ) ].
  ENDMETHOD.

  METHOD city.
    r_result = formatter( _city_formats[ random( lines( _city_formats ) ) ] ).
  ENDMETHOD.

ENDCLASS.
