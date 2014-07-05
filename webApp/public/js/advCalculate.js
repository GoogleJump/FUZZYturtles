function check() {
    if (document.getElementById("amtbox1").value !== "") {
        document.getElementsByName("tip")[0].disabled = false;
        document.getElementsByName("tip")[1].disabled = false;
        document.getElementsByName("tip")[2].disabled = false;
        document.getElementsByName("tip")[3].disabled = false;
    }
    else {
        document.getElementsByName('tip').disabled = true;
    }
}

function checkOther() {
	$('#otherTip').show();
}

function replyOtherClick(clicked_id) {
	var tip = document.getElementById("otherTip").value;
	tip = tip/100;
	var x = document.getElementsByName("amtbox"),
        len = x.length;
	for (var i =1; i < len+1; i++) {
		$('#newText' + i).text(function(){
			var total = document.getElementById("amtbox"+i).value;
			var tax = document.getElementById("tax").value;
			total = total*tax/100 + total*(1+tip);
			var perGuest = Math.round(total*100)/100;
			return perGuest;
		});
	}
}

function reply_click(clicked_id) {
	$('#otherTip').hide();
	var tip = parseFloat(clicked_id)/100; //this.id will pass in 10 or 20, convert to percent
	var x = document.getElementsByName("amtbox");
	var len = x.length;
	for (var i =1; i < len+1; i++){
		$('#newText' + i).text(function(){
			var total = document.getElementById("amtbox"+i).value,
                tax = document.getElementById("tax").value;
			total = total*tax/100 + total*(1+tip);
			var perGuest = Math.round(total*100)/100;
			return perGuest;
		});
	}
}

    
function updateNameBox() {
    debugger
}