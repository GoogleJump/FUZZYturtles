$(document).ready(function() {
  $('#otherTip').hide();
  var counter = 2;

  $("#addButton").click(function() {
    var newTextBoxDiv = $(document.createElement('div')).attr("id", 'TextBoxDiv' + counter);
    newTextBoxDiv.after().html('<label>Guest #'+ counter + ' : &nbsp</label>' +
                               '<input type="text" name="textbox' + counter +
                               '" id="textbox' + counter + '" value="" >' + 
                               '&nbsp<label>Amount : &nbsp</label>' +
                               '<input type="text" name="amtbox" id="amtbox' + counter + '" value="" >');
    newTextBoxDiv.appendTo("#TextBoxesGroup");
  
    var newNewText = $(document.createElement('p')).attr("id", 'NewTextDiv' + counter);
    newNewText.after().html(
      'Amount for Guest ' + counter + ': <span name="newText" id="newText' + counter + '"></span>'
    );
    newNewText.appendTo("#NewTextBoxesGroup");
      counter++;
  });
 
  $("#removeButton").click(function () {
    if (counter==2) {
            alert("Must have at least 1 guest");
            return false;
         }   
    counter--;
    $("#TextBoxDiv" + counter).remove();
    $("#NewTextDiv" + counter).remove();
  });

});
