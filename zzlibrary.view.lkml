view: library {
  sql_table_name: IKYL.library ;;

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
    sql: REGEXP_EXTRACT(${comments}, r"^[a-zA-Z0-9/]+ - ([a-zA-Z0-9]+$)") ;;
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

  dimension_group: release {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
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
    # approximate_threshold: 100000
    drill_fields: [id, name]
  }
}
