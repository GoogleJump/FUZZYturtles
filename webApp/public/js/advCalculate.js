function showOtherTip() {
	document.getElementById("otherTip").value = '';

	$('#otherTipDiv').show();
	var tip = 0;
	var x = document.getElementsByName("amtbox");
	var len = x.length;
	for (var i =1; i < len+1; i++){
		$('#newText' + i).text(function(){
			var total = document.getElementById("amtbox"+i).value;
			if (total == "") { 
				total = 0; 
			}
			else {
				total = eval(document.getElementById("amtbox"+i).value);
			}
            var tax = document.getElementById("tax").value;
			total = total*tax/100 + total*(1+tip);
			var perGuest = Math.round(total*100)/100;
			return '$' + perGuest;
		});
	}
}

function clickedOther(clicked_id) {
	var tip = document.getElementById("otherTip").value;
	tip = tip/100;
	var x = document.getElementsByName("amtbox"),
        len = x.length;

	for (var i =1; i < len+1; i++) {
		$('#newText' + i).text(function(){
			var total = document.getElementById("amtbox"+i).value;
			if (total == "") { 
				total = 0; 
			}
			else {
				total = eval(document.getElementById("amtbox"+i).value);
			}
			var	tax = document.getElementById("tax").value;
			total = total*tax/100 + total*(1+tip);
			var perGuest = Math.round(total*100)/100;
			return ('$' + perGuest);
		});
	}
}

function updateAmountTax() {
	//$('#otherTipDiv').hide();
	//$('#otherTip').innerHTML = "";
	var radios = $("input[type='radio']");
	var checkRadios = radios.filter(":checked"); //Have to check for other case!!!!
	var otherTip = document.getElementById("otherTip").value;

	var tip = 0;
	if (checkRadios.length > 0){
		tip = checkRadios[0].id;
		if (tip === "other") {
			tip = otherTip;
		}
	}

	return updateTip(tip);
}
function hideOtherTip() {
	$('#otherTipDiv').hide();
}

function updateTip(clicked_id) {
	var tip = parseFloat(clicked_id)/100; //this.id will pass in 10 or 20, convert to percent
	var x = document.getElementsByName("amtbox");
	var len = x.length;
	for (var i =1; i < len+1; i++){
		$('#newText' + i).text(function(){
			var total = document.getElementById("amtbox"+i).value;
			if (total == "") { 
				total = 0; 
			}
			else {
				total = eval(document.getElementById("amtbox"+i).value);
			}
            var tax = document.getElementById("tax").value;
			total = total*tax/100 + total*(1+tip);
			var perGuest = Math.round(total*100)/100;
			return '$' + perGuest;
		});
	}
}

function updateNameBox(currId) {
	var name = document.getElementById(currId).value;
	var counter = currId.replace('textbox','');
	$('#guestName'+counter).html('Amount for ' + name + ': ' + '<span name="newText" id="newText' + counter + '"></span>' );
}
