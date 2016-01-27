$(document).ready(function() {

  $(".action-delete").on("click", function(e) {
    e.preventDefault();

    if (confirm("Are you sure you want to delete that?")) {
      var self = this;
      $.ajax({
        url: $(this).attr("data-url"),
        type: 'DELETE',
        dataType: 'json'
      })
      .done(function() {
        $(self).parent().slideUp('fast');
      })
      .fail(function() {
        var duration = 200;
        $(self).parent().fadeIn(duration).fadeOut(duration).fadeIn(duration).fadeOut(duration).fadeIn(duration);
      });
    }
  });

});
