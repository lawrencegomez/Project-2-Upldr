# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# The below script was moved to the actual images index.html file because the turbo links thing that is being
# used to load images faster was caching that page which required me to refresh the page. Now that its within the
# the actual image html page, it gets loaded every time and so if prevents it from getting cached
# $ ->
#   $('#pins').imagesLoaded ->
#     $('#pins').masonry
#       itemSelector: '.box'
#       isFitWidth: true
