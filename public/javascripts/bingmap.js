var _map;
var _pathname;
var _lyr_nearby;
var _lyr_dist_between;
var _pin_selected;
$(document).ready(function(){
	var maxZoom = 17;
	_map = new VEMap('map_canvas');
	var mapOptions = new VEMapOptions();
	mapOptions.BirdseyeOrientation = VEOrientation.West;
	var building = new VEShapeLayer();
	_pathname = $("#pathname").text();
	_map.onLoadMap = mapLoaded;
	_map.LoadMap(new VELatLong($("#start_lat").text(),$("#start_lon").text()), 16, VEMapStyle.Aerial, false, VEMapMode.Mode2D, true, 1, mapOptions);
	if ($("#load_markers").text() == "true") {
		var buildingSpecs = new VEShapeSourceSpecification(VEDataType.GeoRSS, "/" + _pathname + ".xml", building);
		_map.ImportShapeLayerData(buildingSpecs, onBuildingLoad, false);
	}
	//_map.ClearInfoBoxStyles();
	//var routeOptions = new VERouteOptions();
	//routeOptions.RouteMode = VERouteMode.Walking;
	
	_map.AttachEvent('onendzoom', function(e){
		if(e!=null)
		{
			if(e.zoomLevel>17)
			{
				_map.SetZoomLevel(17);
				return true;
			}
		}
	});
	
	$("#map_canvas :first-child").css('cursor','crosshair');

	$("#map_canvas").click(function(e){
		var x = e.pageX - this.offsetLeft;
		var y = e.pageY - this.offsetTop;
		var ll = _map.PixelToLatLong(new VEPixel(x,y));
		//$("#messages").show().html("The latitude,longitude of the pixel at ("+x+","+y+") is: "+ll);
		$("#"+_pathname+"_latitude").val(ll.Latitude+"");
		$("#"+_pathname+"_longitude").val(ll.Longitude+"");
    });
	
	//
	// Nearby locations/businesses
	//
	$(".nearby li").click(function(e){
		FindNearby($(this).text());
	});

});
function mapLoaded()
{
	
}
function onBuildingLoad(layer)
{
	var numShapes = layer.GetShapeCount();
    for(var i=0; i < numShapes; i++)
    {
        var s = layer.GetShapeByIndex(i);
        s.SetCustomIcon(s.IconId);
    }
	$(".VEAPI_Pushpin").click(function(e){
		var x = e.pageX - $("#map_canvas")[0].offsetLeft;
		var y = e.pageY - $("#map_canvas")[0].offsetTop;
		var ll = _map.PixelToLatLong(new VEPixel(x,y));
		if ($(this).hasClass("selectedPushpin"))
		{
			_pin_selected = null;
			$(this).removeClass("selectedPushpin");
		}
		else if (_pin_selected != null)
		{
			try
			{	
				_lyr_dist_between = new VEShapeLayer();
				
				var points = new Array(_pin_selected, ll);
				var line = new VEShape(VEShapeType.Polyline, points);
				//line.SetLineWidth(3);
				//line.SetLineColor(new VEColor(0,150,100,1.0));
				
				_lyr_dist_between.AddShape(line);
				_map.AddShapeLayer(_lyr_dist_between);
			}
			catch(e){ alert(e.message + typeof(points[0])) }
		}
		else
		{
			$(this).addClass("selectedPushpin");
			_pin_selected = ll;
		}								   
	});
}
function FindNearby(val)
{
	try
	{
		if (_lyr_nearby != null)
			_map.DeleteShapeLayer(_lyr_nearby);
		_lyr_nearby = new VEShapeLayer();
		_map.AddShapeLayer(_lyr_nearby);
		if (val)
		{
			if (val != "clear")
				_map.Find(val, null, VEFindType.Businesses, _lyr_nearby);
		}
		else
			_map.Find($("#txtWhat").val(), null, VEFindType.Businesses, _lyr_nearby);
	}
	catch(e)
	{
		alert(e.message);
	}
}
		  
function GetDirections()
{
	_map.GetRoute(startpt, endpt, VEDistanceUnit.Miles, VERouteType.Quickest, OnGotRoute);
	RemovePopupMenu();
}