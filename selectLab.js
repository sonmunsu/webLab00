"use strict";

document.observe("dom:loaded", function() {
	/* Make necessary elements Dragabble / Droppables (Hint: use $$ function to get all images).
	 * All Droppables should call 'labSelect' function on 'onDrop' event. (Hint: set revert option appropriately!)
	 * 필요한 모든 element들을 Dragabble 혹은 Droppables로 만드시오 (힌트 $$ 함수를 사용하여 모든 image들을 찾으시오).
	 * 모든 Droppables는 'onDrop' 이벤트 발생시 'labSelect' function을 부르도록 작성 하시오. (힌트: revert옵션을 적절히 지정하시오!)
	 */
	var array = $$("#labs img");
	for(var i=0 ; i < array.length ; i++){
		new Draggable(array[i], {revert: true});
	}
	Droppables.add("selectpad", {onDrop: labSelect});
	Droppables.add("labs", {onDrop: labSelect});
});

function labSelect(drag, drop, event) {
	/* Complete this event-handler function 
	 * 이 event-handler function을 작성하시오.
	 */
	if(drop == $("selectpad")){
		var a = $("selection").childNodes;
		var flag = 0;
		for(var i=0 ; i< a.length ; i++){
			if(drag.alt == a[i].innerHTML){
				flag=1;
			}
		}
		if(flag==0 && a.length < 3){
			var li = document.createElement("li");
			li.innerHTML = drag.alt;
			$("selection").appendChild(li).pulsate({delay : 0.5, duration : 1.0});
			var array = $$("#labs img");
			for(var i=0 ; i < array.length ; i++){
				if(array[i].alt == drag.alt){
					$("labs").removeChild(drag);
					$("selectpad").appendChild(drag);
				}
			}
		}
	}
	else if(drop == $("labs")){
		var arr = $("selection").childNodes;
		for(var i=0 ; i < arr.length ; i++){
			if(arr[i].innerHTML == drag.alt){
				$("selection").removeChild(arr[i]);
				$("selectpad").removeChild(drag);
				$("labs").appendChild(drag);
			}
		}
	}	
}

