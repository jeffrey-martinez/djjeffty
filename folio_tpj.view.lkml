view: folio_tpj {
  sql_table_name: IKYL.folio_tpj ;;

  dimension_group: entered {
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
    sql: CAST(${TABLE}.entered_on AS timestamp) ;;
  }

  dimension: folio_growth_from_oct17 {
    type: number
    value_format: "0.00%"
    sql: ${TABLE}.folio_growth_from_oct17 ;;
  }

  dimension: folio_running_total {
    type: number
    value_format_name: usd
    sql: ${TABLE}.folio_running_total ;;
  }

  dimension: tp_roth_j {
    type: number
    value_format_name: usd
    sql: ${TABLE}.tp_roth_j ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
