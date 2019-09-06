view: djsavings {
  sql_table_name: IKYL.DJSavings ;;

  dimension: amount_credit {
    type: number
    sql: ${TABLE}.Amount_Credit ;;
  }

  dimension: amount_debit {
    type: number
    sql: ${TABLE}.Amount_Debit ;;
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.Balance ;;
  }

  dimension: check_number {
    type: string
    sql: ${TABLE}.Check_Number ;;
  }

  dimension_group: trans_on {
    label: "Transaction on"
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
    sql: ${TABLE}.Date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: fees {
    type: string
    sql: ${TABLE}.Fees ;;
  }

  dimension: memo {
    type: string
    sql: ${TABLE}.Memo ;;
  }

  dimension: transaction_number {
    type: string
    sql: ${TABLE}.Transaction_Number ;;
    primary_key: yes
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: avg_balance {
    type:  average
    sql: ${balance} ;;
    value_format_name: usd
    drill_fields: [balance, trans_on_date]
  }
}
