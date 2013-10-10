# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$("form").submit ->
		tag = ""
		for tag_input in $(".tag_input")
			tag += tag_input.value + ","
		$("#item_tag_txt").val tag
