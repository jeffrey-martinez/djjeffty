view: savtracker {
  sql_table_name: IKYL.savtracker ;;

  dimension: pk {
    type: string
    sql: ${TABLE}.Timestamp ;;
    primary_key: yes
  }

  dimension: deposit_just_now {
    type: number
    sql: ${TABLE}.Deposit_Just_Now ;;
  }

  measure: sum_deposit {
    type:  sum
    sql:  ${deposit_just_now} ;;
  }

  dimension: time_date_join {
    hidden: yes
    sql: DATE(${TABLE}.Timestamp)  ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Timestamp ;;
  }

  dimension: total_towards_goal {
    type: number
    sql: ${TABLE}.Total_Towards_Goal ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
