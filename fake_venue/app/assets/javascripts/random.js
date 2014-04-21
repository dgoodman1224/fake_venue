$( document ).ready(function() {

var bands = ["Modest Mouse", "Johnny Cash", "Nicolas Jaar", "Gorillaz", "A Tribe Called Quest", 
"London Souls", "Brandt, Bauer, Frick", "Ghostland Observatory", "The Twelves", "Soul Rebels Brass Brand", "Holy Ghost!", "Cut Copy",
"PHJB", "Dale Earnhardt Jr. Jr.", "Kasper Bjork"]

$('#random_band').on('click', function(event) {
	event.preventDefault();
	$('#random_band button').text("More Sweet Tunes Please")
	 $('#random_band #band').text(bands[Math.floor(Math.random()*bands.length)])
	})
});