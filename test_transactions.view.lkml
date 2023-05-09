view: test_transactions {
  sql_table_name: IKYL.djtransactions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    description: "This is the description"
    type: number
    sql: ${TABLE}.amount ;;
    value_format: "$0.00"
  }

  dimension: amount2 {
    description: "This is the description"
    type: number
    sql: ${TABLE}.amount ;;
    value_format: "$0.00"
    link: {
      label: "Column MIN {{ test_trans_dt.min_amount._value }}"
      url: "Nothing"
    }
  }


  dimension: client_name {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension_group: event_on {
    type: time
    datatype: date
    sql: ${TABLE}.event_on ;;
    timeframes: [raw, date, day_of_week, week, month, month_name, year]
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_on ;;
  }

  dimension: if_deposit {
    type: yesno
    sql: CASE WHEN ${TABLE}.deposit = "DEP" THEN TRUE
      ELSE FALSE END ;;
  }

  dimension: transaction_on {
    type: string
    sql: ${TABLE}.transaction_on ;;
    required_fields: [event_id]
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

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
    value_format: "$0.00"
  }

  measure: amount_list {
    type: list
    list_field: amount
  }

}
