view: no_dupelibrary {
  sql_table_name: IKYL.no_dupelibrary ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: album {
    type: string
    sql: ${TABLE}.album ;;
  }

  dimension: artist {
    type: string
    sql: ${TABLE}.artist ;;
  }

  dimension: bit_rate {
    type: string
    sql: ${TABLE}.bit_rate ;;
  }

  dimension: itunes_bpm {
    hidden: yes
    type: number
    sql: ${TABLE}.bpm ;;
  }

  dimension: normalized_bpm {
    type:  number
    sql: CASE WHEN ${itunes_bpm} < 68 THEN 2*${itunes_bpm}
          WHEN ${itunes_bpm} > 135 THEN CEILING(${itunes_bpm}/2)
          ELSE ${itunes_bpm} END;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: key {
    type:  string
    sql: REGEXP_EXTRACT(${comments}, r"^[a-zA-Z0-9/]+") ;;
  }

  measure: energy {
    type: max
    sql: CAST(REGEXP_EXTRACT(${comments}, r"^[a-zA-Z0-9/]+ - ([a-zA-Z0-9]+$)") as INT64) ;;
    html: {{ name._rendered_value }} - {{rendered_value}} by {{artist._rendered_value}}  ;;
  }

  dimension: date_added {
    type: string
    sql: ${TABLE}.date_added ;;
  }

  dimension: date_modified {
    type: string
    sql: ${TABLE}.date_modified ;;
  }

  dimension: duration {
    type: string
    sql: ${TABLE}.duration ;;
  }

  dimension: file_type {
    type: string
    sql: ${TABLE}.file_type ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  dimension: last_played {
    type: string
    sql: ${TABLE}.last_played ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: itunes_plays {
    type: sum
    sql: ${TABLE}.plays ;;
  }

  dimension: release {
    type: string
    sql: ${TABLE}.release_date ;;
  }

  dimension: sample_rate {
    type: string
    sql: ${TABLE}.sample_rate ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}.size ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    # value_format: "[${year}>2005]$0.00;0.0"
    # approximate_threshold: 100000
    drill_fields: [id, name]
  }

#
#   dimension: id {
#     primary_key: yes
#     type: number
#     sql: ${TABLE}.id ;;
#   }
#
#   dimension: album {
#     type: string
#     sql: ${TABLE}.album ;;
#   }
#
#   dimension: artist {
#     type: string
#     sql: ${TABLE}.artist ;;
#   }
#
#   dimension: bit_rate {
#     type: string
#     sql: ${TABLE}.bit_rate ;;
#   }
#
#   dimension: bpm {
#     type: number
#     sql: ${TABLE}.bpm ;;
#   }
#
#   dimension: comments {
#     type: string
#     sql: ${TABLE}.comments ;;
#   }
#
#   dimension: date_added {
#     type: string
#     sql: ${TABLE}.date_added ;;
#   }
#
#   dimension: date_modified {
#     type: string
#     sql: ${TABLE}.date_modified ;;
#   }
#
#   dimension: duration {
#     type: string
#     sql: ${TABLE}.duration ;;
#   }
#
#   dimension: file_type {
#     type: string
#     sql: ${TABLE}.file_type ;;
#   }
#
#   dimension: genre {
#     type: string
#     sql: ${TABLE}.genre ;;
#   }
#
#   dimension: last_played {
#     type: string
#     sql: ${TABLE}.last_played ;;
#   }
#
#   dimension: name {
#     type: string
#     sql: ${TABLE}.name ;;
#   }
#
#   dimension: plays {
#     type: number
#     sql: ${TABLE}.plays ;;
#   }
#
#   dimension: release_date {
#     type: string
#     sql: ${TABLE}.release_date ;;
#   }
#
#   dimension: row_number {
#     type: number
#     sql: ${TABLE}.row_number ;;
#   }
#
#   dimension: sample_rate {
#     type: string
#     sql: ${TABLE}.sample_rate ;;
#   }
#
#   dimension: size {
#     type: string
#     sql: ${TABLE}.size ;;
#   }
#
#   dimension: year {
#     type: number
#     sql: ${TABLE}.year ;;
#   }
#
#   measure: count {
#     type: count
#     drill_fields: [id, name]
#   }
 }
