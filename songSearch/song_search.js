document.observe("dom:loaded", function() {
    $("b_xml").observe("click", function(){
    	//construct a Prototype Ajax.request object
    	var top = $("top");
    	new Ajax.Request("songs_xml.php",{
    		method : "GET",
    		parameters : {top: top.value},
    		onSuccess : showSongs_XML,
    		onFailure : ajaxFailed,
    		onException : ajaxFailed
    	});
    });
    $("b_json").observe("click", function(){
        //construct a Prototype Ajax.request object
    	var top = $("top");
    	new Ajax.Request("songs_json.php",{
    		method : "GET",
    		parameters : {top: top.value},
    		onSuccess : showSongs_JSON,
    		onFailure : ajaxFailed,
    		onException : ajaxFailed
    	});
    });
});

function showSongs_XML(ajax) {
	alert(ajax.responseText);
	var insert = $("songs");
	var num = insert.childNodes.length;
	for (var i = 0 ; i < num ; i++){
		insert.removeChild(insert.firstChild);
	}

	var song = ajax.responseXML.getElementsByTagName("song");
	for (var i = 0; i < song.length; i++){
		var rank = song[i].getAttribute("rank");
		if(rank <= song.length){
			var title = song[i].getElementsByTagName("title")[0].firstChild.nodeValue;
			var artist = song[i].getElementsByTagName("artist")[0].firstChild.nodeValue;
			var genre = song[i].getElementsByTagName("genre")[0].firstChild.nodeValue;
			var time = song[i].getElementsByTagName("time")[0].firstChild.nodeValue;

			var li = document.createElement("li");
			li.innerHTML = title + " - " + artist + " [" + genre + "] (" + time + ")";
			insert.appendChild(li);
		}
	}
}

function showSongs_JSON(ajax) {
	alert(ajax.responseText);
	var num = $("songs").childNodes.length;
	for (var i = 0 ; i < num ; i++){
		$("songs").removeChild($("songs").firstChild);
	}
	

	var data = JSON.parse(ajax.responseText);
	for (var i = 0; i < data.songs.length; i++){
		var li = document.createElement("li");
		li.innerHTML = data.songs[i].title + " - " + data.songs[i].artist + " [" + data.songs[i].genre + "] (" + data.songs[i].time + ")";
		$("songs").appendChild(li);
	}
	
}

function ajaxFailed(ajax, exception) {
	var errorMessage = "Error making Ajax request:\n\n";
	if (exception) {
		errorMessage += "Exception: " + exception.message;
	} else {
		errorMessage += "Server status:\n" + ajax.status + " " + ajax.statusText + 
		                "\n\nServer response text:\n" + ajax.responseText;
	}
	alert(errorMessage);
}
