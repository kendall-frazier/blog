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

  AmCharts.theme = AmCharts.themes.light

  gaugeChart = new AmCharts.AmAngularGauge()
  gaugeAxis = new AmCharts.GaugeAxis()
  gaugeAxis.startValue = 0
  gaugeAxis.endValue = 220

  gaugeBand = new AmCharts.GaugeBand()
  gaugeBand.startValue = 0
  gaugeBand.endValue = 120
  gaugeBand.alpha = 1
  gaugeBand.color = '#FFFFFF'

  gaugeAxis.startAngle = -90
  gaugeAxis.endAngle = 90

  # gaugeAxis.addBand gaugeBand

  # debugger


  # debugger

  arrow = new AmCharts.GaugeArrow()
  arrow.value = 100
  gaugeChart.addArrow arrow

  gaugeChart.addAxis gaugeAxis

  debugger

  gaugeChart.write "gaugeChartDiv"


  # ========================================================

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

  chartCursor = new AmCharts.ChartCursor()
  chart.addChartCursor(chartCursor)

  graph = new AmCharts.AmGraph()
  graph.valueField = "visits"
  graph.type = "line"
  graph.balloonText = "[[date]]: <b>[[value]]</b>"
  graph.fillAlphas = 0
  graph.bullet = 'round'
  graph.bulletBorderAlpha = 1
  graph.bulletColor = '#ffffff'
  graph.hideBulletsCount = 100
  graph.useLineColorForBulletBorder = true


  chartScrollbar = new AmCharts.ChartScrollbar()
  chartScrollbar.graph = graph
  chartScrollbar.scrollbarHeight = 50
  chart.addChartScrollbar chartScrollbar


  chart.addGraph graph

  chart.pathToImages = 'https://employeereferrals.s3.amazonaws.com/images/amcharts/'

  chart.write "chartdiv"