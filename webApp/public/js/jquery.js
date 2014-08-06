$(document).ready(function() {
  
  $('#otherTipDiv').hide();
  var counter = 2;

  $("#addGuest").click(function() {
    var newTextBoxDiv = $(document.createElement('div')).attr("id", 'TextBoxDiv' + counter);
    newTextBoxDiv.after().html('<label>Guest #'+ counter + ' : &nbsp</label>' +
                               '<input type="text" onblur="updateNameBox(this.id)" name="textbox' + counter +
                               '" id="textbox' + counter + '" value="">' + 
                               '&nbsp<label>Amount : &nbsp</label>' +
                               '<input type="text" name="amtbox" id="amtbox' + counter + '" onkeyup="updateAmountTax()" >');
    newTextBoxDiv.appendTo("#TextBoxesGroup");
  
    var newNewText = $(document.createElement('p')).attr("id", 'guestName' + counter);
    newNewText.after().html(
      'Amount for Guest ' + counter + ': <span name="newText" id="newText' + counter + '"></span>'
    );
    newNewText.appendTo("#GuestBoxesGroup");
      counter++;
  });
 
  $("#removeGuest").click(function () {
    if (counter==2) {
            alert("Must have at least 1 guest");
            return false;
         }   
    counter--;
    $("#guestName" + counter).remove();
    $("#TextBoxDiv" + counter).remove();
    $("#NewTextDiv" + counter).remove();
  });

  $("#addAmountBox").click(function () {

  });

});
