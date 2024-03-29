connection: "djthesis"

# include all the views
include: "/dj/*.view"

# include all the dashboards
include: "*.dashboard"
week_start_day: sunday

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=5.0
# NOTE: for BigQuery specific considerations

explore: no_dupelibrary {
  label: "DJ Jeffty's Song Library"
  join:  gig_playlists {
    type: inner
    relationship: many_to_one
    sql_on: ${no_dupelibrary.name} =  ${gig_playlists.name}
      AND ${no_dupelibrary.artist} = ${gig_playlists.artist} ;;
    }
  join: calendar {
    # fields: []
    type: full_outer
    relationship:  many_to_one
    sql_on: ${gig_playlists.gig_id_raw} = calendar.event_on ;;
    }
  }

# explore: djtransactions {}

explore: calendar {
  join: contract_responses{
    type: full_outer
    sql_on: ${calendar.event_id} = ${contract_responses.event_id} ;;
    relationship: one_to_one
  }
  join: djtransactions {
    type: full_outer
    relationship: one_to_many
    sql_on: ${contract_responses.event_id} = ${djtransactions.event_id} ;;
  }
}

explore: inquiries {
  join: contract_responses {
    type: full_outer
    sql_on: ${inquiries.event_raw} = ${contract_responses.date_of_event_raw} ;;
    relationship: many_to_one
  }
}


# explore: library {
#   join: jan_six_seventeen {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${library.name} = ${jan_six_seventeen.name} AND ${library.artist} = ${jan_six_seventeen.artist} ;;
#   }
# }


# explore: test_transactions {
#   join: test_trans_dt {
#     sql_on: 1=1 ;;
#     relationship: many_to_many
#   }
# }
