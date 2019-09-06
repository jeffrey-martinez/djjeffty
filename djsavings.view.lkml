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

  dimension_group: date {
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
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
