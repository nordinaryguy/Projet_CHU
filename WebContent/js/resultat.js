function addChart(divName,i) {
	Resultat.getDataCSV(i, function(data) {
		Resultat.getAnswers(i, function(answers) {
			Highcharts.chart(divName, {
				chart: {
					type: 'bar'
				},
				title: {
					text: null
				},
				exporting: {},
				xAxis: {
					categories: []
				},
				yAxis: {
					min: 0,
					max: 100,
					title: {
						text: 'Pourcentage de la population de réference'
					},
					labels: {
						format: "{value} %"
					}
				},
				legend: {
					reversed: true
				},
				plotOptions: {
					series: {
						stacking: 'normal',
						dataLabels: {
							enabled: true,
							color: '#000',
							style: {fontWeight: 'bolder'},
							formatter: function() {
								if(answers[this.x] == this.series.name)
									return "✓";
							},
							inside: true
						}
					}
				},
				data: {
					csv: data
				},
				series: [{
				     showInLegend: true
				},{
				     showInLegend: false
				},{
				     showInLegend: true
				},{
				     showInLegend: true
				},{
				     showInLegend: true
				},{
				     showInLegend: false
				},{
				     showInLegend: true
				}],
				colors: [
					'#ff3d00',
					'#000',
					'#ff9100',
					'#000',
					'#ffea00',
					'#000',
					'#00e676'
				],
				credits: {
					enabled: false
				}
			});
		});
	});
}

function addAllChart(divName) {
	Resultat.sizeDataCSV(function(size) {
		for(var i = 0; i < size; i++) {
			var divChart = 'id_q' + i;
			document.getElementById(divName).innerHTML += '<div id="' + divChart + 
			'" style="min-width: 310px; max-width: 1000px; margin: 0 auto"></div>';
			addChart(divChart,i);
		}
	});
}

function addHisto(divName) {
	Resultat.getCategoriesHisto(function(categories) {
		Resultat.getDataHisto(function(data) {
			Resultat.getColorsHisto(function(colors) {
				Highcharts.chart(divName, {
					title: {
						text: null
					},
					chart: {
						type: 'column'
					},
					tooltip: {
					    formatter: function() {
					        return 'Score : <b>' + this.x + '</b> <br> Pourcentage : <b>' + this.y + ' % </b>';
					    }
					},
					yAxis: {
						title: { text: 'Pourcentage' },
						labels: { format: "{value} %"}
					},
					xAxis: {
						categories: categories,
						title: {
							text: 'Score',
							align: 'high'
						},
						plotBands: [{
							borderColor: 'black',
							borderWidth: 1,
							from: -1.5,
							to: 0.5,
							label: {
								text: data[0]  + " %",
								y: -1
							}
						},
						{
							borderColor: 'black',
							borderWidth: 1,
							from: 1.5,
							to: data.length,
							label: {
								text: (data.reduce((a, b) => a + b, 0) - data[0] - data[1]) + " %",
								y: -1
							}
						}]
					},
					plotOptions: {
						column: {
							colorByPoint: true
						}
					},
					series: [{
						name: 'Score',
						data: data
					}],
					legend: {
						enabled: false
					},
					colors: colors,
					credits: {
						enabled: false
					}
				});
			});
		});
	});
}


function addRPE(divName) {
	Resultat.getCategoriesRPE(function(categories) {
		Resultat.getDataRPE(function(data) {
			Resultat.getColorsRPE(function(colors) {
				Highcharts.chart(divName, {
					chart: {
						type: 'bar'
					},
					title: {
						text: null
					},
					tooltip: {
					    formatter: function() {
					        return 'RPE : <b>' + this.x + '</b> <br> Pourcentage : <b>' + this.y + ' % </b>';
					    }
					},
					xAxis: {
						categories: categories,
						title: {
							text: null
						},
						plotBands: [{
							borderColor: 'black',
							borderWidth: 1,
							from: -1.5,
							to: 0.5,
							label: {
								text: data[0]  + " %",
								align: "right",
								x: 1,
								y: 15,
								rotation: 90
							}
						},
						{
							borderColor: 'black',
							borderWidth: 1,
							from: 1.5,
							to: data.length,
							label: {
								text: (data.reduce((a, b) => a + b, 0) - data[0] - data[1]) + " %",
								align: "right",
								x: 1,
								rotation: 90
							}
						}]
					},
					yAxis: {
						min: 0,
						title: {
							text: 'Pourcentage',
							align: 'high'
						},
						labels: {
							overflow: 'justify',
							format: "{value} %"
						}
					},
					plotOptions: {
						bar: {
							dataLabels: {
								enabled: true,
								formatter: function () { return this.y + " %"; }
							},
							colorByPoint: true
						}
					},
					legend: {
						enabled: false
					},
					series: [{
						name: 'RPE',
						data: data
					}],
					colors: colors,
					credits: {
						enabled: false
					}
				});
			});
		});
	});
}