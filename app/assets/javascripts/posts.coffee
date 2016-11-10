# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# 

$(document).ready ->
  $grid = $('.grid').masonry(
    itemSelector: '.grid-item'
    columnWidth: '.grid-sizer'
    percentPosition: true)

  $('.lazy-load-img').lazyload()

  $('.lazy-load-img').load ->
    $grid.imagesLoaded().progress ->
      $grid.masonry()
      return
    return
  return