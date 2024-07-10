connection: "djthesis"

include: "*.view.lkml"
include: "accounts/*.view.lkml"
# include: "*.dashboard.lookml"  # include all dashboards in this project

explore: folio_tpj {}

explore: folio_export {
  join: schwab_inv {
    relationship: many_to_one
    sql_on: ${folio_export.date_raw} = ${schwab_inv.pk} ;;
  }
}

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
