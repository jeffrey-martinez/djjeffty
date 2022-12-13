- dashboard: goal_udd
  title: Goal (UDD)
  layout: newspaper
  elements:
  - title: All BF Accounts
    name: All BF Accounts
    model: banking
    explore: sequence_cal
    type: looker_area
    fields: [sequence_cal.generic_date_week, reg_savings.avg_balance, djsavings.avg_balance,
      djchecking.avg_balance, reg_checking.avg_balance]
    fill_fields: [sequence_cal.generic_date_week]
    filters:
      sequence_cal.generic_date_week: after 2017/12/31
    sorts: [sequence_cal.generic_date_week desc]
    limit: 500
    dynamic_fields: [{table_calculation: personal_savings, label: Personal Savings,
        expression: 'coalesce(${reg_savings.avg_balance}, offset(${reg_savings.avg_balance},1),
          offset(${reg_savings.avg_balance},2), offset(${reg_savings.avg_balance},3),
          offset(${reg_savings.avg_balance},4))', value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}, {table_calculation: dj_savings,
        label: DJ Savings, expression: 'coalesce(${djsavings.avg_balance}, offset(${djsavings.avg_balance},1),
          offset(${djsavings.avg_balance},2), offset(${djsavings.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: dj_checking, label: DJ Checking, expression: 'coalesce(${djchecking.avg_balance},
          offset(${djchecking.avg_balance},1), offset(${djchecking.avg_balance},2),
          offset(${djchecking.avg_balance},3))', value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}, {table_calculation: personal_checking,
        label: Personal Checking, expression: 'coalesce(${reg_checking.avg_balance},
          offset(${reg_checking.avg_balance},1), offset(${reg_checking.avg_balance},2),
          offset(${reg_checking.avg_balance},3))', value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance]
    listen: {}
    row: 8
    col: 0
    width: 24
    height: 8
  - title: Personal Checking YOY
    name: Personal Checking YOY
    model: banking
    explore: sequence_cal
    type: looker_area
    fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    pivots: [sequence_cal.generic_date_year]
    fill_fields: [sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    filters:
      sequence_cal.generic_date_week: after 2018/01/01
    sorts: [sequence_cal.generic_date_week_of_year desc, sequence_cal.generic_date_year
        desc]
    limit: 500
    dynamic_fields: [{table_calculation: personal_savings, label: Personal Savings,
        expression: 'coalesce(${reg_savings.avg_balance}, offset(${reg_savings.avg_balance},1),
          offset(${reg_savings.avg_balance},2), offset(${reg_savings.avg_balance},3),
          offset(${reg_savings.avg_balance},4))', value_format: !!null '', value_format_name: usd,
        is_disabled: false, _kind_hint: measure, _type_hint: number}, {table_calculation: dj_savings,
        label: DJ Savings, expression: 'coalesce(${djsavings.avg_balance}, offset(${djsavings.avg_balance},1),
          offset(${djsavings.avg_balance},2), offset(${djsavings.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: dj_checking, label: DJ Checking, expression: 'coalesce(${djchecking.avg_balance},
          offset(${djchecking.avg_balance},1), offset(${djchecking.avg_balance},2),
          offset(${djchecking.avg_balance},3))', value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}, {table_calculation: personal_checking,
        label: Personal Checking, expression: 'coalesce(${reg_checking.avg_balance},
          offset(${reg_checking.avg_balance},1), offset(${reg_checking.avg_balance},2),
          offset(${reg_checking.avg_balance},3))', value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}, {table_calculation: 2018_average_balance,
        label: 2018 Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2018,
          mean(${reg_checking.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: 2019_average_balance,
        label: 2019 Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2019,
          mean(${reg_checking.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        _kind_hint: supermeasure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: personal_checking, id: 2018
              - personal_checking, name: 2018 - Personal Checking}, {axisId: personal_checking,
            id: 2019 - personal_checking, name: 2019 - Personal Checking}, {axisId: 2018_average_balance,
            id: 2018_average_balance, name: 2018 Average Balance}, {axisId: 2019_average_balance,
            id: 2019_average_balance, name: 2019 Average Balance}], showLabels: true,
        showValues: true, maxValue: !!null '', valueFormat: "$0,k", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    hide_legend: true
    legend_position: center
    series_types:
      2018_average_balance: scatter
      2019_average_balance: scatter
    point_style: none
    series_colors:
      2018 - personal_checking: "#929292"
      2019 - personal_checking: "#62bad4"
      2018_average_balance: "#92818d"
    series_point_styles:
      2018_average_balance: triangle-down
      2019_average_balance: triangle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    trend_lines: []
    show_null_points: false
    interpolation: linear
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, personal_savings, dj_savings, dj_checking]
    listen: {}
    row: 0
    col: 0
    width: 10
    height: 4
  - title: DJ Checking YOY
    name: DJ Checking YOY
    model: banking
    explore: sequence_cal
    type: looker_area
    fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    pivots: [sequence_cal.generic_date_year]
    fill_fields: [sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    filters:
      sequence_cal.generic_date_week: after 2018/01/01
    sorts: [sequence_cal.generic_date_week_of_year desc, sequence_cal.generic_date_year
        desc]
    limit: 500
    dynamic_fields: [{table_calculation: personal_savings, label: Personal Savings,
        expression: 'coalesce(${reg_savings.avg_balance}, offset(${reg_savings.avg_balance},1),
          offset(${reg_savings.avg_balance},2), offset(${reg_savings.avg_balance},3),
          offset(${reg_savings.avg_balance},4))', value_format: !!null '', value_format_name: usd,
        is_disabled: false, _kind_hint: measure, _type_hint: number}, {table_calculation: dj_savings,
        label: DJ Savings, expression: 'coalesce(${djsavings.avg_balance}, offset(${djsavings.avg_balance},1),
          offset(${djsavings.avg_balance},2), offset(${djsavings.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: dj_checking, label: DJ Checking, expression: 'coalesce(${djchecking.avg_balance},
          offset(${djchecking.avg_balance},1), offset(${djchecking.avg_balance},2),
          offset(${djchecking.avg_balance},3))', value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}, {table_calculation: personal_checking,
        label: Personal Checking, expression: 'coalesce(${reg_checking.avg_balance},
          offset(${reg_checking.avg_balance},1), offset(${reg_checking.avg_balance},2),
          offset(${reg_checking.avg_balance},3))', value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}, {table_calculation: 2018_average_balance,
        label: 2018 Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2018,
          mean(${djchecking.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: false, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: 2019_average_balance,
        label: 2019 Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2019,
          mean(${djchecking.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: false, _kind_hint: supermeasure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: dj_checking, id: 2018
              - dj_checking, name: 2018 - DJ Checking}, {axisId: dj_checking, id: 2019
              - dj_checking, name: 2019 - DJ Checking}, {axisId: 2018_average_balance,
            id: 2018_average_balance, name: 2018 Average Balance}, {axisId: 2019_average_balance,
            id: 2019_average_balance, name: 2019 Average Balance}], showLabels: true,
        showValues: true, maxValue: 10000, valueFormat: "$0,k", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    hide_legend: true
    legend_position: center
    series_types:
      2018_average_balance: scatter
      2019_average_balance: scatter
    point_style: none
    series_colors:
      2018 - personal_checking: "#929292"
      2019 - personal_checking: "#62bad4"
      2018_average_balance: "#92818d"
      2018 - dj_checking: "#92818d"
      2019 - dj_checking: "#90c8ae"
      2019_average_balance: "#9fc190"
    series_point_styles:
      2018_average_balance: triangle-down
      2019_average_balance: triangle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    trend_lines: []
    show_null_points: false
    interpolation: linear
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, personal_savings, dj_savings, personal_checking]
    listen: {}
    row: 4
    col: 0
    width: 10
    height: 4
  - title: DJ Savings YOY
    name: DJ Savings YOY
    model: banking
    explore: sequence_cal
    type: looker_area
    fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    pivots: [sequence_cal.generic_date_year]
    fill_fields: [sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    filters:
      sequence_cal.generic_date_week: after 2018/01/01
    sorts: [sequence_cal.generic_date_week_of_year desc, sequence_cal.generic_date_year
        desc]
    limit: 500
    dynamic_fields: [{table_calculation: personal_savings, label: Personal Savings,
        expression: 'coalesce(${reg_savings.avg_balance}, offset(${reg_savings.avg_balance},1),
          offset(${reg_savings.avg_balance},2), offset(${reg_savings.avg_balance},3),
          offset(${reg_savings.avg_balance},4))', value_format: !!null '', value_format_name: usd,
        is_disabled: false, _kind_hint: measure, _type_hint: number}, {table_calculation: dj_savings,
        label: DJ Savings, expression: 'coalesce(${djsavings.avg_balance}, offset(${djsavings.avg_balance},1),
          offset(${djsavings.avg_balance},2), offset(${djsavings.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: dj_checking, label: DJ Checking, expression: 'coalesce(${djchecking.avg_balance},
          offset(${djchecking.avg_balance},1), offset(${djchecking.avg_balance},2),
          offset(${djchecking.avg_balance},3))', value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}, {table_calculation: personal_checking,
        label: Personal Checking, expression: 'coalesce(${reg_checking.avg_balance},
          offset(${reg_checking.avg_balance},1), offset(${reg_checking.avg_balance},2),
          offset(${reg_checking.avg_balance},3))', value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}, {table_calculation: 2018_average_balance,
        label: 2018 Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2018,
          mean(${djsavings.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: false, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: 2019_average_balance,
        label: 2019 Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2019,
          mean(${djsavings.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: false, _kind_hint: supermeasure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: dj_savings, id: 2018
              - dj_savings, name: 2018 - DJ Savings}, {axisId: dj_savings, id: 2019
              - dj_savings, name: 2019 - DJ Savings}, {axisId: 2018_average_balance,
            id: 2018_average_balance, name: 2018 Average Balance}, {axisId: 2019_average_balance,
            id: 2019_average_balance, name: 2019 Average Balance}], showLabels: true,
        showValues: true, maxValue: 6000, valueFormat: "$0,k", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    hide_legend: true
    legend_position: center
    series_types:
      2018_average_balance: scatter
      2019_average_balance: scatter
    point_style: none
    series_colors:
      2018 - personal_checking: "#929292"
      2019 - personal_checking: "#62bad4"
      2018_average_balance: "#92818d"
      2018 - dj_checking: "#92818d"
      2019 - dj_checking: "#90c8ae"
      2019_average_balance: "#9fc190"
      2018 - dj_savings: "#929292"
      2019 - dj_savings: "#90c8ae"
    series_point_styles:
      2018_average_balance: triangle-down
      2019_average_balance: triangle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    trend_lines: []
    show_null_points: false
    interpolation: linear
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, personal_savings, personal_checking, dj_checking]
    listen: {}
    row: 4
    col: 10
    width: 10
    height: 4
  - title: Personal Savings YOY
    name: Personal Savings YOY
    model: banking
    explore: sequence_cal
    type: looker_area
    fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    pivots: [sequence_cal.generic_date_year]
    fill_fields: [sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    filters:
      sequence_cal.generic_date_week: after 2018/01/01
    sorts: [sequence_cal.generic_date_week_of_year desc, sequence_cal.generic_date_year
        desc]
    limit: 500
    dynamic_fields: [{table_calculation: personal_savings, label: Personal Savings,
        expression: 'coalesce(${reg_savings.avg_balance}, offset(${reg_savings.avg_balance},1),
          offset(${reg_savings.avg_balance},2), offset(${reg_savings.avg_balance},3),
          offset(${reg_savings.avg_balance},4))', value_format: !!null '', value_format_name: usd,
        is_disabled: false, _kind_hint: measure, _type_hint: number}, {table_calculation: dj_savings,
        label: DJ Savings, expression: 'coalesce(${djsavings.avg_balance}, offset(${djsavings.avg_balance},1),
          offset(${djsavings.avg_balance},2), offset(${djsavings.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: dj_checking, label: DJ Checking, expression: 'coalesce(${djchecking.avg_balance},
          offset(${djchecking.avg_balance},1), offset(${djchecking.avg_balance},2),
          offset(${djchecking.avg_balance},3))', value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}, {table_calculation: personal_checking,
        label: Personal Checking, expression: 'coalesce(${reg_checking.avg_balance},
          offset(${reg_checking.avg_balance},1), offset(${reg_checking.avg_balance},2),
          offset(${reg_checking.avg_balance},3))', value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, _type_hint: number}, {table_calculation: 2018_average_balance,
        label: 2018 Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2018,
          mean(${reg_savings.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: false, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: 2019_average_balance,
        label: 2019 Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2019,
          mean(${reg_savings.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: false, _kind_hint: supermeasure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: 2018_average_balance,
            id: 2018_average_balance, name: 2018 Average Balance}, {axisId: 2019_average_balance,
            id: 2019_average_balance, name: 2019 Average Balance}, {axisId: personal_savings,
            id: 2018 - personal_savings, name: 2018 - Personal Savings}, {axisId: personal_savings,
            id: 2019 - personal_savings, name: 2019 - Personal Savings}], showLabels: true,
        showValues: true, maxValue: !!null '', valueFormat: "$0,k", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    hide_legend: true
    legend_position: center
    series_types:
      2018_average_balance: scatter
      2019_average_balance: scatter
    point_style: none
    series_colors:
      2018 - personal_checking: "#929292"
      2019 - personal_checking: "#62bad4"
      2018_average_balance: "#92818d"
      2018 - dj_checking: "#92818d"
      2019 - dj_checking: "#90c8ae"
      2019_average_balance: "#62bad4"
      2018 - dj_savings: "#929292"
      2019 - dj_savings: "#90c8ae"
      2018 - personal_savings: "#92818d"
    series_point_styles:
      2018_average_balance: triangle-down
      2019_average_balance: triangle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    trend_lines: []
    show_null_points: false
    interpolation: linear
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, personal_checking, dj_checking, dj_savings]
    listen: {}
    row: 0
    col: 10
    width: 10
    height: 4
  - title: Reg S Bal
    name: Reg S Bal
    model: banking
    explore: sequence_cal
    type: single_value
    fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    pivots: [sequence_cal.generic_date_year]
    fill_fields: [sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    filters:
      sequence_cal.generic_date_week: after 2018/01/01
    sorts: [sequence_cal.generic_date_week_of_year desc, sequence_cal.generic_date_year
        desc 0]
    limit: 500
    dynamic_fields: [{table_calculation: personal_savings, label: Personal Savings,
        expression: 'coalesce(${reg_savings.avg_balance}, offset(${reg_savings.avg_balance},1),
          offset(${reg_savings.avg_balance},2), offset(${reg_savings.avg_balance},3),
          offset(${reg_savings.avg_balance},4))', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: measure, _type_hint: number}, {table_calculation: dj_savings,
        label: DJ Savings, expression: 'coalesce(${djsavings.avg_balance}, offset(${djsavings.avg_balance},1),
          offset(${djsavings.avg_balance},2), offset(${djsavings.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, is_disabled: true, _kind_hint: measure,
        _type_hint: number}, {table_calculation: dj_checking, label: DJ Checking,
        expression: 'coalesce(${djchecking.avg_balance}, offset(${djchecking.avg_balance},1),
          offset(${djchecking.avg_balance},2), offset(${djchecking.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, is_disabled: true, _kind_hint: measure,
        _type_hint: number}, {table_calculation: personal_checking, label: Personal
          Checking, expression: 'coalesce(${reg_checking.avg_balance}, offset(${reg_checking.avg_balance},1),
          offset(${reg_checking.avg_balance},2), offset(${reg_checking.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, is_disabled: true, _kind_hint: measure,
        _type_hint: number}, {table_calculation: 2018_average_balance, label: 2018
          Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2018,
          mean(${reg_savings.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: 2019_average_balance,
        label: 2019 Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2019,
          mean(${reg_savings.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: current_savings_balance,
        label: Current Savings Balance, expression: 'index( pivot_index(${reg_savings.avg_balance},
          1), min(match(pivot_where(extract_years(${sequence_cal.generic_date_year})=2020,
          ${reg_savings.avg_balance}), pivot_where(extract_years(${sequence_cal.generic_date_year})=2020,
          ${reg_savings.avg_balance}))))', value_format: !!null '', value_format_name: usd,
        _kind_hint: supermeasure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: 2018_average_balance,
            id: 2018_average_balance, name: 2018 Average Balance}, {axisId: 2019_average_balance,
            id: 2019_average_balance, name: 2019 Average Balance}, {axisId: personal_savings,
            id: 2018 - personal_savings, name: 2018 - Personal Savings}, {axisId: personal_savings,
            id: 2019 - personal_savings, name: 2019 - Personal Savings}], showLabels: true,
        showValues: true, maxValue: !!null '', valueFormat: "$0,k", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    hide_legend: true
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      2018 - personal_checking: "#929292"
      2019 - personal_checking: "#62bad4"
      2018_average_balance: "#92818d"
      2018 - dj_checking: "#92818d"
      2019 - dj_checking: "#90c8ae"
      2019_average_balance: "#62bad4"
      2018 - dj_savings: "#929292"
      2019 - dj_savings: "#90c8ae"
      2018 - personal_savings: "#92818d"
    series_point_styles:
      2018_average_balance: triangle-down
      2019_average_balance: triangle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    trend_lines: []
    show_null_points: false
    interpolation: linear
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, sequence_cal.generic_date_week_of_year]
    listen: {}
    row: 2
    col: 20
    width: 4
    height: 2
  - title: Regular Bal
    name: Regular Bal
    model: banking
    explore: sequence_cal
    type: single_value
    fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    pivots: [sequence_cal.generic_date_year]
    fill_fields: [sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    filters:
      sequence_cal.generic_date_week: after 2018/01/01
    sorts: [sequence_cal.generic_date_week_of_year desc, sequence_cal.generic_date_year
        desc 0]
    limit: 500
    dynamic_fields: [{table_calculation: personal_savings, label: Personal Savings,
        expression: 'coalesce(${reg_savings.avg_balance}, offset(${reg_savings.avg_balance},1),
          offset(${reg_savings.avg_balance},2), offset(${reg_savings.avg_balance},3),
          offset(${reg_savings.avg_balance},4))', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: measure, _type_hint: number}, {table_calculation: dj_savings,
        label: DJ Savings, expression: 'coalesce(${djsavings.avg_balance}, offset(${djsavings.avg_balance},1),
          offset(${djsavings.avg_balance},2), offset(${djsavings.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, is_disabled: true, _kind_hint: measure,
        _type_hint: number}, {table_calculation: dj_checking, label: DJ Checking,
        expression: 'coalesce(${djchecking.avg_balance}, offset(${djchecking.avg_balance},1),
          offset(${djchecking.avg_balance},2), offset(${djchecking.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, is_disabled: true, _kind_hint: measure,
        _type_hint: number}, {table_calculation: personal_checking, label: Personal
          Checking, expression: 'coalesce(${reg_checking.avg_balance}, offset(${reg_checking.avg_balance},1),
          offset(${reg_checking.avg_balance},2), offset(${reg_checking.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, is_disabled: true, _kind_hint: measure,
        _type_hint: number}, {table_calculation: 2018_average_balance, label: 2018
          Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2018,
          mean(${reg_savings.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: 2019_average_balance,
        label: 2019 Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2019,
          mean(${reg_savings.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: current_checking_balance,
        label: Current Checking Balance, expression: 'index( pivot_index(${reg_checking.avg_balance},
          1), min(match(pivot_where(extract_years(${sequence_cal.generic_date_year})=2020,
          ${reg_checking.avg_balance}), pivot_where(extract_years(${sequence_cal.generic_date_year})=2020,
          ${reg_checking.avg_balance}))))', value_format: !!null '', value_format_name: usd,
        _kind_hint: supermeasure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: 2018_average_balance,
            id: 2018_average_balance, name: 2018 Average Balance}, {axisId: 2019_average_balance,
            id: 2019_average_balance, name: 2019 Average Balance}, {axisId: personal_savings,
            id: 2018 - personal_savings, name: 2018 - Personal Savings}, {axisId: personal_savings,
            id: 2019 - personal_savings, name: 2019 - Personal Savings}], showLabels: true,
        showValues: true, maxValue: !!null '', valueFormat: "$0,k", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    hide_legend: true
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      2018 - personal_checking: "#929292"
      2019 - personal_checking: "#62bad4"
      2018_average_balance: "#92818d"
      2018 - dj_checking: "#92818d"
      2019 - dj_checking: "#90c8ae"
      2019_average_balance: "#62bad4"
      2018 - dj_savings: "#929292"
      2019 - dj_savings: "#90c8ae"
      2018 - personal_savings: "#92818d"
    series_point_styles:
      2018_average_balance: triangle-down
      2019_average_balance: triangle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    trend_lines: []
    show_null_points: false
    interpolation: linear
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, sequence_cal.generic_date_week_of_year]
    listen: {}
    row: 0
    col: 20
    width: 4
    height: 2
  - title: DJ C Bal
    name: DJ C Bal
    model: banking
    explore: sequence_cal
    type: single_value
    fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    pivots: [sequence_cal.generic_date_year]
    fill_fields: [sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    filters:
      sequence_cal.generic_date_week: after 2018/01/01
    sorts: [sequence_cal.generic_date_week_of_year desc, sequence_cal.generic_date_year
        desc 0]
    limit: 500
    dynamic_fields: [{table_calculation: personal_savings, label: Personal Savings,
        expression: 'coalesce(${reg_savings.avg_balance}, offset(${reg_savings.avg_balance},1),
          offset(${reg_savings.avg_balance},2), offset(${reg_savings.avg_balance},3),
          offset(${reg_savings.avg_balance},4))', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: measure, _type_hint: number}, {table_calculation: dj_savings,
        label: DJ Savings, expression: 'coalesce(${djsavings.avg_balance}, offset(${djsavings.avg_balance},1),
          offset(${djsavings.avg_balance},2), offset(${djsavings.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, is_disabled: true, _kind_hint: measure,
        _type_hint: number}, {table_calculation: dj_checking, label: DJ Checking,
        expression: 'coalesce(${djchecking.avg_balance}, offset(${djchecking.avg_balance},1),
          offset(${djchecking.avg_balance},2), offset(${djchecking.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, is_disabled: true, _kind_hint: measure,
        _type_hint: number}, {table_calculation: personal_checking, label: Personal
          Checking, expression: 'coalesce(${reg_checking.avg_balance}, offset(${reg_checking.avg_balance},1),
          offset(${reg_checking.avg_balance},2), offset(${reg_checking.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, is_disabled: true, _kind_hint: measure,
        _type_hint: number}, {table_calculation: 2018_average_balance, label: 2018
          Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2018,
          mean(${reg_savings.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: 2019_average_balance,
        label: 2019 Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2019,
          mean(${reg_savings.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: current_checking_balance,
        label: Current Checking Balance, expression: 'index( pivot_index(${reg_checking.avg_balance},
          1), min(match(pivot_where(extract_years(${sequence_cal.generic_date_year})=2019,
          ${reg_checking.avg_balance}), pivot_where(extract_years(${sequence_cal.generic_date_year})=2019,
          ${reg_checking.avg_balance}))))', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: current_dj_c_balance,
        label: Current DJ C Balance, expression: 'index( pivot_index(${djchecking.avg_balance},
          1), min(match(pivot_where(extract_years(${sequence_cal.generic_date_year})=2020,
          ${djchecking.avg_balance}), pivot_where(extract_years(${sequence_cal.generic_date_year})=2020,
          ${djchecking.avg_balance}))))', value_format: !!null '', value_format_name: usd,
        is_disabled: false, _kind_hint: supermeasure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: 2018_average_balance,
            id: 2018_average_balance, name: 2018 Average Balance}, {axisId: 2019_average_balance,
            id: 2019_average_balance, name: 2019 Average Balance}, {axisId: personal_savings,
            id: 2018 - personal_savings, name: 2018 - Personal Savings}, {axisId: personal_savings,
            id: 2019 - personal_savings, name: 2019 - Personal Savings}], showLabels: true,
        showValues: true, maxValue: !!null '', valueFormat: "$0,k", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    hide_legend: true
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      2018 - personal_checking: "#929292"
      2019 - personal_checking: "#62bad4"
      2018_average_balance: "#92818d"
      2018 - dj_checking: "#92818d"
      2019 - dj_checking: "#90c8ae"
      2019_average_balance: "#62bad4"
      2018 - dj_savings: "#929292"
      2019 - dj_savings: "#90c8ae"
      2018 - personal_savings: "#92818d"
    series_point_styles:
      2018_average_balance: triangle-down
      2019_average_balance: triangle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    trend_lines: []
    show_null_points: false
    interpolation: linear
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, sequence_cal.generic_date_week_of_year]
    listen: {}
    row: 4
    col: 20
    width: 4
    height: 2
  - title: DJ S Bal
    name: DJ S Bal
    model: banking
    explore: sequence_cal
    type: single_value
    fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    pivots: [sequence_cal.generic_date_year]
    fill_fields: [sequence_cal.generic_date_week_of_year, sequence_cal.generic_date_year]
    filters:
      sequence_cal.generic_date_week: after 2018/01/01
    sorts: [sequence_cal.generic_date_week_of_year desc, sequence_cal.generic_date_year
        desc 0]
    limit: 500
    dynamic_fields: [{table_calculation: personal_savings, label: Personal Savings,
        expression: 'coalesce(${reg_savings.avg_balance}, offset(${reg_savings.avg_balance},1),
          offset(${reg_savings.avg_balance},2), offset(${reg_savings.avg_balance},3),
          offset(${reg_savings.avg_balance},4))', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: measure, _type_hint: number}, {table_calculation: dj_savings,
        label: DJ Savings, expression: 'coalesce(${djsavings.avg_balance}, offset(${djsavings.avg_balance},1),
          offset(${djsavings.avg_balance},2), offset(${djsavings.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, is_disabled: true, _kind_hint: measure,
        _type_hint: number}, {table_calculation: dj_checking, label: DJ Checking,
        expression: 'coalesce(${djchecking.avg_balance}, offset(${djchecking.avg_balance},1),
          offset(${djchecking.avg_balance},2), offset(${djchecking.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, is_disabled: true, _kind_hint: measure,
        _type_hint: number}, {table_calculation: personal_checking, label: Personal
          Checking, expression: 'coalesce(${reg_checking.avg_balance}, offset(${reg_checking.avg_balance},1),
          offset(${reg_checking.avg_balance},2), offset(${reg_checking.avg_balance},3))',
        value_format: !!null '', value_format_name: usd, is_disabled: true, _kind_hint: measure,
        _type_hint: number}, {table_calculation: 2018_average_balance, label: 2018
          Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2018,
          mean(${reg_savings.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: 2019_average_balance,
        label: 2019 Average Balance, expression: 'if(mod(${sequence_cal.generic_date_week_of_year},
          4) = 0, pivot_where(extract_years(${sequence_cal.generic_date_year}) = 2019,
          mean(${reg_savings.avg_balance})), null)', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: current_checking_balance,
        label: Current Checking Balance, expression: 'index( pivot_index(${reg_checking.avg_balance},
          1), min(match(pivot_where(extract_years(${sequence_cal.generic_date_year})=2019,
          ${reg_checking.avg_balance}), pivot_where(extract_years(${sequence_cal.generic_date_year})=2019,
          ${reg_checking.avg_balance}))))', value_format: !!null '', value_format_name: usd,
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: current_dj_c_balance,
        label: Current DJ C Balance, expression: 'index( pivot_index(${djsavings.avg_balance},
          1), min(match(pivot_where(extract_years(${sequence_cal.generic_date_year})=2020,
          ${djsavings.avg_balance}), pivot_where(extract_years(${sequence_cal.generic_date_year})=2020,
          ${djsavings.avg_balance}))))', value_format: !!null '', value_format_name: usd,
        is_disabled: false, _kind_hint: supermeasure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: 2018_average_balance,
            id: 2018_average_balance, name: 2018 Average Balance}, {axisId: 2019_average_balance,
            id: 2019_average_balance, name: 2019 Average Balance}, {axisId: personal_savings,
            id: 2018 - personal_savings, name: 2018 - Personal Savings}, {axisId: personal_savings,
            id: 2019 - personal_savings, name: 2019 - Personal Savings}], showLabels: true,
        showValues: true, maxValue: !!null '', valueFormat: "$0,k", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    hide_legend: true
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      2018 - personal_checking: "#929292"
      2019 - personal_checking: "#62bad4"
      2018_average_balance: "#92818d"
      2018 - dj_checking: "#92818d"
      2019 - dj_checking: "#90c8ae"
      2019_average_balance: "#62bad4"
      2018 - dj_savings: "#929292"
      2019 - dj_savings: "#90c8ae"
      2018 - personal_savings: "#92818d"
    series_point_styles:
      2018_average_balance: triangle-down
      2019_average_balance: triangle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    trend_lines: []
    show_null_points: false
    interpolation: linear
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [reg_savings.avg_balance, djsavings.avg_balance, djchecking.avg_balance,
      reg_checking.avg_balance, sequence_cal.generic_date_week_of_year]
    listen: {}
    row: 6
    col: 20
    width: 4
    height: 2
  - title: Folio All Time
    name: Folio All Time
    model: Net
    explore: folio_export
    type: looker_line
    fields: [folio_export.date_week, folio_export.total_market_value]
    fill_fields: [folio_export.date_week]
    sorts: [folio_export.date_week desc]
    limit: 500
    dynamic_fields: [{table_calculation: contributed_amount, label: Contributed Amount,
        expression: '100000+400*(diff_months(date(2017, 10, 30), ${folio_export.date_week})+1)+${folio_export.total_market_value}*0',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: growth, label: Growth, expression: "(${folio_export.total_market_value}-${contributed_amount})/100000",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: folio_export.total_market_value,
            id: folio_export.total_market_value, name: Total Market Value}], showLabels: true,
        showValues: true, maxValue: 125000, minValue: 75000, unpinAxis: false, tickDensity: default,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hide_legend: true
    legend_position: center
    series_types:
      folio_export.total_market_value: area
    point_style: none
    series_colors:
      folio_export.total_market_value: "#a2dcf3"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    trend_lines: []
    show_null_points: true
    interpolation: linear
    hidden_fields: [growth]
    listen: {}
    row: 16
    col: 5
    width: 14
    height: 5
  - title: Yield All Time
    name: Yield All Time
    model: Net
    explore: folio_export
    type: single_value
    fields: [folio_export.date_week, folio_export.total_market_value]
    fill_fields: [folio_export.date_week]
    sorts: [folio_export.date_week desc]
    limit: 500
    dynamic_fields: [{table_calculation: contributed_amount, label: Contributed Amount,
        expression: '100000+400*(diff_months(date(2017, 10, 30), ${folio_export.date_week})+1)+${folio_export.total_market_value}*0',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: growth, label: Growth, expression: "(${folio_export.total_market_value}-${contributed_amount})/100000",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Last week's Growth
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: folio_export.total_market_value,
            id: folio_export.total_market_value, name: Total Market Value}], showLabels: true,
        showValues: true, maxValue: 125000, minValue: 75000, unpinAxis: false, tickDensity: default,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      folio_export.total_market_value: "#a2dcf3"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    trend_lines: []
    show_null_points: true
    interpolation: linear
    hidden_fields: [folio_export.total_market_value, contributed_amount, folio_export.date_week]
    listen: {}
    row: 16
    col: 19
    width: 5
    height: 5
  - title: Tomorrow's Deposit
    name: Tomorrow's Deposit
    model: banking
    explore: sequence_cal
    type: single_value
    fields: [sequence_cal.generic_date_week, savtracker.sum_deposit, savings_goal_2019]
    filters:
      sequence_cal.generic_date_week: after 2019/09/01
    sorts: [sequence_cal.generic_date_week desc]
    limit: 500
    dynamic_fields: [{table_calculation: tomorrows_deposit, label: Tomorrow's Deposit,
        expression: '(${savings_goal_2019}-${running_balance}) / diff_days(now(),
          to_date("2020"))', value_format: !!null '', value_format_name: usd, is_disabled: false,
        _kind_hint: measure, _type_hint: number}, {table_calculation: running_balance,
        label: Running Balance, expression: "19812 # starting balance\n+sum(${savtracker.sum_deposit})",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {dimension: savings_goal_2019, label: Savings Goal 2019, expression: '30000',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Tomorrow's Deposit
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    hidden_fields: [savtracker.sum_deposit]
    listen: {}
    row: 16
    col: 0
    width: 5
    height: 5
