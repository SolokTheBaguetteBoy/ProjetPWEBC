var lastLatiClicked = 0;
var lastLongiClicked = 0;

window.onload = function () {
var map = L.map('map').setView([14,-14.8883335],4);
	L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {attribution: 'PING'}).addTo(map);
	
	map.on('click', onClick);
	
	function onClick(e) {
		//recherche le pays sur lequel on a clické
		//Requete AJAX pour récupérer les infos du pays sur le point où on a cliqué (lati, longi) 
		var lati = 0;
		var longi = 0;
		$.ajax({
		    type: 'GET',
		    url: "http://nominatim.openstreetmap.org/reverse",
		    dataType: 'jsonp',
		    jsonpCallback: 'data',
		    data: { format: "json", limit: 1,lat: e.latlng.lat,lon: e.latlng.lng,json_callback: 'data' },
		    error: function(xhr, status, error) {
			alert("ERROR "+error);
		    },
		    success: function(data){
			//récupérer les coordonnées (lati, longi) du pays dans les données json provenant du serveur
			var paysVisite="";
			$.each(data, function() {
				paysVisite = this['country'] ;
			});
			
			//affichage des infos
			L.marker(e.latlng).addTo(map).bindPopup("Lat, Lon : " + e.latlng.lat + ", " + e.latlng.lng+" Pays : "+paysVisite).openPopup();
			L.circle(e.latlng, 1).addTo(map);	
			lati = e.latlng.lat;
			longi = e.latlng.lng;
			lastLatiClicked = e.latlng.lat;
			lastLongiClicked = e.latlng.lng;
			console.log("1 request lat : " + e.latlng.lat);
			console.log("1 request lng : " + e.latlng.lng);
			secondRequest();
		    }
			
			
		});
		/*$.ajax({
				url:"index.php?controle=utilisateur&action=treasureChecker",
				type:'GET',
				data: { format: "json", limit: 1,lat: lati,lon: longi,json_callback: 'data' },
				dataType: 'jsonp',
				success: function(data){
					console.log("testSuccess");
					var txt = data;
					alert("aaa");
				},
					error: function(xhr, error){
					console.log(lati);
					console.log(longi);
					console.log(lastLatiClicked);
					console.debug(xhr); console.debug(error);
				}
				
			});*/
			
	}
}

function secondRequest() {
	$.ajax({
				url:"index.php?controle=utilisateur&action=treasureChecker",
				type:'GET',
				dataType: 'text',
				jsonpCallback: 'text',
				data: { format: "json", latitude: lastLatiClicked, longitude: lastLongiClicked, limit: 1, json_callback: 'data' },
				
				success: function(data){
					console.log("testSuccess");
					var txt = data;
					alert(txt);

				},
					error: function(xhr, error){
					//console.log(lati);
					//console.log(longi);
					console.log("2 request lng " + lastLongiClicked);
					console.log("2 request lat " + lastLatiClicked);
					console.debug(xhr); console.debug(error);
				}
				
			});
}

