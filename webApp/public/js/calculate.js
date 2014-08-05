function calculateTip()
{

}

function check() {
if(document.getElementById("total").value != "")
{
    document.getElementsByName("tip")[0].disabled = false;
	document.getElementsByName("tip")[1].disabled = false;
	document.getElementsByName("tip")[2].disabled = false;
	document.getElementsByName("tip")[3].disabled = false;
}
else
    document.getElementsByName('tip').disabled = true;
}

function reply_click(clicked_id)
{
	var tip = parseFloat(clicked_id)/100; //this.id will pass in 10 or 20, convert to percent
	var total = eval(document.getElementById("total").value);
	var withtip = total * (1+tip);
	var numGuests = document.getElementById("numGuests").value;
	var perGuest = Math.round(withtip/numGuests * 100)/100;
	//alert(perGuest);
	//var formInput = perGuest;
	document.getElementById('newText').innerHTML = perGuest;
}

