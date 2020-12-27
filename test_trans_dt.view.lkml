view: test_trans_dt {

  derived_table: {
    explore_source: test_transactions {
      column: amount {}
      column: id {}
    }
  }


  dimension: amount {
#     description: "This is the description"
    value_format: "$0.00"
    type: number
  }
  dimension: id {
    type: number
    primary_key: yes
  }

  measure: max_amount {
    type: max
    sql: ${amount} ;;
    value_format_name: usd_0
  }

  measure: min_amount {
    type: min
    sql: ${amount} ;;
    value_format_name: usd_0
  }

  measure: avg_amount {
    type: average
    sql: ${amount} ;;
    value_format_name: usd_0
  }

  measure: sum_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd_0
  }

  measure: count_amount {
    type: count
    value_format_name: usd_0
    filters: {
      field: id
      value: "NOT NULL"
    }
  }
}
