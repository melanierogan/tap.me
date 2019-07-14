// $(document).on("ready", function() {
//   L.mapbox.accessToken = 'pk.eyJ1Ijoicm9nYW5tYyIsImEiOiJjanh6MXAzbmIwNGl2M2xwamJ6Mnh4ZGlyIn0.ci0Fq8hiU-MtsoGWVKt4Qg';
//   var map = L.mapbox.map('map', 'mapbox://styles/roganmc/cjxyz43go0h081cpccmtt9bmd', { zoomControl: false })
//   .setView([39.739, -104.990], 12);

//   map.featureLayer.on("ready", function(e) {
//     getEvents(map);
//   });
// });

// function getEvents(map) {
//   var $loading_wheel = $("#spinning-wheel")
//   $loading_wheel.show();
//   $.ajax({
//     dataType: 'text',
//     url: '/events.json',
//     success:function(events) {
//       $loading_wheel.hide();
//       var geojson = $.parseJSON(events);
//       map.featureLayer.setGeoJSON({
//         type: "FeatureCollection",
//         features: geojson
//       });
//       addEventPopups(map);
//     },
//     error:function() {
//       $loading_wheel.hide();
//       alert("Could not load the events");
//     }
//   });
// }

// function addEventPopups(map) {
//   map.featureLayer.on("layeradd", function(e){
//     var marker = e.layer;
//     var properties = marker.feature.properties;
//     var popupContent = '<div class="marker-popup">' + '<h3>' + properties.title + '</h3>' +
//                        '<h4>' + properties.address + '</h4>' + '</div>';
//     marker.bindPopup(popupContent, {closeButton: false, minWidth: 300});
//   });
// }
// // const data = require('map.js')

// mapboxgl.accessToken = 'pk.eyJ1Ijoicm9nYW5tYyIsImEiOiJjanh6MXAzbmIwNGl2M2xwamJ6Mnh4ZGlyIn0.ci0Fq8hiU-MtsoGWVKt4Qg';
 
// var map = new mapboxgl.Map({
// container: 'map',
// style: 'mapbox://styles/roganmc/cjxyz43go0h081cpccmtt9bmd',
// center: [-0.0944, 51.5367],
// zoom: 12.15
// });
 
// map.on('load', function () {
 
// map.addImage('pulsing-dot', pulsingDot, { pixelRatio: 2 });
 
// map.addLayer({
// "id": "points",
// "type": "symbol",
// "source": {
// "type": "geojson",
// "data": {
// "type": "FeatureCollection",
// "features": [{
// "type": "Feature",
// "geometry": {
// "type": "Point",
// "coordinates": [-0.0944, 51.5367]
// }
// }]
// }
// },
// "layout": {
// "icon-image": "pulsing-dot"
// }
// });
 
// // When a click event occurs on a feature in the places layer, open a popup at the
// // location of the feature, with description HTML from its properties.

// });
//script close 
