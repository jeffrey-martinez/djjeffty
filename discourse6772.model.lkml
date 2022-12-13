connection: "djthesis"

include: "*.view.lkml"         # include all views in this project
# include: "*.dashboard.lookml"  # include all dashboards in this project


explore: stc {
  join: derived_window {
    from: dtable_6772
    relationship: many_to_many
    sql_on: ${stc.state} = ${derived_window.state} ;;
  }
  join: derived_subq {
    from: dtable6772
    relationship: many_to_many
    sql_on: ${stc.state} = ${derived_subq.state} ;;
  }
}

explore: dtable_6772 {}
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
