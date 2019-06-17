connection: "djthesis"

include: "*.view.lkml"         # include all views in this project
# include: "*.dashboard.lookml"  # include all dashboards in this project

explore: gsheets1 {}
explore: test {
  hidden: yes # IMPORTANT - keep explores hidden to avoid clutter
}

view: test  {
  derived_table: {
    sql:
      SELECT 'foo' as some_string, 1 as some_num
      UNION ALL
      SELECT 'bar' as some_string, 2 as some_num
      UNION ALL
      SELECT 'bar' as some_string, 3 as some_num
      UNION ALL
      SELECT NULL as some_string, 4 as some_num
      ;;
  }

  measure: total_count {
    sql: CASE WHEN ${some_string} IS NULL THEN "Pending or SO"
      ELSE CAST(COUNT(${some_string}) AS STRING) END ;;
  }

  dimension: is_null {
    sql: IFNULL(${some_string}, "1") ;;
  }

  dimension: some_string {
    type: string
  }

  dimension: some_num {
    type: number
  }

  measure: count {
    type: count
  }
  }
