view: stc {
  sql_table_name: IKYL.stc ;;


  filter: liquid_filter {
    type: string
  }

  dimension: pkey {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(stc.State,stc.Type) ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: case_when {
    type: string
    sql: CASE WHEN {% condition liquid_filter %} ${state} {% endcondition %} THEN "string"
    ELSE "SORRY" END;;
  }

  dimension: typecount {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  measure: type_sum {
    type: sum
    sql: ${typecount} ;;
  }

  measure: count {
    type: count
    drill_fields: [typecount, state, type]
  }
}
