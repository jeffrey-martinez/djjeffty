view: gig_010315 {
  sql_table_name: IKYL.gig_010315 ;;

  dimension: _ {
    type: string
    sql: ${TABLE}._ ;;
  }

  dimension: gig_id {
    type: string
    sql: SUBSTR('${TABLE}', -6, 6) ;;
    # sql: 010315 ;;
  }

  dimension: gig_id2 {
    type: string
    sql: (SELECT ${name} FROM IKYL.${TABLE} LIMIT 1) ;;
  }

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
    type: string
    sql: ${TABLE}.bpm ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
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
    sql: ${TABLE}.`grouping` ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: length {
    type: string
    sql: FORMAT_TIME("%T",${TABLE}.length) ;;
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
    sql: FORMAT_TIME("%T",${TABLE}.playtime) ;;
  }

  # FORMAT_TIME("%R", TIME "15:30:00")

  dimension: remixer {
    type: string
    sql: ${TABLE}.remixer ;;
  }

  dimension: song {
    type: string
    sql: ${TABLE}.song ;;
  }

  dimension: start_time {
    type: string
    sql: ${TABLE}.start_time ;;
  }

  dimension: string_field_3 {
    type: string
    sql: ${TABLE}.string_field_3 ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [filename, name]
  }
}
