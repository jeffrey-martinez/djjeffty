view: sequence_cal {
  derived_table: {
    sql: SELECT(DATE_ADD(DATE(CURRENT_TIMESTAMP()), INTERVAL -1* n DAY)) generic_date
      FROM UNNEST(GENERATE_ARRAY(0,DATE_DIFF(CURRENT_DATE(), DATE("2000-01-01"), DAY),1)) n
       ;;
    sql_trigger_value: SELECT 0 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date_dim {
    type:  date
    sql: ${TABLE}.generic_date ;;
    hidden:  yes
  }

  dimension_group: generic_date {
    type: time
    datatype: date
    sql: ${TABLE}.generic_date ;;
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
  }

  set: detail {
    fields: [date_dim]
  }
}
