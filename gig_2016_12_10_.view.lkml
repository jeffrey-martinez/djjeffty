view: gig_2016_12_10_ {
  derived_table: {
    sql: SELECT PARSE_DATE("%D",(SELECT ${name} FROM `lkr-thesis-project.IKYL.gig_2016_12_10_` LIMIT 1)) gig_date, (
            SELECT COUNT(*) FROM `lkr-thesis-project.IKYL.gig_2016_12_10_`) songcount,
            ROW_NUMBER() OVER() playlistid,
            * FROM `lkr-thesis-project.IKYL.gig_2016_12_10_`  ;;
  }

  # sql_table_name: IKYL.gig_2016_12_09_ ;;

  dimension: album {
    type: string
    sql: ${TABLE}.album ;;
  }

  dimension: playlist_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.playlistid ;;
  }

  dimension: song_number {
    type: number
    sql: ${TABLE}.songcount ;;
  }

  dimension: playlist_position {
    type: number
    sql: ROUND(${playlist_id}*1.0/${song_number}, 4) ;;
    value_format: "0.000"
  }

  dimension: playlist_tier {
    type: tier
    style: interval
    tiers: [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
    sql: ${playlist_position} ;;
  }

  dimension: gig_date {
    type: string
    sql: ${TABLE}.gig_date ;;
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
    label: "Beats Per Minute"
    type: number
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
    sql: ${TABLE}.length ;;
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
    type: string
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [filename, name]
  }
}
