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

  arrow = undefined
  gaugeAxis = undefined
  gaugeChart = undefined
  gaugeChart = new AmCharts.AmAngularGauge()
  gaugeAxis = new AmCharts.GaugeAxis()
  gaugeAxis.startValue = 0
  gaugeAxis.endValue = 20
  gaugeAxis.startAngle = -90
  gaugeAxis.endAngle = 90
  gaugeAxis.axisThickness = 5
  gaugeAxis.labelFrequency = 1
  gaugeAxis.labelOffset = 5
  gaugeAxis.inside = false
  gaugeAxis.minorTickInterval = 5
  gaugeAxis.tickColor = "#000000"
  gaugeAxis.tickLength = 10
  gaugeAxis.tickThickness = 5
  gaugeAxis.valueInterval = 5
  gaugeAxis.unit = "%"
  gaugeAxis.bottomText = "Percent of employees with synced social networks"
  gaugeBandRed = undefined
  gaugeBandRed = new AmCharts.GaugeBand
  gaugeBandRed.startValue = 0
  gaugeBandRed.endValue = 5
  gaugeBandRed.alpha = 1
  gaugeBandRed.color = "#cc4748"
  gaugeBandRed.innerRadius = "55%"
  gaugeBandYellow = undefined
  gaugeBandYellow = new AmCharts.GaugeBand
  gaugeBandYellow.startValue = 5
  gaugeBandYellow.endValue = 10
  gaugeBandYellow.alpha = 1
  gaugeBandYellow.color = "#fdd400"
  gaugeBandYellow.innerRadius = "55%"
  gaugeBandGreen = undefined
  gaugeBandGreen = new AmCharts.GaugeBand
  gaugeBandGreen.startValue = 10
  gaugeBandGreen.endValue = 20
  gaugeBandGreen.alpha = 1
  gaugeBandGreen.color = "#84b761"
  gaugeBandGreen.innerRadius = "55%"
  gaugeAxis.bands = [ gaugeBandRed, gaugeBandYellow, gaugeBandGreen ]
  gaugeChart.addAxis gaugeAxis
  arrow = new AmCharts.GaugeArrow()
  arrow.value = 11
  arrow.innerRadius = "25%"
  arrow.nailAlpha = 0
  arrow.alpha = 1
  arrow.radius = "80%"
  arrow.startWidth = 15
  gaugeChart.addArrow arrow
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