view: eventcalendar {
  sql_table_name: IKYL.eventcalendar ;;

# does this still work?
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: eventlength {
    type: number
    sql: ${TABLE}.eventlength ;;
  }

  dimension: fulllength {
    type: number
    sql: ${TABLE}.fulllength ;;
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

  measure: totalprice {
    type: max
    sql: ${TABLE}.price * 1.0 ;;
    value_format: "$0.00"
  }
}
