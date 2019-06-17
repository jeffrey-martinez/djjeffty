view: jan_six_seventeen {
  sql_table_name: IKYL.jan_six_seventeen ;;

  dimension: album {
    type: string
    sql: ${TABLE}.album ;;
  }

  dimension: artist {
    type: string
    sql: ${TABLE}.artist ;;
  }

  dimension: bitrate {
    type: string
    sql: ${TABLE}.bitrate ;;
  }

  dimension: bpm {
    type: number
    sql: ${TABLE}.bpm ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: MIkey {
    type: string
    sql: FIRST(SPLIT(${TABLE}.comment, '-')) part1 ;;
  }

  dimension: composer {
    type: string
    sql: ${TABLE}.composer ;;
  }

  dimension: deck {
    type: string
    sql: ${TABLE}.deck ;;
  }

  dimension: end_time {
    type: string
    sql: ${TABLE}.end_time ;;
  }

  dimension: filename {
    type: string
    sql: ${TABLE}.filename ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  dimension: grouping {
    type: string
    sql: ${TABLE}.grouping ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: duration {
    type: string
    sql: TO_CHAR(${TABLE}.length) ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: playtime {
    type: string
    sql: ${TABLE}.playtime ;;
  }

  dimension: remixer {
    type: string
    sql: ${TABLE}.remixer ;;
  }

  dimension: start_time {
    type: string
    sql: ${TABLE}.start_time ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    # approximate_threshold: 100000
    drill_fields: [filename, name]
  }
}
