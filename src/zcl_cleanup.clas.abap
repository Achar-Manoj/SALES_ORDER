CLASS zcl_cleanup DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_cleanup IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DELETE FROM ztma_salord_hd_d
      WHERE salesorder IS INITIAL.
    DELETE FROM ztma_salord_it_d
      WHERE salesorder IS INITIAL
         OR salesorderitem IS INITIAL.

    DELETE FROM ztma_salesord_hd
      WHERE salesorder IS INITIAL.
    DELETE FROM ztma_salesord_it
      WHERE salesorder IS INITIAL
         OR salesorderitem IS INITIAL.

  ENDMETHOD.

ENDCLASS.
