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
  }
  dimension: total_value {
    type: number
    sql: ${TABLE}.Total_value ;;
  }
  measure: count {
    type: count
  }
}
