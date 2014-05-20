$(document).ready(function() {
  var counter = 2;

  $("#addButton").click(function() {
    var newTextBoxDiv = $(document.createElement('div')).attr("id", 'TextBoxDiv' + counter);
  	newTextBoxDiv.after().html('<label>Guest #'+ counter + ' : </label>' +
  	      '<input type="text" name="textbox' + counter + 
  	      '" id="textbox' + counter + '" value="" >');
  	newTextBoxDiv.appendTo("#TextBoxesGroup");
  	counter++;
  });
 
  $("#removeButton").click(function () {
  	if(counter==2){
            alert("Must have at least 1 guest");
            return false;
         }   
  	counter--;
    $("#TextBoxDiv" + counter).remove();
  });

});
  /*   $("#getButtonValue").click(function () {
 
	var msg = '';
	for(i=1; i<counter; i++){
   	  msg += "\n Guest #" + i + " : " + $('#textbox' + i).val();
	}
    	  alert(msg);
     }); */
  