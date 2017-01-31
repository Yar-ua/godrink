// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// Код, который цепляет плагин lightbox к объектам с аттрибутом data-toggle="lightbox"
$(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
  event.preventDefault();
  $(this).ekkoLightbox();
});

// Скрываем форму добавления фотографии и показываем её по клику на ссылку
// ++! требуется доработка
/* $(function(){
  $('.event-photo-form').hide();

  $('.event-photo-form-link').click(function(){
    $('.event-photo-form').slideToggle(300);
    return false;
  });
});
*/