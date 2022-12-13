include: "accounts_base.view.lkml"

view: djchecking {
  extends: [accounts_base]
  sql_table_name: IKYL.DJChecking ;;

  dimension: latest_balance {
    sql: (SELECT a.Balance FROM ${djchecking.SQL_TABLE_NAME} a WHERE Date = (SELECT max(b.Date) FROM ${djchecking.SQL_TABLE_NAME} b)) ;;
    value_format_name: usd
  }

}
