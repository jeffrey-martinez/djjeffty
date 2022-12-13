view: accounts_base {
  extension: required

  dimension: amount_credit {
    type: number
    sql: ${TABLE}.Amount_Credit ;;
    value_format_name: usd
  }

  dimension: amount_credit_tier {
    type: tier
    tiers: [0, 40, 100, 200, 300, 400, 500, 750, 1000, 2000]
    sql: ${amount_credit} ;;
  }

  dimension: amount_debit {
    type: number
    sql: ${TABLE}.Amount_Debit ;;
    value_format_name: usd
  }

  dimension: amount_debit_tier {
    type: tier
    tiers: [0, 40, 100, 200, 300, 400, 500, 750, 1000, 2000]
    sql: -1.0*${amount_debit} ;;
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.Balance ;;
    value_format_name: usd
  }

  dimension: check_number {
    type: number
    sql: ${TABLE}.Check_Number ;;
  }

  dimension_group: trans_on {
    label: "Transaction on"
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      day_of_week,
      day_of_week_index,
      week,
      week_of_year,
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
    value_format_name: usd
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
    label: "Count of Transactions"
    type: count
    drill_fields: [amount_debit, amount_credit]
  }

  measure: count_debit {
    label: "Count of Debit Transactions"
    type: count
    drill_fields: [amount_debit, amount_credit]
    filters: {
      field: amount_debit
      value: "<0, NOT NULL"
    }
  }

  measure: avg_balance {
    type:  average
    sql: ${balance} ;;
    value_format_name: usd
    drill_fields: [balance, trans_on_date]
  }

  measure: total_trans_amount {
    description: "Sum of Transaction Amounts"
    type: sum
    sql: (COALESCE(${amount_debit}, 0) + COALESCE(${amount_credit}, 0)) ;;
    value_format_name: usd
    drill_fields: [balance, trans_on_date, amount_credit, amount_debit]
  }

}
