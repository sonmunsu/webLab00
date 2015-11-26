<?php
$SONGS_FILE = "songs.txt";
//$SONGS_FILE = "songs_shuffled.txt";

if (!isset($_SERVER["REQUEST_METHOD"]) || $_SERVER["REQUEST_METHOD"] != "GET") {
	header("HTTP/1.1 400 Invalid Request");
	die("ERROR 400: Invalid request - This service accepts only GET requests.");
}

$top = "";

if (isset($_REQUEST["top"])) {
	$top = preg_replace("/[^0-9]*/", "", $_REQUEST["top"]);
}

if (!file_exists($SONGS_FILE)) {
	header("HTTP/1.1 500 Server Error");
	die("ERROR 500: Server error - Unable to read input file: $SONGS_FILE");
}

header("Content-type: application/json");

print "{\n  \"songs\": [\n";

// write a code to : 
// 1. read the "songs.txt" (or "songs_shuffled.txt" for extra mark!)
// 2. search all the songs that are under the given top rank 
// 3. generate the result in JSON data format 
$lines = file($SONGS_FILE);

$ar = array();
for($i=0;$i < count($lines); $i++){
	$br =explode("|",trim($lines[$i]));
	$ar[$br[2]-1]=$br;
}
for($i=0;$i < $top; $i++){
	$tmp = $ar[$i];
	if ($tmp[2] < $top) {
		print "{\"rank\":\"$tmp[2]\",";
		print "\"title\":\"$tmp[0]\",";
		print "\"artist\":\"$tmp[1]\",";
		print "\"genre\":\"$tmp[3]\",";
		print "\"time\":\"$tmp[4]\"}";
		print ", \n";
	} elseif($tmp[2] == $top) {
		print "{\"rank\":\"$tmp[2]\",";
		print "\"title\":\"$tmp[0]\",";
		print "\"artist\":\"$tmp[1]\",";
		print "\"genre\":\"$tmp[3]\",";
		print "\"time\":\"$tmp[4]\"}\n";
	}
}
// for ($i = 0; $i < count($lines); $i++) {
// 	list($title, $artist, $rank, $genre, $time) = explode("|", trim($lines[$i]));
// 	if ($rank < $top) {
// 		print "{\"rank\":\"$rank\",";
// 		print "\"title\":\"$title\",";
// 		print "\"artist\":\"$artist\",";
// 		print "\"genre\":\"$genre\",";
// 		print "\"time\":\"$time\"}";
// 		print ", \n";
// 	} elseif ($rank == $top) {
// 		print "{\"rank\":\"$rank\",";
// 		print "\"title\":\"$title\",";
// 		print "\"artist\":\"$artist\",";
// 		print "\"genre\":\"$genre\",";
// 		print "\"time\":\"$time\"}\n";
// 	}
	
//}
print "  ]\n}\n";

?>
