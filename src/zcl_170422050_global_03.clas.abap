CLASS zcl_170422050_global_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_170422050_global_03 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA connections TYPE TABLE OF REF TO lcl_connection.
    DATA connection  TYPE REF TO lcl_connection.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.


    TRY.
        connection = NEW #( i_carrier_id = 'AA' i_connection_id = '0017' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( 'Method call failed' ).
    ENDTRY.

    TRY.
        connection = NEW #( i_carrier_id = 'IH'
                            i_connection_id = '0400' ).
        APPEND connection TO connections.
      CATCH cx_ABAP_INVALID_VALUE.
        out->write( 'Method call failed' ).

    ENDTRY.

    TRY.
        connection = NEW #( i_carrier_id = 'IH'
                            i_connection_id = '0400' ).
        APPEND connection TO connections.
      CATCH cx_ABAP_INVALID_VALUE.
        out->write( 'Method call failed' ).

    ENDTRY.
    LOOP AT connections INTO connection.
      connection->get_attributes(
        IMPORTING
          e_carrier_id    = carrier_id
          e_connection_id = connection_id
      ).

      out->write( |Flight Connection { carrier_id } { connection_id }| ).
    ENDLOOP.


    TRY.
        connection = NEW #(
            i_carrier_id    = 'LH'
            i_connection_id = '0400'
            i_status        = 1
            i_flight_date   = cl_abap_context_info=>get_system_date( ) " Excel'deki FLIGHT_DATE (DATS)
        ).
        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( 'Tüm parametreleri içeren nesne oluşturma başarısız oldu.' ).
    ENDTRY.




  ENDMETHOD.
ENDCLASS.
