$(document).on('turbolinks:load', function() {
  $(function () {
    'use strict'

    $('[data-toggle="offcanvas"]').on('click', function () {
      $('.offcanvas-collapse').toggleClass('open')
    })
  })
});
