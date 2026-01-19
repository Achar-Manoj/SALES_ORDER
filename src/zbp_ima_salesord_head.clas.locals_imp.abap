CLASS lhc_salesorder_head DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR salesorder_head RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR salesorder_head RESULT result.
    METHODS updatenetamount FOR DETERMINE ON SAVE
      IMPORTING keys FOR salesorder_head~updatenetamount.


ENDCLASS.

CLASS lhc_salesorder_head IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD updateNetAmount.
  ENDMETHOD.

ENDCLASS.
