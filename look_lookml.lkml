# - name: add_a_unique_name_1687373026
#   title: Untitled Visualization
#   model: djjeffty
#   explore: calendar
#   type: looker_line
#   fields: [djtransactions.total_amount, djtransactions.transaction_on_month_name,
#     contract_responses.cost_total, djtransactions.event_on_year, djtransactions.paid_amount_DOY]
#   pivots: [djtransactions.event_on_year]
#   fill_fields: [djtransactions.transaction_on_month_name, djtransactions.event_on_year]
#   filters:
#     djtransactions.tracker_date: 2023/06/21
#   sorts: [djtransactions.event_on_year, djtransactions.transaction_on_month_name]
#   limit: 500
#   column_limit: 50
#   total: true
#   dynamic_fields:
#   - category: table_calculation
#     expression: running_total(${djtransactions.paid_amount_DOY})
#     label: Cumulative Amount Paid DOY
#     value_format:
#     value_format_name: usd_0
#     _kind_hint: measure
#     table_calculation: cumulative_amount_paid_doy
#     _type_hint: number
#   - category: table_calculation
#     expression: "${cumulative_amount_paid_doy} / ${djtransactions.total_amount:total}"
#     label: Percent of Year
#     value_format:
#     value_format_name: percent_2
#     _kind_hint: measure
#     table_calculation: percent_of_year
#     _type_hint: number
#   x_axis_gridlines: false
#   y_axis_gridlines: true
#   show_view_names: false
#   show_y_axis_labels: true
#   show_y_axis_ticks: true
#   y_axis_tick_density: default
#   y_axis_tick_density_custom: 5
#   show_x_axis_label: true
#   show_x_axis_ticks: true
#   y_axis_scale_mode: linear
#   x_axis_reversed: false
#   y_axis_reversed: false
#   plot_size_by_field: false
#   trellis: ''
#   stacking: ''
#   limit_displayed_rows: false
#   legend_position: center
#   point_style: none
#   show_value_labels: false
#   label_density: 25
#   x_axis_scale: auto
#   y_axis_combined: true
#   show_null_points: true
#   interpolation: linear
#   y_axes: [{label: '', orientation: left, series: [{axisId: djtransactions.paid_amount_DOY,
#           id: 2016 - djtransactions.paid_amount_DOY, name: 2016 - Djtransactions Paid
#             Amount DOY}, {axisId: djtransactions.paid_amount_DOY, id: 2017 - djtransactions.paid_amount_DOY,
#           name: 2017 - Djtransactions Paid Amount DOY}, {axisId: djtransactions.paid_amount_DOY,
#           id: 2018 - djtransactions.paid_amount_DOY, name: 2018 - Djtransactions Paid
#             Amount DOY}, {axisId: djtransactions.paid_amount_DOY, id: 2019 - djtransactions.paid_amount_DOY,
#           name: 2019 - Djtransactions Paid Amount DOY}, {axisId: djtransactions.paid_amount_DOY,
#           id: 2020 - djtransactions.paid_amount_DOY, name: 2020 - Djtransactions Paid
#             Amount DOY}, {axisId: djtransactions.paid_amount_DOY, id: 2021 - djtransactions.paid_amount_DOY,
#           name: 2021 - Djtransactions Paid Amount DOY}, {axisId: djtransactions.paid_amount_DOY,
#           id: 2022 - djtransactions.paid_amount_DOY, name: 2022 - Djtransactions Paid
#             Amount DOY}, {axisId: djtransactions.paid_amount_DOY, id: 2023 - djtransactions.paid_amount_DOY,
#           name: 2023 - Djtransactions Paid Amount DOY}, {axisId: djtransactions.paid_amount_DOY,
#           id: 2024 - djtransactions.paid_amount_DOY, name: 2024 - Djtransactions Paid
#             Amount DOY}, {axisId: djtransactions.paid_amount_DOY, id: djtransactions.event_on_year___null
#             - djtransactions.paid_amount_DOY, name: "∅ - Djtransactions Paid Amount\
#             \ DOY"}, {axisId: cumulative_amount_paid_doy, id: 2016 - cumulative_amount_paid_doy,
#           name: 2016 - Cumulative Amount Paid DOY}, {axisId: cumulative_amount_paid_doy,
#           id: 2017 - cumulative_amount_paid_doy, name: 2017 - Cumulative Amount Paid
#             DOY}, {axisId: cumulative_amount_paid_doy, id: 2018 - cumulative_amount_paid_doy,
#           name: 2018 - Cumulative Amount Paid DOY}, {axisId: cumulative_amount_paid_doy,
#           id: 2019 - cumulative_amount_paid_doy, name: 2019 - Cumulative Amount Paid
#             DOY}, {axisId: cumulative_amount_paid_doy, id: 2020 - cumulative_amount_paid_doy,
#           name: 2020 - Cumulative Amount Paid DOY}, {axisId: cumulative_amount_paid_doy,
#           id: 2021 - cumulative_amount_paid_doy, name: 2021 - Cumulative Amount Paid
#             DOY}, {axisId: cumulative_amount_paid_doy, id: 2022 - cumulative_amount_paid_doy,
#           name: 2022 - Cumulative Amount Paid DOY}, {axisId: cumulative_amount_paid_doy,
#           id: 2023 - cumulative_amount_paid_doy, name: 2023 - Cumulative Amount Paid
#             DOY}, {axisId: cumulative_amount_paid_doy, id: 2024 - cumulative_amount_paid_doy,
#           name: 2024 - Cumulative Amount Paid DOY}, {axisId: cumulative_amount_paid_doy,
#           id: djtransactions.event_on_year___null - cumulative_amount_paid_doy, name: "∅\
#             \ - Cumulative Amount Paid DOY"}], showLabels: true, showValues: true,
#       unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
#     {label: !!null '', orientation: right, series: [{axisId: percent_of_year, id: 2016
#             - percent_of_year, name: 2016 - Percent of Year}, {axisId: percent_of_year,
#           id: 2017 - percent_of_year, name: 2017 - Percent of Year}, {axisId: percent_of_year,
#           id: 2018 - percent_of_year, name: 2018 - Percent of Year}, {axisId: percent_of_year,
#           id: 2019 - percent_of_year, name: 2019 - Percent of Year}, {axisId: percent_of_year,
#           id: 2020 - percent_of_year, name: 2020 - Percent of Year}, {axisId: percent_of_year,
#           id: 2021 - percent_of_year, name: 2021 - Percent of Year}, {axisId: percent_of_year,
#           id: 2022 - percent_of_year, name: 2022 - Percent of Year}, {axisId: percent_of_year,
#           id: 2023 - percent_of_year, name: 2023 - Percent of Year}, {axisId: percent_of_year,
#           id: 2024 - percent_of_year, name: 2024 - Percent of Year}, {axisId: percent_of_year,
#           id: djtransactions.event_on_year___null - percent_of_year, name: "∅ - Percent\
#             \ of Year"}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
#       tickDensityCustom: 5, type: linear}]
#   x_axis_zoom: true
#   y_axis_zoom: true
#   font_size: 12
#   series_types: {}
#   defaults_version: 1
#   hidden_pivots: {}
#   hidden_fields: [djtransactions.total_amount, contract_responses.cost_total, djtransactions.paid_amount_DOY,
#     cumulative_amount_paid_doy]
#   ordering: none
#   show_null_labels: false
#   show_totals_labels: false
#   show_silhouette: false
#   totals_color: "#808080"
#   value_labels: legend
#   label_type: labPer
