$( document ).ready(function() {

var bands = ["Modest Mouse", "Johnny Cash", "Nicolas Jaar", "Gorillaz", "A Tribe Called Quest"]

$('#random_band').on('click', function(event) {
	event.preventDefault();
	 $('#band').text(bands[Math.floor(Math.random()*bands.length)])
	})
});