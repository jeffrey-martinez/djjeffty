view: calendar {
  sql_table_name: IKYL.calendar ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age_group {
    type: string
    sql: ${TABLE}.age_group ;;
  }

  dimension_group: booked {
    type: time
    timeframes: [
      raw,
      date,
      week,
      day_of_week,
      month,
      quarter,
      quarter_of_year,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.booked_on ;;
  }

  dimension: latlong {
      type: location
      sql_latitude: ${TABLE}.latitude ;;
      sql_longitude:${TABLE}.longitude ;;
    }

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      hour,
      minute,
      second,
      date,
      week,
      time,
      day_of_week,
      fiscal_month_num,
      week_of_year,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_on ;;
  }

  dimension: created_financial_quarter_first_day {
    group_label: "Created Date"
    type: date
    sql: DATE_TRUNC('w',DATEADD(w,1,DATEADD(day,-1,DATE_TRUNC('qtr', ${event_raw})))) ;;
  }

  dimension: 445_financial_month {
    # datatype: date
    group_label: "Created Date"
    label: "Financial Month"
    sql:
    CASE WHEN ${event_week_of_year} = 1
    AND ${event_raw} < ${created_financial_quarter_first_day}
    OR ${event_week_of_year} = 1
    AND ${event_raw} > DATEADD('y',-1,${event_raw})
            THEN 'FM' || 12
         WHEN ${event_week_of_year} between 1 AND 4 THEN 'FM ' || 1
         WHEN ${event_week_of_year} between 5 AND 8 THEN 'FM ' || 2
         WHEN ${event_week_of_year} between 9 AND 13 THEN 'FM ' || 3
         WHEN ${event_week_of_year} between 14 AND 17 THEN 'FM ' || 4
         WHEN ${event_week_of_year} between 18 AND 21 THEN 'FM ' || 5
         WHEN ${event_week_of_year} between 22 AND 26 THEN 'FM ' || 6
         WHEN ${event_week_of_year} between 27 AND 30 THEN 'FM ' || 7
         WHEN ${event_week_of_year} between 31 AND 34 THEN 'FM ' || 8
         WHEN ${event_week_of_year} between 35 AND 39 THEN 'FM ' || 9
         WHEN ${event_week_of_year} between 40 AND 43 THEN 'FM ' || 10
         WHEN ${event_week_of_year} between 44 AND 47 THEN 'FM ' || 11
    ELSE 'FM' || 12
    END ;;
  }



  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: event_double {
    type: yesno
    description: "Indicator of Two Events in One Day"
    sql: CASE WHEN ENDS_WITH(${TABLE}.event_id, '1') OR ENDS_WITH(${TABLE}.event_id, '2') THEN TRUE ELSE FALSE END  ;;
  }

  dimension: event_title {
    type: string
    sql: ${TABLE}.event_title ;;
  }

  dimension: gratuity {
    type: number
    sql: ${TABLE}.gratuity ;;
  }

  dimension: hourly_rate {
    type: number
    sql: ${TABLE}.hourly_rate ;;
  }

  dimension: hours {
    type: number
    sql: ${TABLE}.hours ;;
  }

  dimension: invoice_id {
    type: number
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: total_hours {
    type: number
    sql: ${TABLE}.total_hours ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: Wedding {
    type: yesno
    sql: CASE WHEN ${TABLE}.type LIKE '%Wedding%' THEN TRUE
    ELSE FALSE END;;
  }

  dimension: venue {
    type: string
    sql: ${TABLE}.venue ;;
  }

  measure: count {
    type: count
    # html: {{rendered_value}}|| {{event_month_name._rendered_value}} ;;
    drill_fields: [id, event_title, event_date, client]
  }
}
