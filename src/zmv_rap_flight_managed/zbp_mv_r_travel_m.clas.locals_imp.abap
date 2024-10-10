CLASS lhc_ZMV_R_Travel_M DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZMV_R_Travel_M RESULT result.

    METHODS earlynumbering_cba_booking FOR NUMBERING
      IMPORTING entities FOR CREATE travel\_booking.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE travel.

ENDCLASS.

CLASS lhc_ZMV_R_Travel_M IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.

    "Find Maximum TravelId
    SELECT MAX( TravelID ) FROM ZMV_I_Travel INTO @DATA(lv_max_travel_id).

    "Send Newly Generated TravelId to Mapped Travel Table
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lwa_entity>).

      lv_max_travel_id = lv_max_travel_id + 1.

      APPEND INITIAL LINE TO mapped-travel ASSIGNING FIELD-SYMBOL(<lwa_mapped_travel>).
      <lwa_mapped_travel> = VALUE #( %cid = <lwa_entity>-%cid
                                     TravelId = COND #( WHEN <lwa_mapped_travel>-TravelId IS INITIAL
                                                            THEN lv_max_travel_id
                                                        ELSE <lwa_mapped_travel>-TravelId ) ).

    ENDLOOP.

  ENDMETHOD.

  METHOD earlynumbering_cba_booking.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lwa_entity>).

      "Find Maximum BookingId
      SELECT MAX( BookingId )
      FROM zmv_i_booking
      WHERE TravelId = @<lwa_entity>-TravelId
      INTO @DATA(lv_max_booking_id).

      LOOP AT <lwa_entity>-%target ASSIGNING FIELD-SYMBOL(<lwa_booking>).
        lv_max_booking_id = lv_max_booking_id + 1.

        "Send Newly Generated BookingId to Mapped Booking Table
        APPEND INITIAL LINE TO mapped-booking  ASSIGNING FIELD-SYMBOL(<lwa_mapped_booking>).
        <lwa_mapped_booking> = VALUE #( %cid = <lwa_booking>-%cid
                                        TravelId = <lwa_entity>-TravelId
                                        BookingId = lv_max_booking_id ).
      ENDLOOP.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
