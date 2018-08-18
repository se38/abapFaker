CLASS zcl_faker_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CONSTANTS __locale_default TYPE string VALUE 'DEFAULT'.

    CLASS-METHODS create
      IMPORTING i_type          TYPE string
                i_locale        TYPE string
                i_faker         TYPE REF TO zcl_faker
      RETURNING VALUE(r_result) TYPE REF TO zcl_faker_provider.

ENDCLASS.



CLASS zcl_faker_generator IMPLEMENTATION.
  METHOD create.
    DATA(class_name) = |ZCL_FAKER_{ i_type }_{ i_locale CASE = UPPER }|.

    TRY.
        CREATE OBJECT r_result TYPE (class_name)
          EXPORTING i_faker = i_faker.
      CATCH cx_sy_create_object_error.
        class_name = |ZCL_FAKER_{ i_type }_{ __locale_default CASE = UPPER }|.
        CREATE OBJECT r_result TYPE (class_name)
          EXPORTING i_faker = i_faker.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
