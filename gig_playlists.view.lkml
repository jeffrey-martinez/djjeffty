view: gig_playlists {
  sql_table_name: IKYL.gig_playlists ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: artist {
    type: string
    sql: ${TABLE}.artist ;;
  }

  dimension: bpm {
    type: number
    sql: ${TABLE}.bpm ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id_string ;;
  }

  dimension: duration {
    type: string
    sql: ${TABLE}.playtime ;;
  }

  dimension: end_time {
    type: string
    sql: ${TABLE}.end_time ;;
  }

  dimension_group: gig_id {
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
    sql: ${TABLE}.gig_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: playlist_id {
    type: number
    sql: ${TABLE}.playlist_id ;;
  }

  dimension: playlist_position {
    type: number
    sql: ROUND(${playlist_id}*1.0/${totalsong}, 4) ;;
    value_format: "0.000"
  }

  dimension: playlist_tier {
    type: tier
    style: interval
    tiers: [0,0.25,0.5,0.75,1.0]
    sql: ${playlist_position} ;;
  }

  dimension: start_time {
    type: string
    sql: ${TABLE}.start_time ;;
  }

  dimension: totalsong {
    type: number
    sql: ${TABLE}.totalsong ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
#     html: {{rendered_value}} | {{ name._rendered_value }} by {{artist._rendered_value}} ;;
  }
}
