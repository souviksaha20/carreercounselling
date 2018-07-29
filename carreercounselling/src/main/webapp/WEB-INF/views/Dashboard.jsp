<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
<style>
	#bt{
	background-color: #2196F3;
	}
	#bt:hover{background: #0b7dda;
	 box-shadow: 0 5px #fff;
  transform: translateY(4px);}
	
}
	</style>
	<style>
body {
  color: #333;
  background: transparent;
}

.frame {
  width: 40%;
  border-radius: 4px;
  background: #ededed;
  padding: 20px;
  margin: 150px auto;
}

body .frame .content h1 {
  margin: 0 0 10px 0;
  text-align: center;
  color: white;
  font-weight: 100;
  text-transform: uppercase;
}

#svg {
  width: 500px;
  height: 300px;
}

.content { text-align: center; }
</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
</head>
<%@ include file="nav2.jsp" %>
<body>
<script>
//Get the modal
var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('trigger');

img.onclick = function(){
    modal.style.display = "block";
    alert("hello");
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
    modal.style.display = "none";
}
</script>
<style>
#trigger:hover {opacity: 0.8;}

/* The Modal (background) */
.modals {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (Image) */
.modals-content {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
}

/* Caption of Modal Image (Image Text) - Same Width as the Image */
#caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    text-align: center;
    color: #ccc;
    padding: 10px 0;
    height: 150px;
}

/* Add Animation - Zoom in the Modal */
.modals-content, #caption { 
    animation-name: zoom;
    animation-duration: 0.6s;
}

@keyframes zoom {
    from {transform:scale(0)} 
    to {transform:scale(1)}
}

/* The Close Button */
.close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
}

.close:hover,
.close:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
    .modals-content {
        width: 100%;
    }
}
</style>
<div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-transparent  navbar-absolute fixed-top">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <a class="navbar-brand" href="#pablo"><h1>Profile</h1></a>
                    </div>
                    
                </div>
            </nav>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-header-primary " data-color="azure" >
                                    <h4 class="card-title" style="font-size:2em;">dashboard</h4>
                                    <p class="card-category" style="font-size:16px;">Fill in only required changes </p>
                                </div>

                                <div class="card-body">
                                
                                </div>
                                </div>
                                </div>
                                </div>
                                <div class="row">
                                <div class="col-md-4">
                            <div class="card card-chart">
                                <div class="card-header card-header-warning">
                                    
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Email Subscriptions</h4>
                                    <p class="card-category">Last Campaign Performance</p>
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-chart">
                                <div class="card-header card-header-warning">
                                    
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Email Subscriptions</h4>
                                    <p class="card-category">Last Campaign Performance</p>
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-chart">
                                <div class="card-header card-header-warning">
                                    
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Email Subscriptions</h4>
                                    <p class="card-category">Last Campaign Performance</p>
                                </div>
                                <div class="card-footer">
                                   
                                </div>
                            </div>
                        </div>
                                </div>
                                <div class="row">
                                
                        <div class="col-md-12">
                        <div class="card card-chart" id="trigger">
                                <div class="card-header card-header-success">
                                    <h3>Doughnut</h3>
                                </div>
                                <div class="card-body" >
                                
                                    <div class="card-block">
                    <svg id="svg"></svg>
                </div>
                                    
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>
                 <div id="myModal" class="modals">  
                 <span class="close">&times;</span>
                 <div class="modals-content" >
                 <h1>hello</h1>
                 
                 </div>
                 </div>                            </div>
                                <div class="row">
                                <div class="col-md-4">
                            <div class="card card-chart">
                                <div class="card-header card-header-warning">
                                    
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Email Subscriptions</h4>
                                    <p class="card-category">Last Campaign Performance</p>
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-chart">
                                <div class="card-header card-header-warning">
                                    
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Email Subscriptions</h4>
                                    <p class="card-category">Last Campaign Performance</p>
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-chart">
                                <div class="card-header card-header-warning">
                                    
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Email Subscriptions</h4>
                                    <p class="card-category">Last Campaign Performance</p>
                                </div>
                                <div class="card-footer">
                                    
                                </div>
                            </div>
                        </div>
                                </div>
                                </div>
                                </div>
                                </div>
</body>
<script type="text/javascript">
    $(document).ready(function() {

        //init wizard

        // demo.initMaterialWizard();

        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

        demo.initCharts();

    });
</script>
<link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light/all.min.css" />
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

<script type="text/javascript">
    jQuery(function ($) {
        var data1 = [12, 3, 4, 2, 12, 3];
        var data2 = [3, 9, 12, 14, 22, 32];
        var data3 = [23, 19, 11, 134, 242, 352];
            
        $("#chart1").shieldChart({
            exportOptions: {
                image: false,
                print: false
            },
            axisY: {
                title: {
                    text: "Break-Down for selected quarter"
                }
            },
            dataSeries: [{
                seriesType: "bar",
                data: data1
            }]
        });

        
    });
</script>
<script>
window.onload = function () {

var options = {
    animationEnabled: true,
    title: {
        text: "graph"
    },
    axisY: {
        title: "Growth of ________ (in %)",
        suffix: "%",
        includeZero: false
    },
    axisX: {
        title: "Constarins"
    },
    data: [{
        type: "column",
        yValueFormatString: "#,##0.0#"%"",
        dataPoints: [
            { label: "A", y: 10.09 },    
            { label: "B", y: 12.40 },   
            { label: "C", y: 13.50 },
            { label: "D", y: 5.96 }, 
            { label: "E", y: 9.80 },
            { label: "F", y: 8.56 },
            
        ]
    }]
};
$("#chartContainer").CanvasJSChart(options);

}
</script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script> 
<script src='http://cdnjs.cloudflare.com/ajax/libs/snap.svg/0.3.0/snap.svg-min.js'></script> 
<script>
var demo = [
    {
        value: 25,
        label: 'A',
        color: '#3399FF'
    },
    {
        value: 23,
        label: 'B',
        color: '#FFC575'
    },
    {
        value: 17,
        label: 'C',
        color: '#99CC00'
    },
    {
        value: 22,
        label: 'D',
        color: '#FF3300'
    },
    {
        value: 18,
        label: 'E',
        color: '#944DDB'
    },
    {
        value: 11,
        label: 'F',
        color: '#644DDB'
    },
];
</script> 

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script>
/***********************************************************
 * Create framework
 ***********************************************************/
(function ($, doc, win, Snap) {
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
    Donut.prototype.init = function () {
        this.drawLegend();
        this.drawBaseCircle();
    };

    /***********************************************************
     * Draw base circle
     ***********************************************************/
    Donut.prototype.drawBaseCircle = function () {
        var s = this.snap,
            o = this.opts;

        // create diagonal pattern
        var pattern = s.path("M10-5-10,15M15,0,0,15M0-5-20,15").attr({
            fill: "none",
            stroke: "none",
            strokeWidth: 0
        });

        // create masking circle
        var mask = s.circle(o.center.y, o.center.y, o.radius).attr({
            fill: pattern
        });

        // create circle
        Donut.prototype.circle = s.circle(o.center.y, o.center.y, o.radius).attr({
            fill: "r(0.5, 0.5, 0.5)#FFC575-#fff",
            mask: mask,
            stroke: '#D9D9D9',
            strokeWidth: 0,
            opacity: 0
        });

        // create border circle
        s.circle(o.center.y, o.center.y, o.radius).attr({
            stroke: '#D9D9D9',
            fill: 'none',
            strokeWidth: 0
        });
    };

    /***********************************************************
     * Draw legend
     ***********************************************************/
    Donut.prototype.drawLegend = function () {
        var s = this.snap,
            o = this.opts,
            data = o.data;

        var x = o.center.x + o.radius + 50,
            step = 30,
            radius = 6,
            y = o.center.y - (data.length / 2 * step) + radius / 2 + (step - radius) / 2;

        for (var i = 0; i < data.length; i++) {
            var d = data[i];

            d.legend = {
                baseCircle: s.circle(x, y, radius),
                baseCircleRadius: radius,
                text: s.text(x + step, y + radius / 2, d.label),
                center: {
                    x: x,
                    y: y,
                }
            }

            d.legend.baseCircle.attr({
                stroke: '0',
                fill: 'none',
                strokeWidth: 0,
              color:''
            });

            y += step;
        }
    };

    /***********************************************************
     * Build an arc svg path
     ***********************************************************/
    Donut.prototype.buildArcPath = function (center, radius, degreesStart, degreesEnd) {
        var start = this.translatedPoint(center, radius, degreesStart),
            end = this.translatedPoint(center, radius, degreesEnd),
            largeArc = (degreesEnd - degreesStart) > 180 ? 1 : 0;

        return "M" + start.x + "," + start.y + " A" + radius + "," + radius + " 0 " + largeArc + ",1 " + end.x + "," + end.y;
    };
      
    /***********************************************************
     * Animate an arc throw his degrees 
     ***********************************************************/
    Donut.prototype.animateArcByDegrees = function (arc, duration, callback) {
        var s = this.snap,
            t = this;

        Snap.animate(arc.degreesStart, arc.degreesEnd,
            function (degrees) {
                if (arc.draw) {
                    arc.draw.remove();
                }

                arc.path = t.buildArcPath(arc.center, arc.radius, arc.degreesStart, degrees);
                arc.draw = s.path(arc.path);

                arc.draw.attr({
                    stroke: arc.color,
                    fill: 'none',
                    strokeWidth: arc.strokeWidth,
                    cursor: 'pointer'
                });
            },
            duration,
            mina.linear,
            function () {
                if (callback) {
                    callback();
                }
            });
    };

    /***********************************************************
     * Animate an arc throw his stroke width 
     ***********************************************************/
    Donut.prototype.animateArcByStroke = function (arc, strokeWidthStart, strokeWidthEnd, duration, callback) {
        var s = this.snap,
            t = this;

        Snap.animate(strokeWidthStart, strokeWidthEnd,
            function (strokeWidth) {
                if (arc.draw) {
                    arc.draw.remove();
                }

                var radius = arc.radius + (strokeWidth - arc.strokeWidth) / 6;
                arc.path = t.buildArcPath(arc.center, radius, arc.degreesStart, arc.degreesEnd);
                arc.draw = s.path(arc.path);

                arc.draw.attr({
                    stroke: arc.color,
                    fill: 'none',
                    strokeWidth: strokeWidth,
                    cursor: 'pointer'
                });
            },
            duration,
            mina.bounce,
            function () {
                if (callback) {
                    callback();
                }
            });
    };

    /***********************************************************
     * Create the legend circle
     ***********************************************************/
    Donut.prototype.createLegendCircle = function (c) {
        c.draw = this.snap.circle(c.x, c.y, c.radius);
        c.draw.attr({
          fill: c.color
        });
    };

    /***********************************************************
     * Start show animation of legend circle
     ***********************************************************/
    Donut.prototype.animateShowLegendCircle = function (c, duration) {
        c.draw.transform('s0,'+c.x+','+c.y)
        c.draw.animate({ transform: 's1,'+c.x+','+c.y }, duration, mina.bounce);
    };

    /***********************************************************
     * Start show animation of donut and legend for one data entry
     ***********************************************************/
    Donut.prototype.startShowAnimationOneEntry = function (d, percentStart, percentEnd, center, radius, callback) {
        d.arc = {
          percentStart : percentStart,
          percentEnd : percentEnd,
          degreesStart : parseFloat(percentStart) / 100 * 360,
          degreesEnd : parseFloat(percentEnd) / 100 * 360,
          color : d.color,
          strokeWidth : 40,
          center: center, 
          radius: radius,
        }
      
        this.animateArcByDegrees(d.arc, 900, callback);
      
        d.legend.circle = {
          color : d.color,
          x : d.legend.center.x,
          y : d.legend.center.y,
          radius: d.legend.baseCircleRadius + 2
        }
        
        this.createLegendCircle(d.legend.circle);
        this.animateShowLegendCircle(d.legend.circle, 400);
    };

    /***********************************************************
     * Translate a point by some degrees via a center and a radius
     ***********************************************************/
    Donut.prototype.translatedPoint = function (center, radius, degrees) {
        var radians = Math.PI * (degrees - 270) / 180;
        return {
            x: center.x + radius * Math.cos(radians),
            y: center.y + radius * Math.sin(radians),
        }
    };

    /***********************************************************
     * Highlight entry element legend circle and arc
     ***********************************************************/
    Donut.prototype.hightlightElement = function (d) {
        var s = this.snap,
            o = this.opts,
            data = o.data;
      
        if(this.previousHighlightElement == d){
          return;
        }
      
        if(this.previousHighlightElement){
          this.normalElement(this.previousHighlightElement);
        }
        this.previousHighlightElement = d;
      
        var c = d.legend.circle;
        c.draw.animate({ transform: 's1.3,'+c.x+','+c.y }, 200, mina.bounce);
      
        this.animateArcByStroke(d.arc, d.arc.strokeWidth, d.arc.strokeWidth + 20, 500);
    };

    /***********************************************************
     * Normal entry element legend circle and arc
     ***********************************************************/
    Donut.prototype.normalElement = function (d) {
        var s = this.snap,
            o = this.opts,
            t = this,
            data = o.data;
      
        var c = d.legend.circle;
        c.draw.animate({ transform: 's1,'+c.x+','+c.y }, 500, mina.bounce);
      
        this.animateArcByStroke(d.arc, d.arc.strokeWidth + 6, d.arc.strokeWidth, 500, function(){
          d.arc.draw.mouseover(function () {
            t.hightlightElement(d);
          });
          d.arc.draw.click(function () {
            t.hightlightElement(d);
          });
        });
    };

    /***********************************************************
     * Init animation interaction
     ***********************************************************/
    Donut.prototype.initInteraction = function (d, step) {
        var s = this.snap,
            t = this,
            l = d.legend,
            a = d.arc;
          
        l.button = s.rect(l.center.x - 2 * l.baseCircleRadius, l.center.y - step / 2, 200, step);

        l.button.attr({
          opacity: 0,
          cursor: 'pointer',
          color:'red'
        });

        l.button.mouseover(function () {
          t.hightlightElement(d);
          
          
        });
        l.button.click(function () {
          t.hightlightElement(d);
          
        });
      
        a.draw.mouseover(function () {
          t.hightlightElement(d);
            
          
        });
        a.draw.click(function () {
          t.hightlightElement(d);
        });
    };

    /***********************************************************
     * Init animation interactions after showing animation
     ***********************************************************/
    Donut.prototype.initInteractions = function () {
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
    Donut.prototype.startShowAnimation = function (index, totalPct, callback) {
        if(index && !totalPct){
          callback = index;
          index = totalPct;
        }
      
        var s = this.snap,
            o = this.opts,
            t = this,
            data = o.data;
      
        var i = 0,
            total = 0;
      
        if(index){
          i = index;
          total = totalPct;
        }else{
          for(var j = 0 ; j < data.length ; j++){
            var d = data[j];
            if(d.arc && d.arc.draw){
              d.arc.draw.remove();
            }
            if(d.legend && d.legend.circle && d.legend.circle.draw){
              d.legend.circle.draw.remove();
            }
          }
          
          Snap.animate(0, 0.5, function (value) {
              Donut.prototype.circle.attr({
                opacity: value
              });
          }, 800);
        }
      
        if(data.length > i){
          var d = data[i];
          this.startShowAnimationOneEntry(d, total, total + d.value, o.center, o.radius, function(){
            t.startShowAnimation(i+1, total + d.value, callback);
          });
        }else{
          this.initInteractions();
          if(callback){
            callback();
          }
        }
    };

    /***********************************************************
     * Requesting framework
     ***********************************************************/
    $.fn.donut = function (opts) {
        var donuts = [];
      
        this.each(function () {
            donuts.push(new Donut(this, opts));
        });
      
        if(donuts.length == 1){
          return donuts[0];
        }
      
        return donuts;
    };
})(jQuery, document, window, Snap);

/***********************************************************
 * Start framework
 ***********************************************************/
var donutSize = 300;
var donut = $('#svg').donut({
    donutSize: donutSize,
    center: {
        x: donutSize / 2,
        y: donutSize / 2
    },
    radius: donutSize * 0.3 / 1,
    data: demo
});

donut.startShowAnimation(function(){
  $('button').attr('disabled', false);
});
</script>
</html>