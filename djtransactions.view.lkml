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
    sql: PARSE_DATE("%F", ${TABLE}.event_on) ;;
    timeframes: [raw, date, day_of_week, week, month, month_name, year]
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_on ;;
  }

  dimension: if_deposit {
    type: yesno
    sql: CASE WHEN ${TABLE}.if_deposit = "DEP" THEN TRUE
      ELSE FALSE END ;;
  }

  dimension: transaction_on {
    type: string
    sql: ${TABLE}.transaction_on ;;
  }

  dimension_group: transaction_on {
    type: time
    sql: PARSE_DATE("%F", ${TABLE}.transaction_on) ;;
    timeframes: [raw, date, day_of_week, week, month, month_name, year]
  }

  measure: count {
    type: count
    drill_fields: [id, client_name, event_on_date]
  }
}
