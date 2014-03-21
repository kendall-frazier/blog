# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


chartData = [
  first_name: "Edmund",
  last_name: "Woo",
  number_of_referrals_without_contact_attempts: 12,
  contact_attempt_points: 0
,
  first_name: "Gina",
  last_name: "Conigliaro",
  number_of_referrals_without_contact_attempts: 8,
  contact_attempt_points: 0
,
  first_name: "Jason",
  last_name: "Buss",
  number_of_referrals_without_contact_attempts: 7,
  contact_attempt_points: 0
,
  first_name: "David",
  last_name: "Christensen",
  number_of_referrals_without_contact_attempts: 6,
  contact_attempt_points: 0
,
  first_name: "Cindy",
  last_name: "Aponte",
  number_of_referrals_without_contact_attempts: 5,
  contact_attempt_points: 0
,
  first_name: "Heather",
  last_name: "Smith",
  number_of_referrals_without_contact_attempts: 5,
  contact_attempt_points: 0
,
  first_name: "Sharonica",
  last_name: "Hendrieth-Brown",
  number_of_referrals_without_contact_attempts: 3,
  contact_attempt_points: 0
,
  first_name: "Angela",
  last_name: "Carter",
  number_of_referrals_without_contact_attempts: 3,
  contact_attempt_points: 0
,
  first_name: "Liz",
  last_name: "Price",
  number_of_referrals_without_contact_attempts: 2,
  contact_attempt_points: 0
,
  first_name: "Emily",
  last_name: "Korb",
  number_of_referrals_without_contact_attempts: 2,
  contact_attempt_points: 2
,
  first_name: "Melinda",
  last_name: "C.",
  number_of_referrals_without_contact_attempts: 1,
  contact_attempt_points: 0
,
  first_name: "Christine",
  last_name: "Collins",
  number_of_referrals_without_contact_attempts: 0,
  contact_attempt_points: 1
,
  first_name: "Janice",
  last_name: "Davis",
  number_of_referrals_without_contact_attempts: 0,
  contact_attempt_points: 1
,
  first_name: "Alison",
  last_name: "Dorsa",
  number_of_referrals_without_contact_attempts: 0,
  contact_attempt_points: 1
,
  first_name: "Jacquelene",
  last_name: "Thomas",
  number_of_referrals_without_contact_attempts: 0,
  contact_attempt_points: 1
,
  first_name: "Gregory",
  last_name: "Owens",
  number_of_referrals_without_contact_attempts: 0,
  contact_attempt_points: 2
,
  first_name: "Condenesa",
  last_name: "Smith",
  number_of_referrals_without_contact_attempts: 0,
  contact_attempt_points: 1
,
  first_name: "Brady",
  last_name: "Banks",
  number_of_referrals_without_contact_attempts: 0,
  contact_attempt_points: 1
,
  first_name: "Deirdre",
  last_name: "Potter",
  number_of_referrals_without_contact_attempts: 0,
  contact_attempt_points: 1
,
  first_name: "Caroline",
  last_name: "Rodriguez",
  number_of_referrals_without_contact_attempts: 0,
  contact_attempt_points: 1
,
  first_name: "Kimberly",
  last_name: "Sydnor",
  number_of_referrals_without_contact_attempts: 0,
  contact_attempt_points: 1
]

AmCharts.ready ->

  $('#chartdiv').height(chartData.length * 40)

  chart = new AmCharts.AmSerialChart()
  chart.dataProvider = chartData
  chart.categoryField = 'first_name'
  chart.startDuration = 1
  chart.columnWidth = 0.95
  chart.plotAreaBorderAlpha = 0

  # this single line makes the chart a bar chart
  chart.rotate = true

  # AXES
  # Category
  categoryAxis = chart.categoryAxis
  categoryAxis.gridPosition = 'start'
  categoryAxis.gridAlpha = 0.1
  categoryAxis.axisAlpha = 0

  # Cursor
  chartCursor = new AmCharts.ChartCursor()
  chartCursor.showNextAvailable = true
  chartCursor.valueBalloonsEnabled = true
  chartCursor.cursorPosition = 'mouse'
  chartCursor.cursorAlpha = 0
  chartCursor.cursorColor = '#333333'
  chart.addChartCursor(chartCursor)

  # Value
  valueAxis = new AmCharts.ValueAxis()
  valueAxis.axisAlpha = 0
  valueAxis.gridAlpha = 0.1
  valueAxis.position = 'top'
  chart.addValueAxis valueAxis

  # GRAPHS
  # first graph
  graph1 = new AmCharts.AmGraph()
  graph1.type = 'column'
  graph1.title = 'Uncontacted referrals'
  graph1.valueField = 'number_of_referrals_without_contact_attempts'
  graph1.balloonText = "[[category]]'s uncontacted referrals:[[value]]"
  graph1.lineAlpha = 0
  graph1.fillColors = '#ADD981'
  graph1.fillAlphas = 1
  chart.addGraph graph1

  # second graph
  graph2 = new AmCharts.AmGraph()
  graph2.type = 'column'
  graph2.title = 'Contact attempts'
  graph2.valueField = 'contact_attempt_points'
  graph2.balloonText = "[[category]]'s contact attempts:[[value]]"
  graph2.lineAlpha = 0
  graph2.fillColors = '#81acd9'
  graph2.fillAlphas = 1
  chart.addGraph graph2

  # LEGEND
  legend = new AmCharts.AmLegend()
  chart.addLegend legend

  chart.write 'chartdiv'
