let url = "https://leafletjs.com/examples/choropleth/us-states.js";
let geoUrl = "https://eric.clst.org/assets/wiki/uploads/Stuff/gz_2010_us_040_00_500k.json";
let jsonURL = "Resources/states.json";

const street= L.tileLayer('https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery (c) <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    accessToken: API_KEY
});
const satellite = L.tileLayer('https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v11/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery (c) <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    accessToken: API_KEY
});
const myMap = L.map("map", {
    center: [35.0902, -105.7129],
    zoom: 4,
    layers: [street, earthquakeMarkers]
});
let geojson;
d3.json(jsonURL).then(function (data) {
    geojson = L.choropleth(data, {
        scale: ["#ffffb2", "#b10026"],
        steps: 10,
        mode: "q",
        style: {
          // Border color
          color: "#fff",
          weight: 1,
          fillOpacity: 0.8
        },
        onEachFeature: function(feature, layer) {
            layer.bindPopup("Zip Code: " + feature.properties.ZIP + "<br>Median Household Income:<br>" +
              "$" + feature.properties.MHI2016);
          }
        }).addTo(myMap);
        var legend = L.control({ position: "bottomright" });
        legend.onAdd = function() {
          let div = L.DomUtil.create("div", "info legend");
          let limits = geojson.options.limits;
          let colors = geojson.options.colors;
          let labels = [];
      
          // Add the minimum and maximum.
          let legendInfo = "<h1>Median Income</h1>" +
            "<div class=\"labels\">" +
              "<div class=\"min\">" + limits[0] + "</div>" +
              "<div class=\"max\">" + limits[limits.length - 1] + "</div>" +
            "</div>";
      
          div.innerHTML = legendInfo;
      
          limits.forEach(function(limit, index) {
            labels.push("<li style=\"background-color: " + colors[index] + "\"></li>");
          });
      
          div.innerHTML += "<ul>" + labels.join("") + "</ul>";
          return div;
    };
      
    // Adding the legend to the map
    legend.addTo(myMap);
    });