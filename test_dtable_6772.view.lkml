view: dtable_6772 {
  derived_table: {
    sql: SELECT State AS ST, Type AS TY, count AS CO, RANK() OVER (PARTITION BY State ORDER BY count DESC) AS rank
            FROM IKYL.stc
            GROUP BY 1,2,3
      ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.ST ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.TY ;;
  }

  dimension: maxcount {
    type: number
    sql: ${TABLE}.CO ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [state, type, maxcount, rank]
  }
}
