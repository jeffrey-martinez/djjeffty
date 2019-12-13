include: "accounts_base.view.lkml"

view: djsavings {
  extends: [accounts_base]
  sql_table_name: IKYL.DJSavings ;;

  dimension: latest_balance {
    sql: (SELECT a.Balance FROM ${djsavings.SQL_TABLE_NAME} a WHERE Date = (SELECT max(b.Date) FROM ${djsavings.SQL_TABLE_NAME} b)) ;;
    value_format_name: usd
  }
}
