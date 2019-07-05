view: folio_export {
  sql_table_name: IKYL.folio_export ;;

  dimension: accrued {
    type: number
    sql: ${TABLE}.accrued ;;
  }

  dimension: pk1 {
    primary_key: yes
    sql:  ${TABLE}.date ;;
    hidden: yes
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
    sql: ${TABLE}.date ;;
  }

  dimension: fee {
    type: number
    sql: ${TABLE}.fee ;;
  }

  dimension: market_value {
    type: number
    sql: ${TABLE}.market_value ;;
  }

  dimension: return_with_fee {
    type: number
    sql: ${TABLE}.return_with_fee / 100.0 ;;
    value_format_name: percent_4
  }

  dimension: return_without_fee {
    type: number
    sql: ${TABLE}.return_without_fee / 100.0 ;;
    value_format_name: percent_4
  }

  dimension: total_flow {
    type: number
    sql: ${TABLE}.total_flow ;;
  }

  measure: total_market_value {
    type: max
    sql: ${market_value} ;;
  }

  measure: return_from_previous_with_fee {
    type: number
    sql: ANY_VALUE(${return_with_fee} / 100.0) ;;
    value_format_name: percent_4
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
