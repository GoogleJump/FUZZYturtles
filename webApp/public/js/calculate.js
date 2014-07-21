function enableTipBox() {
    if(document.getElementById("total").value !== "" && document.getElementById("numGuests").value !== "") {
        document.getElementsByName("tip")[0].disabled = false;
        document.getElementsByName("tip")[1].disabled = false;
        document.getElementsByName("tip")[2].disabled = false;
        document.getElementsByName("tip")[3].disabled = false;
    }
    else {
        document.getElementsByName('tip').disabled = true;
    }
}

function enteredTip(clicked_id) {
    var tip = parseFloat(clicked_id)/100, //this.id will pass in 10 or 20, convert to percent
        total = document.getElementById("total").value,
        withtip = total * (1 + tip),
        numGuests = document.getElementById("numGuests").value,
        perGuest = Math.round(withtip/numGuests * 100)/100;
    document.getElementById('newText').innerHTML = '$' + perGuest;
}