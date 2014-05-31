function check() {
if(document.getElementById("amtbox1").value != "")
{
    document.getElementsByName("tip")[0].disabled = false;
	document.getElementsByName("tip")[1].disabled = false;
	document.getElementsByName("tip")[2].disabled = false;
	document.getElementsByName("tip")[3].disabled = false;
}
else
    document.getElementsByName('tip').disabled = true;
}

function checkOther(){
	$('#otherTip').show();
 	//document.getElementById("otherTip").show();
}

function replyOtherClick(clicked_id)
{
	$('#otherTip').hide();
	//var tip = parseFloat(clicked_id)/100; //this.id will pass in 10 or 20, convert to percent
	var x = document.getElementsByName("amtbox");
	var len = x.length;
	for (var i =1; i < len+1; i++){
		$('#newText' + i).text(function(){
			var total = document.getElementById("amtbox"+i).value;
			var tax = document.getElementById("tax").value;
			total = total*tax/100 + total*(1+tip);
			//var withtip = total * (1+tip); //tip on pre-tax amount
			var perGuest = Math.round(total*100)/100;
			return perGuest;
		});
	}
}

function reply_click(clicked_id)
{
	var tip = parseFloat(clicked_id)/100; //this.id will pass in 10 or 20, convert to percent
	var x = document.getElementsByName("amtbox");
	var len = x.length;
	for (var i =1; i < len+1; i++){
		$('#newText' + i).text(function(){
			var total = document.getElementById("amtbox"+i).value;
			var tax = document.getElementById("tax").value;
			total = total*tax/100 + total*(1+tip);
			//var withtip = total * (1+tip); //tip on pre-tax amount
			var perGuest = Math.round(total*100)/100;
			return perGuest;
		});
	}
}


	// $('div', $('div#TextBoxesGroup')).each(function() {
    	
 //    	console.log($(this).attr('textbox' + counter)); 
	// });

		//document.getElementById('newText1') = document.getElementById('amtbox1');
//	}
	/*var total = document.getElementById("total").value;
	var withtip = total * (1+tip);
	var numGuests = document.getElementById("numGuests").value;
	var perGuest = Math.round(withtip/numGuests * 100)/100;*/
	//alert(perGuest);
	//var formInput = perGuest;
	//document.getElementById('newText').innerHTML = perGuest;

/*$('div', $('div#TextBoxesGroup')).each(function() {
    console.log($(this).attr('textbox' + counter)); 
});*/