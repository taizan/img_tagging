$(function(){
  function handleFileSelect(evt) {
    evt.stopPropagation();
    evt.preventDefault();

		$('#item_avatar')[0].files = evt.dataTransfer.files; // FileList object.

  }

  function handleDragOver(evt) {
    evt.stopPropagation();
    evt.preventDefault();
    evt.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
  }

  // Setup the dnd listeners.
	var dropZone = $('#drop_zone');
	if ( dropZone[0]){
		dropZone[0].addEventListener('dragover', handleDragOver, false);
	  	dropZone[0].addEventListener('drop', handleFileSelect, false);
	}
});
