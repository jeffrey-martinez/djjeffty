view: dtable6772 {

  derived_table: {
    sql: SELECT a.State ST, a.Type TY, a.count CO, COUNT(*) as rank
        FROM IKYL.stc a JOIN IKYL.stc b
        ON a.count <= b.count AND a.State = b.State
        GROUP BY 1,2,3;;
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
