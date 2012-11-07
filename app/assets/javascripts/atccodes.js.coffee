# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#atccodes').dataTable
    bPaginate: true,
    sPaginationType: "full_numbers",
    iDisplayLength: 5,
    aLengthMenu: [[5, 10, 20, -1], [5, 10, 20, "All"]]
    #bServerSide: true,
    #sAjaxSource: "/rb/ajax_atc.rb",
    #bDeferRender: true
