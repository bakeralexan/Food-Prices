let jsonURL = "Resources/states.json";

const street= L.tileLayer('https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery (c) <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    accessToken: "pk.eyJ1IjoiYmFrZXJhIiwiYSI6ImNremo1OWtzcDBzeTkybnBhcnhza2hkaGYifQ.r-F1kuH2yLspiIWW14xvLw"
});
const dark = L.tileLayer('https://api.mapbox.com/styles/v1/mapbox/dark-v10/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery (c) <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    accessToken: "pk.eyJ1IjoiYmFrZXJhIiwiYSI6ImNremo1OWtzcDBzeTkybnBhcnhza2hkaGYifQ.r-F1kuH2yLspiIWW14xvLw"
});
const myMap = L.map("map", {
    center: [35.0902, -105.7129],
    zoom: 4,
    layers: [street]
});

let diabetesLayer = L.layerGroup([]);
let obesityLayer = L.layerGroup([]);
let foodLayer = L.layerGroup([]);


  d3.json(jsonURL).then(function (data) {   

    diabetesLayer = L.choropleth(data, {
      valueProperty: "diabetes",    
      scale: ["#f5f5f5", "#255fd8"],
      steps: 5,
      mode: "q",
      style: {
        // Border color
        color: "#fff",
        weight: 1,
        fillOpacity: 0.8
      },
      onEachFeature: function(feature, layer) {
        layer.bindPopup("<h3>" + feature.properties.name + "</h3><hr><h5>Population Density:<br>" + feature.properties.density + "</h5><br><h5>Diabetes:<br>" + feature.properties.diabetes+ "</h5>");
      }

    });
    obesityLayer = L.choropleth(data, {
      valueProperty: "obesity",    
      scale: ["#ff8b60", "#6bc8a3"],
      steps: 5,
      mode: "q",
      style: {
        // Border color
        color: "#fff",
        weight: 1,
        fillOpacity: 0.8
      },
      onEachFeature: function(feature, layer) {
        layer.bindPopup("<h3>" + feature.properties.name + "</h3><hr><h5>Population Density:<br>" + feature.properties.density + "</h5><br><h5>Obesity:<br>" + feature.properties.obesity+ "</h5>");
      }

    });
    foodLayer = L.choropleth(data, {
      valueProperty: "food",    
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
        layer.bindPopup("<h3>" + feature.properties.name + "</h3><hr><h5>Population Density:<br>" + feature.properties.density + "</h5><br><h5>Food and Beverages in Millions of Dollars:<br> $" + feature.properties.food+ "</h5>");
      }

    });

    const baseMaps = {
      Street: street,
      Dark: dark
    };
    const overlayMaps = {
      "Diabetes": diabetesLayer,
      "Obesity": obesityLayer,
      "Food & Beverages in Millions of Dollars": foodLayer
    };

    L.control.layers(baseMaps, overlayMaps, {
      collapsed: false
    }).addTo(myMap);
  });
