# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# 12-25-16 jquery.raty:

# http://js2.coffee/ to convert JS to coffee

# see a snapshot of documentation @ 1:11:22 https://www.youtube.com/watch?v=0DR5JLZ2Qgg&t=1234s
# demo (applicable documentation) on a fork: http://jacob87.github.io/raty-fa/
# http://stackoverflow.com/questions/22466345/using-raty-jquery-plugin-with-rails-4-0-scaffold-form

# Read and convert numeric rating to Stars (on _review partial):
$( document ).on 'turbolinks:load', ->
  $( '.star-rating' ).raty
    path: '/assets',
    readOnly: true,
    score: ->
      $( this ).attr( 'data-score' )
  return

# Read and convert numeric rating to Stars, set Star rating (on reviews _form):
$( document ).on 'turbolinks:load', ->
  $( '#star-rating' ).raty
    path: '/assets',
    scoreName: 'review[rating]'
    score: ->
      $( this ).attr( 'data-score' )
  return
