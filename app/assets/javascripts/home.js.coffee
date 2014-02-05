# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


chartData = [
  date: "2013-12-25"
  visits: 4252
,
  date: "2013-12-26"
  visits: 1882
,
  date: "2013-12-27"
  visits: 1809
,
  date: "2013-12-28"
  visits: 1322
,
  date: "2013-12-29"
  visits: 1122
,
  date: "2013-12-30"
  visits: 1114
,
  date: "2013-12-31"
  visits: 984
,
  date: "2014-01-01"
  visits: 711
,
  date: "2014-01-02"
  visits: 665
,
  date: "2014-01-03"
  visits: 580
,
  date: "2014-01-04"
  visits: 443
,
  date: "2014-01-05"
  visits: 441
,
  date: "2014-01-06"
  visits: 395
,
  date: "2014-01-07"
  visits: 386
,
  date: "2014-01-08"
  visits: 384
,
  date: "2014-01-09"
  visits: 338
,
  date: "2014-01-10"
  visits: 328
]


AmCharts.ready ->

  AmCharts.theme = AmCharts.themes.dark

  chart = new AmCharts.AmSerialChart()
  chart.dataProvider = chartData
  chart.categoryField = "date"
  chart.dataDateFormat = "YYYY-MM-DD"

  categoryAxis = chart.categoryAxis
  categoryAxis.parseDates = true
  categoryAxis.minPeriod = "DD"
  categoryAxis.autoGridCount = false
  categoryAxis.gridCount = chartData.length
  categoryAxis.gridPosition = "start"
  categoryAxis.labelRotation = 90

  graph = new AmCharts.AmGraph()
  graph.valueField = "visits"
  graph.type = "line"
  graph.balloonText = "[[date]]: <b>[[value]]</b>"
  graph.fillAlphas = 0.8

  chartScrollbar = new AmCharts.ChartScrollbar()
  chartScrollbar.graph = graph
  chartScrollbar.scrollbarHeight = 50
  chart.addChartScrollbar chartScrollbar


  chart.addGraph graph

  chart.write "chartdiv"