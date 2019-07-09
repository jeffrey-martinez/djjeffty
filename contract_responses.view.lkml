view: contract_responses {
  sql_table_name: IKYL.contract_responses ;;

  dimension: _form_publisher__doc_url {
    type: string
    sql: ${TABLE}._Form_Publisher__Doc_URL ;;
  }

  dimension: _form_publisher__increment {
    type: number
    primary_key: yes
    sql: ${TABLE}._Form_Publisher__Increment ;;
  }

  dimension: _form_publisher__pdf_url {
    type: string
    sql: ${TABLE}._Form_Publisher__PDF_URL ;;
  }

  dimension_group: date_of_event {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date_of_Event ;;
  }

  dimension: deposit_due {
    type: string
    sql: ${TABLE}.Deposit_Due ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.E_mail ;;
  }

  dimension: event_end_time {
    type: string
    sql: ${TABLE}.Event_End_Time ;;
  }

  dimension: event_start_time {
    type: string
    sql: ${TABLE}.Event_Start_Time ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.Event_Type ;;
  }

  dimension: hourly_rate_for_additional_time {
    type: string
    sql: ${TABLE}.Hourly_Rate_for_Additional_Time ;;
  }

  dimension: phone {
    type: string
    hidden: yes
    sql: ${TABLE}.Phone ;;
  }

  dimension: purchaser_address {
    type: string
    sql: ${TABLE}.Purchaser_Address ;;
  }

  dimension: purchaser_name {
    type: string
    sql: ${TABLE}.Purchaser_Name ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Timestamp ;;
  }

  dimension: total_cost_of_service {
    type: string
    sql: ${TABLE}.Total_Cost_of_Service ;;
  }

  dimension: venue {
    type: string
    sql: ${TABLE}.Venue ;;
  }

  dimension: venue_address {
    type: string
    sql: ${TABLE}.Venue_Address ;;
  }

  dimension: venue_phone {
    type: string
    sql: ${TABLE}.Venue_Phone ;;
  }

  dimension: event_format {
    type: string
    description: "String version of event date"
    sql: ${TABLE}.event_format ;;
    hidden: yes
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [purchaser_name]
  }
}

#   dimension_group: today_s {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.Today_s_Date ;;
#   }

#   dimension: string_field_20 {
#     type: string
#     sql: ${TABLE}.string_field_20 ;;
#   }
#
#   dimension: string_field_22 {
#     type: string
#     sql: ${TABLE}.string_field_22 ;;
#   }
#
#   dimension: string_field_23 {
#     type: string
#     sql: ${TABLE}.string_field_23 ;;
#   }
#
#   dimension: string_field_24 {
#     type: string
#     sql: ${TABLE}.string_field_24 ;;
#   }

#   dimension: double_field_21 {
#     type: number
#     sql: ${TABLE}.double_field_21 ;;
#   }
#
#   dimension: double_field_25 {
#     type: number
#     sql: ${TABLE}.double_field_25 ;;
#   }

#   dimension: email_address {
#     type: string
#     sql: ${TABLE}.Email_Address ;;
#   }
