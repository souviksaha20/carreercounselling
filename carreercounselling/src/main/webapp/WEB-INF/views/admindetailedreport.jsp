
<%@ include file="nav2.jsp"%>
<head>
<script src="${js}/jquery.min.js"></script></head>
<div class="breadcrumbs">
	<div class="col-sm-4">
		<div class="page-header float-left">
			<div class="page-title">
				<h1>Report</h1>
			</div>
		</div>
	</div>
	<div class="col-sm-8">
		<div class="page-header float-right">
			<div class="page-title">
				<ol class="breadcrumb text-right">
					<li class="active">Report</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="col-sm-12 col-lg-12">
	<div class="row">
	<div class="col-sm-12 col-lg-12">
		<div class="card card-chart">
					<div class="card-header card-header-success">
					  <center><h1>Student Report</h1></center>	
					</div>
		<div class="card-body">
		
		</div>
		</div>
   </div>
	<div class="col-sm-8 col-lg-8">
		<div class="card card-chart">
			<div class="card-header card-header-success">
				<center><h3>Doughnut</h3></center>
			</div>
			<div class="card-body"  Style="height:480px">
				<div class="card-block col-sm-12 col-lg-12 contaner">
					<svg id="svg" style="height:320px;width:650px"></svg>
				</div>
				<div style="height:320px;width:650px" id="datadisplay"></div>

			</div>
			<div class="card-footer">
			</div>
		</div>
	</div>
	<div class="col-sm-4 col-lg-4">
		<c:forEach var="cc" items="${dimensions}">
			<a href="<c:url value="/report/${cc}"/>">
			<div id="${cc}" class="card card-chart" style="display: none">
					<div class="card-body" style="height:5%">
						<center><h4 class="card-title">${cc}</h4></center>
					</div>
			</div>
			</a>
		</c:forEach>
		</div>
  </div>
</div>		<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
		<script
			src='http://cdnjs.cloudflare.com/ajax/libs/snap.svg/0.3.0/snap.svg-min.js'></script>
		<script type="text/javascript">
		var homo=${scarray};
		var obj=[];
		var objdim=[];
		for(var k in homo)
			{
			obj.push(homo[k]);
			objdim.push(homo[k]);
			}
		for(var i=0;i<obj.length;i++)
			{
			obj[i]=obj[i].replace(/[0-9.]/g, '');
			obj[i]=obj[i].trim();
			document.getElementById(obj[i]).style.display = "block";
			}
		if (obj.length>3)
			document.getElementById('datadisplay').innerHTML="Above graph shows your scores in each dimensions. Usually, the best 3 dimensions are shown to the right side of the screen upon clicking which a detailed report can be obtained. However, you have a tie in your results. Hence the top "+obj.length+" dimesions, "+obj.slice(0,obj.length-1).join(', ')+" and "+obj[obj.length-1]+" are displayed. Click on the dimensions to get a detailed report.";
		else 
			document.getElementById('datadisplay').innerHTML="Above graph shows your scores in each dimensions. Your top 3 dimensions are "+obj.slice(0,obj.length-1).join(', ')+" and "+obj[obj.length-1]+". A detailed report for each of the dimensions is displayed on the right side of the screen."
		document.getElementById('datadisplay').style.textAlign = "justify";
			var _gaq = _gaq || [];
			_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
			_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
			_gaq.push([ '_trackPageview' ]);
		
			(function() {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
			})();
		</script>

		</body>
		<script>
			/***********************************************************
			 * Create framework
			 ***********************************************************/
			(function($, doc, win, Snap) {
				"use strict";
		
				function Donut(el, opts) {
					this.$el = $(el);
					this.opts = opts;
					this.snap = Snap(el);
		
					this.startShowAnimation = Donut.prototype.startShowAnimation;
		
					this.init();
				}
		
				/***********************************************************
				 * Init donut
				 ***********************************************************/
				Donut.prototype.init = function() {
					this.drawLegend();
					this.drawBaseCircle();
				};
		
				/***********************************************************
				 * Draw base circle
				 ***********************************************************/
				Donut.prototype.drawBaseCircle = function() {
					var s = this.snap,
						o = this.opts;
		
					// create diagonal pattern
					var pattern = s.path("M10-5-10,15M15,0,0,15M0-5-20,15").attr({
						fill : "none",
						stroke : "none",
						strokeWidth : 0
					});
		
					// create masking circle
					var mask = s.circle(o.center.y, o.center.y, o.radius).attr({
						fill : pattern
					});
		
					// create circle
					Donut.prototype.circle = s.circle(o.center.y, o.center.y, o.radius).attr({
						fill : "r(0.5, 0.5, 0.5)#FFC575-#fff",
						mask : mask,
						stroke : '#D9D9D9',
						strokeWidth : 0,
						opacity : 0
					});
		
					// create border circle
					s.circle(o.center.y, o.center.y, o.radius).attr({
						stroke : '#D9D9D9',
						fill : 'none',
						strokeWidth : 0
					});
				};
		
				/***********************************************************
				 * Draw legend
				 ***********************************************************/
				Donut.prototype.drawLegend = function() {
					var s = this.snap,
						o = this.opts,
						data = o.data;
		
					var x = o.center.x + o.radius + 50,
						step = 30,
						radius = 6,
						y = o.center.y - ((data.length / 2) * step) + (radius / 2) + ((step - radius) / 2);
		
					for (var i = 0; i < data.length; i++) {
						var d = data[i];
						var cust = ' ' + d.value + ' %';
						d.legend = {
							baseCircle : s.circle(x, y, radius),
							baseCircleRadius : radius,
							text : s.text(x + step, y + radius / 2, d.label + cust),
							center : {
								x : x,
								y : y,
							}
						}
		
						d.legend.baseCircle.attr({
							stroke : '0',
							fill : 'none',
							strokeWidth : 0,
							color : ''
						});
		
						y += step;
					}
				};
		
				/***********************************************************
				 * Build an arc svg path
				 ***********************************************************/
				Donut.prototype.buildArcPath = function(center, radius, degreesStart, degreesEnd) {
					var start = this.translatedPoint(center, radius, degreesStart),
						end = this.translatedPoint(center, radius, degreesEnd),
						largeArc = (degreesEnd - degreesStart) > 180 ? 1 : 0;
		
					return "M" + start.x + "," + start.y + " A" + radius + "," + radius + " 0 " + largeArc + ",1 " + end.x + "," + end.y;
				};
		
				/***********************************************************
				 * Animate an arc throw his degrees 
				 ***********************************************************/
				Donut.prototype.animateArcByDegrees = function(arc, duration, callback) {
					var s = this.snap,
						t = this;
		
					Snap.animate(arc.degreesStart, arc.degreesEnd,
						function(degrees) {
							if (arc.draw) {
								arc.draw.remove();
							}
		
							arc.path = t.buildArcPath(arc.center, arc.radius, arc.degreesStart, degrees);
							arc.draw = s.path(arc.path);
		
							arc.draw.attr({
								stroke : arc.color,
								fill : 'none',
								strokeWidth : arc.strokeWidth,
								cursor : 'pointer'
							});
						},
						duration,
						mina.linear,
						function() {
							if (callback) {
								callback();
							}
						});
				};
		
				/***********************************************************
				 * Animate an arc throw his stroke width 
				 ***********************************************************/
				Donut.prototype.animateArcByStroke = function(arc, strokeWidthStart, strokeWidthEnd, duration, callback) {
					var s = this.snap,
						t = this;
		
					Snap.animate(strokeWidthStart, strokeWidthEnd,
						function(strokeWidth) {
							if (arc.draw) {
								arc.draw.remove();
							}
		
							var radius = arc.radius + (strokeWidth - arc.strokeWidth) / 6;
							arc.path = t.buildArcPath(arc.center, radius, arc.degreesStart, arc.degreesEnd);
							arc.draw = s.path(arc.path);
		
							arc.draw.attr({
								stroke : arc.color,
								fill : 'none',
								strokeWidth : strokeWidth,
								cursor : 'pointer'
							});
						},
						duration,
						mina.bounce,
						function() {
							if (callback) {
								callback();
							}
						});
				};
		
				/***********************************************************
				 * Create the legend circle
				 ***********************************************************/
				Donut.prototype.createLegendCircle = function(c) {
					c.draw = this.snap.circle(c.x, c.y, c.radius);
					c.draw.attr({
						fill : c.color
					});
				};
		
				/***********************************************************
				 * Start show animation of legend circle
				 ***********************************************************/
				Donut.prototype.animateShowLegendCircle = function(c, duration) {
					c.draw.transform('s0,' + c.x + ',' + c.y)
					c.draw.animate({
						transform : 's1,' + c.x + ',' + c.y
					}, duration, mina.bounce);
				};
		
				/***********************************************************
				 * Start show animation of donut and legend for one data entry
				 ***********************************************************/
				Donut.prototype.startShowAnimationOneEntry = function(d, percentStart, percentEnd, center, radius, callback) {
					d.arc = {
						percentStart : percentStart,
						percentEnd : percentEnd,
						degreesStart : parseFloat(percentStart) / 100 * 360,
						degreesEnd : parseFloat(percentEnd) / 100 * 360,
						color : d.color,
						strokeWidth : 40,
						center : center,
						radius : radius,
					}
		
					this.animateArcByDegrees(d.arc, 900, callback);
		
					d.legend.circle = {
						color : d.color,
						x : d.legend.center.x,
						y : d.legend.center.y,
						radius : d.legend.baseCircleRadius + 2
					}
		
					this.createLegendCircle(d.legend.circle);
					this.animateShowLegendCircle(d.legend.circle, 400);
				};
		
				/***********************************************************
				 * Translate a point by some degrees via a center and a radius
				 ***********************************************************/
				Donut.prototype.translatedPoint = function(center, radius, degrees) {
					var radians = Math.PI * (degrees - 270) / 180;
					return {
						x : center.x + radius * Math.cos(radians),
						y : center.y + radius * Math.sin(radians),
					}
				};
		
				/***********************************************************
				 * Highlight entry element legend circle and arc
				 ***********************************************************/
				Donut.prototype.hightlightElement = function(d) {
					var s = this.snap,
						o = this.opts,
						data = o.data;
		
					if (this.previousHighlightElement == d) {
						return;
					}
		
					if (this.previousHighlightElement) {
						this.normalElement(this.previousHighlightElement);
					}
					this.previousHighlightElement = d;
		
					var c = d.legend.circle;
					c.draw.animate({
						transform : 's1.3,' + c.x + ',' + c.y
					}, 200, mina.bounce);
		
					this.animateArcByStroke(d.arc, d.arc.strokeWidth, d.arc.strokeWidth + 20, 500);
				};
		
				/***********************************************************
				 * Normal entry element legend circle and arc
				 ***********************************************************/
				Donut.prototype.normalElement = function(d) {
					var s = this.snap,
						o = this.opts,
						t = this,
						data = o.data;
		
					var c = d.legend.circle;
					c.draw.animate({
						transform : 's1,' + c.x + ',' + c.y
					}, 500, mina.bounce);
		
					this.animateArcByStroke(d.arc, d.arc.strokeWidth + 6, d.arc.strokeWidth, 500, function() {
						d.arc.draw.mouseover(function() {
							t.hightlightElement(d);
						});
						d.arc.draw.click(function() {
							t.hightlightElement(d);
						});
					});
				};
		
				/***********************************************************
				 * Init animation interaction
				 ***********************************************************/
				Donut.prototype.initInteraction = function(d, step) {
					var s = this.snap,
						t = this,
						l = d.legend,
						a = d.arc;
		
					l.button = s.rect(l.center.x - 2 * l.baseCircleRadius, l.center.y - step / 2, 200, step);
		
					l.button.attr({
						opacity : 0,
						cursor : 'pointer',
						color : 'red'
					});
		
					l.button.mouseover(function() {
						t.hightlightElement(d);
		
		
					});
					l.button.click(function() {
						t.hightlightElement(d);
		
					});
		
					a.draw.mouseover(function() {
						t.hightlightElement(d);
		
		
					});
					a.draw.click(function() {
						t.hightlightElement(d);
					});
				};
		
				/***********************************************************
				 * Init animation interactions after showing animation
				 ***********************************************************/
				Donut.prototype.initInteractions = function() {
					var s = this.snap,
						o = this.opts,
						t = this,
						data = o.data;
		
					for (var i = 0; i < data.length; i++) {
						this.initInteraction(data[i], 30);
					}
				};
		
				/***********************************************************
				 * Start show animation of donut and legend for all data entry
				 ***********************************************************/
				Donut.prototype.startShowAnimation = function(index, totalPct, callback) {
					if (index && !totalPct) {
						callback = index;
						index = totalPct;
					}
		
					var s = this.snap,
						o = this.opts,
						t = this,
						data = o.data;
		
					var i = 0,
						total = 0;
		
					if (index) {
						i = index;
						total = totalPct;
					} else {
						for (var j = 0; j < data.length; j++) {
							var d = data[j];
							if (d.arc && d.arc.draw) {
								d.arc.draw.remove();
							}
							if (d.legend && d.legend.circle && d.legend.circle.draw) {
								d.legend.circle.draw.remove();
							}
						}
		
						Snap.animate(0, 0.5, function(value) {
							Donut.prototype.circle.attr({
								opacity : value
							});
						}, 800);
					}
					if (data.length > i) {
						var d = data[i];
						this.startShowAnimationOneEntry(d, total, total + d.value, o.center, o.radius, function() {
							t.startShowAnimation(i + 1, total + d.value, callback);
						});
					} else {
						this.initInteractions();
						if (callback) {
							callback();
						}
					}
				};
		
				/***********************************************************
				 * Requesting framework
				 ***********************************************************/
				$.fn.donut = function(opts) {
					var donuts = [];
		
					this.each(function() {
						donuts.push(new Donut(this, opts));
					});
		
					if (donuts.length == 1) {
						return donuts[0];
					}
		
					return donuts;
				};
			})(jQuery, document, window, Snap);
		
			/***********************************************************
			 * Start framework
			 ***********************************************************/
		
		
			function getRandomColor() {
				var letters = '0123456789ABCDEF';
				var color = '#';
				for (var i = 0; i < 6; i++) {
					color += letters[Math.floor(Math.random() * 16)];
				}
				return color;
			}
		
		
		
			function setRandomColor() {
				$("#colorpad").css("background-color", getRandomColor());
			}
		
		
			var demoi = [];
			var scorelist=${scorelist};
			var len = scorelist.length;
			for (var i = 0; i < len; i = i + 2) {
				var name = scorelist[i];
				var marks = scorelist[i + 1];
				var markse = parseFloat(marks);
				demoi.push({
					value : markse,
					label : name,
					color : getRandomColor()
				});
			}
			
			var f = [];
			for (var z = 0; z < demoi.length; z++) {
				f.push(demoi[z]);
			}
			var donutSize = 300;
			var donut = $('#svg').donut({
				donutSize : donutSize,
				center : {
					x : donutSize / 2,
					y : donutSize / 2
				},
				radius : donutSize * 0.3 / 1,
				data : f
			});
			donut.startShowAnimation(function() {
				$('button').attr('disabled', false);
			});
			donut.startShowAnimation(function() {
				$('button').attr('disabled', false);
			});
		</script>
		
		<script
			src='https://cdnjs.cloudflare.com/ajax/libs/velocity/1.2.2/velocity.min.js'></script>
		<script
			src='https://cdnjs.cloudflare.com/ajax/libs/velocity/1.2.2/velocity.ui.min.js'></script>
			<script src="${js}/lib/data-table/datatables.min.js"></script>
    <script src="${js}/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="${js}/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="${js}/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="${js}/lib/data-table/jszip.min.js"></script>
    <script src="${js}/lib/data-table/pdfmake.min.js"></script>
    <script src="${js}/lib/data-table/vfs_fonts.js"></script>
    <script src="${js}/lib/data-table/buttons.html5.min.js"></script>
    <script src="${js}/lib/data-table/buttons.print.min.js"></script>
    <script src="${js}/lib/data-table/buttons.colVis.min.js"></script>
    <script src="${js}/lib/data-table/datatables-init.js"></script>


    <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
        } );