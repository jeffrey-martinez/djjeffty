view: eventcal {
  sql_table_name: IKYL.eventcal ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: agegroup {
    type: string
    sql: ${TABLE}.agegroup ;;
  }

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension_group: datebooked {
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
    sql: ${TABLE}.datebooked ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }

  dimension: eventtitle {
    type: string
    sql: ${TABLE}.eventtitle ;;
  }

  dimension: gratuity {
    type: number
    sql: ${TABLE}.gratuity ;;
  }

  dimension: hourly {
    type: string
    sql: ${TABLE}.hourly ;;
  }

  dimension: hourlyrate {
    type: number
    sql: ${TABLE}.hourlyrate ;;
  }

  dimension: hours {
    type: number
    sql: ${TABLE}.hours ;;
  }

  dimension: invoiceid {
    type: number
    value_format_name: id
    sql: ${TABLE}.invoiceid ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: totalhours {
    type: number
    sql: ${TABLE}.totalhours ;;
  }

  dimension: travel {
    type: number
    sql: ${TABLE}.travel ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
