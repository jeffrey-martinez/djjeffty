connection: "djthesis"

include: "/accounts/*.view.lkml"
include: "/accounts/*.dashboard"

# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: sequence_cal {
  label: "Accounts Master"
  view_label: "Master Calendar"
  join: djchecking {
    view_label: "DJ Checking"
    relationship: one_to_many
    sql_on: ${djchecking.trans_on_raw} = ${sequence_cal.generic_date_raw}  ;;
  }
  join: djsavings {
    view_label: "DJ Savings"
    relationship: one_to_many
    sql_on: ${djsavings.trans_on_raw} = ${sequence_cal.generic_date_raw}  ;;
  }
  join: reg_checking {
    view_label: "Personal Checking"
    relationship: one_to_many
    sql_on: ${reg_checking.trans_on_raw} = ${sequence_cal.generic_date_raw}  ;;
  }
  join: reg_savings {
    view_label: "Personal Savings"
    relationship: one_to_many
    sql_on: ${reg_savings.trans_on_raw} = ${sequence_cal.generic_date_raw}  ;;
  }
  join: savtracker {
    view_label: "Savings Tracker"
    relationship: one_to_many
    sql_on: ${savtracker.time_date_join} = ${sequence_cal.generic_date_raw} ;;
  }
}
