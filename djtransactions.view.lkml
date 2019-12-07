view: djtransactions {
  sql_table_name: IKYL.djtransactions ;;

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
    sql: ${TABLE}.client_name ;;
  }

  dimension_group: event_on {
    type: time
    datatype: date
    sql:
    ${TABLE}.event_on
    ;;
    timeframes: [raw, date, day_of_week, week, month, month_name, year]
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
    timeframes: [raw, date, day_of_week, quarter_of_year, week, month, month_name, year]
  }

  measure: count {
    type: count
    drill_fields: [id, client_name, event_on_date]
  }

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd_0
    drill_fields: [id, client_name, amount]
  }
}
