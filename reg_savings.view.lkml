include: "accounts_base.view.lkml"

view: reg_savings {
  sql_table_name: IKYL.RegSavings ;;
  extends: [accounts_base]

  dimension: latest_balance {
    sql: (SELECT a.Balance FROM ${reg_savings.SQL_TABLE_NAME} a WHERE Date = (SELECT max(b.Date) FROM ${reg_savings.SQL_TABLE_NAME} b)) ;;
    value_format_name: usd
  }
}
