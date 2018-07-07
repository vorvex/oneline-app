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
  
});