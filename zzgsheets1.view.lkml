view: gsheets1 {
  sql_table_name: IKYL.gsheets1 ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

#   dimension: begin {
#     type: date_raw
#     sql: ${TABLE}.begin ;;
#   }

  dimension_group: beginning {
    type: time
    timeframes: [raw, date, time, day_of_week_index, week_of_year, hour_of_day, hour, minute, quarter, time_of_day]
    sql: CAST(${TABLE}.begin AS TIMESTAMP) ;;
  }

#   dimension: birthday {
#     type: date_raw
#     sql: ${TABLE}.birthday ;;
#   }

  dimension_group: birthday {
    type: time
    timeframes: [raw, date, time, day_of_week_index, week_of_year, hour_of_day, hour, minute, quarter, time_of_day]
    sql: CAST(${TABLE}.birthday AS TIMESTAMP) ;;
  }

#   dimension: ending {
#     type: date_raw
#     sql: ${TABLE}.ending ;;
#   }

  dimension_group: ending {
    type: time
    timeframes: [raw, date, time, day_of_week_index, week_of_year, hour_of_day, hour, minute, quarter, time_of_day]
    sql: CAST(${TABLE}.ending AS TIMESTAMP) ;;
  }

  dimension: workdays {
    type:  number
    sql: DATE_DIFF(${ending_date}, ${beginning_date}, DAY) - ((FLOOR(DATE_DIFF(${ending_date}, ${beginning_date}, DAY) / 7) * 2) +
CASE WHEN ${beginning_day_of_week_index}-${ending_day_of_week_index} IN (1, 2, 3, 4, 5) AND ${ending_day_of_week_index} != 0
THEN 2 ELSE 0 END +
CASE WHEN ${beginning_day_of_week_index} != 0 AND ${ending_day_of_week_index} = 0
THEN 1 ELSE 0 END +
CASE WHEN ${beginning_day_of_week_index} = 0 AND ${ending_day_of_week_index} != 0
THEN 1 ELSE 0 END) ;;
  }

  dimension: business_hours {
    type:  number
    sql: CASE
    WHEN (${beginning_day_of_week_index} IN (0, 6)) AND (${ending_day_of_week_index} IN (0, 6))
      THEN ${workdays}*8
    WHEN (${beginning_day_of_week_index} IN (0, 6)) AND (${ending_day_of_week_index} NOT IN (0, 6))
      THEN ((${workdays})*8 + CASE WHEN ${ending_hour_of_day} < 9 THEN 0
                                   WHEN ${ending_hour_of_day} >=9 AND ${ending_hour_of_day} <= 17 THEN ${ending_hour_of_day}-9
                                   ELSE 8
                                   END)
    WHEN (${beginning_day_of_week_index} NOT IN (0, 6)) AND (${ending_day_of_week_index} IN (0, 6))
      THEN ((${workdays} - 1)*8 + CASE WHEN ${beginning_hour_of_day} < 9 THEN 8
                                       WHEN ${beginning_hour_of_day} >= 9 AND ${beginning_hour_of_day} <= 17 THEN 17-${beginning_hour_of_day}
                                       ELSE 0
                                       END)
    ELSE ((${workdays} - 1)*8 + CASE WHEN ${beginning_hour_of_day} < 9 THEN 8
                                     WHEN ${beginning_hour_of_day} >= 9 AND ${beginning_hour_of_day} <= 17 THEN 17-${beginning_hour_of_day}
                                     ELSE 0
                                     END +
                                CASE WHEN ${ending_hour_of_day} < 9 THEN 0
                                     WHEN ${ending_hour_of_day} >=9 AND ${ending_hour_of_day} <= 17 THEN ${ending_hour_of_day}-9
                                     ELSE 8
                                     END)
    END;;
  }




  dimension: known_value {
    type: number
    sql: ${TABLE}.known_value ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
