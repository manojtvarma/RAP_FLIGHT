CLASS lhc_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS earlynumbering_cba_Booksuppl FOR NUMBERING
      IMPORTING entities FOR CREATE Booking\_Booksuppl.

ENDCLASS.

CLASS lhc_booking IMPLEMENTATION.

  METHOD earlynumbering_cba_Booksuppl.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lwa_entity>).

      "Find Maximum BookingSupplementId
      SELECT MAX( BookingSupplementId )
      FROM ZMV_I_BookSuppl
      WHERE TravelId = @<lwa_entity>-TravelId
      AND BookingId = @<lwa_entity>-BookingId
      INTO @DATA(lv_max_booking_supplement_id).

      LOOP AT <lwa_entity>-%target ASSIGNING FIELD-SYMBOL(<lwa_booking>).
        lv_max_booking_supplement_id = lv_max_booking_supplement_id + 1.

        "Send Newly Generated BookingSupplementId to Mapped BookingSuppl Table
        APPEND INITIAL LINE TO mapped-booksuppl  ASSIGNING FIELD-SYMBOL(<lwa_mapped_bookingsuppl>).
        <lwa_mapped_bookingsuppl> = VALUE #( %cid = <lwa_booking>-%cid
                                            TravelId = <lwa_entity>-TravelId
                                            BookingId = <lwa_entity>-BookingId
                                            BookingSupplementId = lv_max_booking_supplement_id ).
      ENDLOOP.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
