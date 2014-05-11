function calculateTip()
{
	var totaljs = document.getElementById("total").value;
	var withtip = totaljs * 1.15;
	var numGuests = document.getElementById("numGuests").value;
	alert(withtip/numGuests)
	//var parsedtotal = parseInt(total);
	//alert(total * 1.15)
}

function check() {
if(document.getElementById("total").value != "")
{
    document.getElementsByName("tip")[0].disabled = false;
	document.getElementsByName("tip")[1].disabled = false;
}
else
    document.getElementsByName('tip').disabled = true;
}

function reply_click(clicked_id)
{
	var tip = clicked_id;
}