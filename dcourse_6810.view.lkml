view: dcourse_6810 {
  sql_table_name: IKYL.dcourse_6810 ;;

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: idnum {
    type: number
    sql: ${TABLE}.idnum ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.Month ;;
  }

  measure: cost {
    type: sum
    sql: ${TABLE}.amount ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
