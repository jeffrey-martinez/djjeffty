view: djtransactions {
  sql_table_name: IKYL.djtransactions ;;

  parameter: tracker_date {
    type: date
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
    value_format: "$0.00"
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension_group: event_on {
    type: time
    datatype: date
    sql:
    ${TABLE}.event_on
    ;;
    timeframes: [raw, date, day_of_week, week, month, day_of_year, week_of_year, month_name, year]
  }

  dimension: past_event {
    type: yesno
    sql: ${event_on_date} < CURRENT_DATE() ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.string_field_8 ;;
  }

  dimension: if_deposit {
    type: yesno
    sql: CASE WHEN ${TABLE}.deposit = "DEP" THEN TRUE
      ELSE FALSE END ;;
  }

  dimension: trans_type {
    type: string
    case: {
      when: {
        label: "Deposit"
        sql: ${TABLE}.deposit = "DEP" ;;
      }
      when: {
        label: "Gratuity"
        sql: ${TABLE}.deposit = "GRAT" ;;
      }
      else: "Remainder"
    }
  }

  dimension: transaction_on {
    type: string
    sql: ${TABLE}.transaction_on ;;
  }

  dimension_group: transaction_on {
    type: time
    datatype: date
    sql: ${TABLE}.transaction_on ;;
    timeframes: [raw, date, day_of_week, day_of_year, week_of_year, quarter_of_year, week, month, month_name, year]
  }

  measure: count {
    type: count
    drill_fields: [id, client_name, event_on_date]
  }

  measure: total_amount {
    label: "Amount Received"
    type: sum
    sql: ${amount} ;;
    value_format_name: usd_0
    drill_fields: [id, client_name, amount]
  }

  measure: paid_amount_custom {
    type: sum
    sql: CASE WHEN ${transaction_on_date} < DATE({% parameter tracker_date %}) THEN ${amount}
              ELSE 0 END ;;
    value_format_name: usd_0
  }

  measure: paid_amount_DOY {
    type: sum
    sql: CASE WHEN ${transaction_on_day_of_year} < EXTRACT(DAYOFYEAR FROM {% parameter tracker_date %}) THEN ${amount}
      ELSE 0 END ;;
    value_format_name: usd_0
  }

  measure: count_names {
    type: count_distinct
    sql: ${client_name} ;;
    drill_fields: [id, client_name, amount]
  }
}
