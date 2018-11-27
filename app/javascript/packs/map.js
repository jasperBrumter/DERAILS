import 'mapbox-gl/dist/mapbox-gl.css'
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');
const addressInput = document.getElementById('flat_address');

if (addressInput) {
  const places = require('places.js');
  const placesAutocomplete = places({
    container: addressInput
  });
}

let map;
let markerObjects =[];

if (mapElement) { // only build a map if there's a div#map to inject into
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/flourish-creative/cjoswie6c7ut62rmnxp0290oo'
  });
  reloadMarkers();

  map.addControl(new MapboxGeocoder({
    accessToken: mapboxgl.accessToken
  }));
}

function reloadMarkers() {
  const mapData = document.getElementById('mapdatacontainer');
  if (markerObjects) {
    markerObjects.forEach((marker) => {
      marker.remove();
    })
  }
  const markers = JSON.parse(mapData.dataset.markers);

  markers.forEach((marker) => {
    const markerObject = new mapboxgl.Marker();
      markerObject.setLngLat([marker.lng, marker.lat]).addTo(map);
      markerObjects.push(markerObject)
  })

  if (markers.length === 0) {
    map.setZoom(1);
  } else if (markers.length === 1) {
    map.setZoom(14);
    map.setCenter([markers[0].lng, markers[0].lat]);
  } else {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
    });
    map.fitBounds(bounds, { duration: 0, padding: 75 })
  }
}

window.reloadMarkers = reloadMarkers;
