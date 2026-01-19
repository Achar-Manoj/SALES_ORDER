CLASS lsc_zima_salesord_head DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_zima_salesord_head IMPLEMENTATION.

  METHOD adjust_numbers.

    DATA: lv_salesorder_item TYPE ztma_salesord_it-salesorderitem.

    CLEAR: lv_salesorder_item.
    SELECT MAX( salesorder )
      FROM ztma_salesord_hd
    INTO @DATA(lv_salesorder_max).
    IF sy-subrc = 0.
      lv_salesorder_max = lv_salesorder_max + 1.
      IF mapped-salesorder_head[] IS NOT INITIAL.
        mapped-salesorder_head[ 1 ]-Salesorder = lv_salesorder_max.
*      MAPPED-salesorder_item[ 1 ]-Salesorder = lv_salesorder_max.
        LOOP AT mapped-salesorder_item ASSIGNING FIELD-SYMBOL(<lfs_salesorder_item>).
          lv_salesorder_item = lv_salesorder_item + 1.
          <lfs_salesorder_item>-Salesorder     = lv_salesorder_max.
          <lfs_salesorder_item>-Salesorderitem = lv_salesorder_item.
        ENDLOOP.
      ENDIF.
    ELSE.
      lv_salesorder_max = lv_salesorder_max + 1.
      IF mapped-salesorder_head[] IS NOT INITIAL.
        mapped-salesorder_head[ 1 ]-Salesorder = lv_salesorder_max.
        LOOP AT mapped-salesorder_item ASSIGNING FIELD-SYMBOL(<lfs_so_item>).
          lv_salesorder_item = lv_salesorder_item + 1.
          <lfs_so_item>-Salesorder     = lv_salesorder_max.
          <lfs_so_item>-Salesorderitem = lv_salesorder_item.
        ENDLOOP.
      ENDIF.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

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
