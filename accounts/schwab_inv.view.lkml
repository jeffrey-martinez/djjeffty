view: schwab_inv {
  sql_table_name: `lkr-thesis-project.IKYL.schwab_inv` ;;

  dimension: pk {
    primary_key: yes
    sql: ${TABLE}.Date ;;
    hidden: yes
  }

  dimension_group: date {
    type: time
    description: "%m/%d/%E4Y"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
    hidden: yes
  }
  dimension: total_value {
    type: number
    sql: ${TABLE}.Total_value ;;
  }
  measure: avg_value {
    type:  average
    sql: ${total_value} ;;
    value_format_name: usd
    drill_fields: [total_value, date_date]
  }
  measure: count {
    type: count
  }
}
