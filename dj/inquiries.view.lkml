# The name of this view in Looker is "Inquiries"
view: inquiries {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `lkr-thesis-project.IKYL.inquiries`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: event {
    type: time
    description: "%m/%d/%E4Y"
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date_of_Event ;;
  }

  dimension_group: lead {
    type: duration
    sql_start: ${submitted_date} ;;
    sql_end: ${event_raw} ;;
  }

  dimension_group: to_book {
    type: duration
    sql_start: ${submitted_raw} ;;
    sql_end: ${contract_responses.timestamp_raw} ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Email Address" in Explore.

  dimension: email_address {
    type: string
    sql: ${TABLE}.Email_Address ;;
  }

  dimension: event_start_time {
    type: string
    sql: ${TABLE}.Event_Start_Time ;;
  }

  dimension: location_or_venue {
    type: string
    sql: ${TABLE}.Location_or_Venue ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.Message ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.Subject ;;
  }

  dimension_group: submitted {
    type: time
    description: "%m/%d/%Y %H:%M:%E*S"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.Submitted_On ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
