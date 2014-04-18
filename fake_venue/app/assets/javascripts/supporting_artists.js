$( document ).ready(function() {
	var i = 0
	var acts = ["#artist_second", "#artist_third", "#artist_fourth"]
		addAct = function() {
			$(acts[i]).show()
			i+=1
			if (i > 2	) {
				$('#supporting').hide()
			}
		}
	$('#supporting').on("click", addAct)
	});