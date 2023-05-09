- dashboard: bookings
  title: Bookings
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: lgtiJA2BzL3GYTW1zy3tSw
  elements:
  - title: Thinking Ahead
    name: Thinking Ahead
    model: djjeffty
    explore: inquiries
    type: looker_column
    fields: [inquiries.count, inquiries.months_lead]
    filters:
      inquiries.months_lead: NOT NULL
    sorts: [inquiries.months_lead desc]
    limit: 500
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '12'
    series_types: {}
    series_colors:
      inquiries.count: "#079c98"
    defaults_version: 1
    hidden_fields: []
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    groupBars: true
    labelSize: 10pt
    showLegend: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    note_state: collapsed
    note_display: above
    note_text: How far ahead do interested clients inquire for DJ services?
    listen: {}
    row: 0
    col: 0
    width: 11
    height: 7
  - title: Competitive Months
    name: Competitive Months
    model: djjeffty
    explore: inquiries
    type: looker_column
    fields: [inquiries.count, inquiries.event_month_name, inquiries.event_year]
    pivots: [inquiries.event_year]
    fill_fields: [inquiries.event_year]
    filters:
      inquiries.event_month_name: "-null"
    sorts: [inquiries.event_year, inquiries.event_month_name]
    limit: 500
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '12'
    series_types: {}
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    groupBars: true
    labelSize: 10pt
    showLegend: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    hidden_pivots: {}
    note_state: expanded
    note_display: above
    note_text: What time of year is busiest for events?
    listen: {}
    row: 0
    col: 11
    width: 12
    height: 7
  - title: Inquiry Activity
    name: Inquiry Activity
    model: djjeffty
    explore: inquiries
    type: looker_column
    fields: [inquiries.count, inquiries.submitted_month_name, inquiries.submitted_year]
    pivots: [inquiries.submitted_year]
    fill_fields: [inquiries.submitted_month_name, inquiries.submitted_year]
    sorts: [inquiries.submitted_year, inquiries.submitted_month_name]
    limit: 500
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '12'
    series_types: {}
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    groupBars: true
    labelSize: 10pt
    showLegend: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: What time of year is busiest for website inquries?
    listen: {}
    row: 7
    col: 11
    width: 12
    height: 6
  - title: Booking Activity
    name: Booking Activity
    model: djjeffty
    explore: inquiries
    type: looker_column
    fields: [contract_responses.timestamp_month_name, contract_responses.timestamp_year,
      contract_responses.count]
    pivots: [contract_responses.timestamp_year]
    fill_fields: [contract_responses.timestamp_year]
    filters:
      contract_responses.timestamp_month_name: "-null"
    sorts: [contract_responses.timestamp_year, contract_responses.timestamp_month_name]
    limit: 500
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '12'
    series_types: {}
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    groupBars: true
    labelSize: 10pt
    showLegend: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    note_text: What time of year is busiest for bookings?
    listen: {}
    row: 13
    col: 11
    width: 12
    height: 6
