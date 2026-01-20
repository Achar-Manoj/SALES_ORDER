CLASS lhc_salesorder_item DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS updateamount FOR DETERMINE ON SAVE
      IMPORTING keys FOR salesorder_item~updateamount.
    METHODS updateitem FOR DETERMINE ON SAVE
      IMPORTING keys FOR salesorder_item~updateitem.

ENDCLASS.

CLASS lhc_salesorder_item IMPLEMENTATION.

  METHOD updateamount.
*    LOOP AT reported-salesorder_item ASSIGNING FIELD-SYMBOL(<lfs_so_item>).
*      IF <lfs_so_item>-%element-netamount IS NOT INITIAL AND <lfs_so_item>-%element-currencycode IS INITIAL.
**          <lfs_so_item>-%element-currencycode = 'USD'.
*      ENDIF.
*    ENDLOOP.
  ENDMETHOD.

  METHOD updateitem.

*    DATA: lv_salesorder      TYPE ztma_salesord_it-salesorder,
*          lv_salesorder_item TYPE ztma_salesord_it-salesorderitem.
*
*    CLEAR: lv_salesorder, lv_salesorder_item.
*    IF reported-salesorder_item[] IS NOT INITIAL.
*      lv_salesorder = reported-salesorder_item[ 1 ]-Salesorder.
*      IF lv_salesorder IS INITIAL.
*        lv_salesorder = reported-salesorder_item[ 1 ]-%element-salesorder.
*      ENDIF.
*    ENDIF.
*
*    IF lv_salesorder IS NOT INITIAL.
*
*      CLEAR: lv_salesorder_item.
*
*      SELECT MAX( salesorderitem )
*        FROM ztma_salesord_it
*        WHERE salesorder = @lv_salesorder
*      INTO @DATA(lv_so_item_max).
*
*      IF sy-subrc = 0.
*        LOOP AT reported-salesorder_item ASSIGNING FIELD-SYMBOL(<lfs_salesorder_item>).
*          IF <lfs_salesorder_item>-Salesorderitem IS INITIAL.
*            lv_so_item_max = lv_so_item_max + 1.
*            <lfs_salesorder_item>-Salesorderitem = lv_so_item_max.
*            <lfs_salesorder_item>-%element-salesorderitem = lv_so_item_max.
*          ENDIF.
*        ENDLOOP.
*      ELSE.
*        LOOP AT reported-salesorder_item ASSIGNING <lfs_salesorder_item>.
*          IF <lfs_salesorder_item>-Salesorderitem IS INITIAL.
*            lv_so_item_max = lv_so_item_max + 1.
*            <lfs_salesorder_item>-Salesorderitem = lv_so_item_max.
*            <lfs_salesorder_item>-%element-salesorderitem = lv_so_item_max.
*          ENDIF.
*        ENDLOOP.
*      ENDIF.
*
*    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS lsc_zima_salesord_head DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_zima_salesord_head IMPLEMENTATION.

  METHOD adjust_numbers.

    DATA: lv_salesorder      TYPE ztma_salesord_it-salesorder,
          lv_salesorder_item TYPE ztma_salesord_it-salesorderitem.

    CLEAR: lv_salesorder_item.
    SELECT MAX( salesorder )
      FROM ztma_salesord_hd
    INTO @DATA(lv_salesorder_max).
    IF sy-subrc = 0.
      lv_salesorder_max = lv_salesorder_max + 1.
      IF mapped-salesorder_head[] IS NOT INITIAL.
        IF mapped-salesorder_head[ 1 ]-Salesorder IS INITIAL.
          mapped-salesorder_head[ 1 ]-Salesorder = lv_salesorder_max.
          lv_salesorder = lv_salesorder_max.
          LOOP AT mapped-salesorder_item ASSIGNING FIELD-SYMBOL(<lfs_salesorder_item>).
            lv_salesorder_item = lv_salesorder_item + 1.
            <lfs_salesorder_item>-Salesorder     = lv_salesorder_max.
            <lfs_salesorder_item>-Salesorderitem = lv_salesorder_item.
          ENDLOOP.
        ELSE.
          lv_salesorder = mapped-salesorder_head[ 1 ]-Salesorder.
        ENDIF.
      ENDIF.
    ELSE.
      lv_salesorder_max = lv_salesorder_max + 1.
      IF mapped-salesorder_head[] IS NOT INITIAL.
        IF mapped-salesorder_head[ 1 ]-Salesorder IS INITIAL.
          mapped-salesorder_head[ 1 ]-Salesorder = lv_salesorder_max.
          lv_salesorder = lv_salesorder_max.
          LOOP AT mapped-salesorder_item ASSIGNING FIELD-SYMBOL(<lfs_so_item>).
            lv_salesorder_item = lv_salesorder_item + 1.
            <lfs_so_item>-Salesorder     = lv_salesorder_max.
            <lfs_so_item>-Salesorderitem = lv_salesorder_item.
          ENDLOOP.
        ELSE.
          lv_salesorder = mapped-salesorder_head[ 1 ]-Salesorder.
        ENDIF.
      ENDIF.
    ENDIF.

    IF lv_salesorder IS NOT INITIAL.

      SELECT MAX( salesorderitem )
        FROM ztma_salesord_it
        WHERE salesorder = @lv_salesorder
      INTO @DATA(lv_so_item_max).

      IF sy-subrc = 0.
        LOOP AT mapped-salesorder_item ASSIGNING <lfs_salesorder_item>.
          IF <lfs_salesorder_item>-Salesorderitem IS INITIAL.
            lv_so_item_max = lv_so_item_max + 1.
            <lfs_salesorder_item>-Salesorderitem = lv_so_item_max.
          ENDIF.
        ENDLOOP.
      ELSE.
        CLEAR: lv_so_item_max.
        LOOP AT mapped-salesorder_item ASSIGNING <lfs_salesorder_item>.
          IF <lfs_salesorder_item>-Salesorderitem IS INITIAL.
            lv_so_item_max = lv_so_item_max + 1.
            <lfs_salesorder_item>-Salesorderitem = lv_so_item_max.
          ENDIF.
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
    DATA: lv_amount_total TYPE ztma_salesord_it-netamount.

    CLEAR: lv_amount_total.
    IF reported-salesorder_head[] IS NOT INITIAL.
      IF reported-salesorder_item[] IS NOT INITIAL.
        LOOP AT reported-salesorder_item ASSIGNING FIELD-SYMBOL(<lfs_so_item>).
          lv_amount_total = lv_amount_total + <lfs_so_item>-%element-netamount.
        ENDLOOP.
        DATA(lv_currency) = reported-salesorder_item[ 1 ]-%element-currencycode.
      ENDIF.
      reported-salesorder_head[ 1 ]-%element-netamount = lv_amount_total.
      reported-salesorder_head[ 1 ]-%element-currencycode = lv_currency.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
