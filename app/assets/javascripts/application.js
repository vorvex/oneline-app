// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require jquery-ui/widget
//= require jquery-ui/widgets/sortable
//= require twitter/bootstrap
//= require turbolinks
//= require ckeditor/init
//= require_tree .

document.addEventListener("turbolinks:load", function() {
  
  $('[data-behavior="sortable"]').sortable({
    update: function(e, ui) {
      Rails.ajax({
        url: $(this).data("url"),
        type: "PATCH",
        data: $(this).sortable("serialize"),
      });
    }    
  });
  
  $('[data-behavior="getModal"]').on('click', function(){
    $.ajax({
      type: "GET",
      url: $(this).data("url"),
    });
  });
  
  $('[data-behavior="createComponent"]').on('click', function(){
    
    var data = {
                  position: $(this).data('position'),
                  section: $(this).data('section'),
               };
    $.ajax({
      type: "GET",
      url: $(this).data("url"),
      data: data,
    });
  });
  
});


// $('[data-behavior="ajaxForm"]').submit(function(e) {
//    $.ajax({
//           type: "POST",
//           url: $(this).data("url"),
//           data: $("#idForm").serialize(),
//           success: function(data)
//           {
//               alert(data); 
//           }
//         });
//
//    e.preventDefault(); // avoid to execute the actual submit of the form.
// });


