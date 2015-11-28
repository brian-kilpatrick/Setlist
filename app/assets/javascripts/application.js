// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require ckeditor/init
//= require_tree .


// $(document).ready(function() {

// var setlist = document.getElementById('setlist');
// var sortable = Sortable.create(setlist);






// });



var ready, set_positions;

set_positions = function(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('.list-item').each(function(i){
    	$(this).attr("data-pos",i+1);
    });
 };

 ready = function(){

    // call set_positions function
    set_positions();
    
    $('#setlist').sortable();

     // after the order changes
     $('#setlist').sortable().bind('sortupdate', function(e, ui) {
        // array to store new order
        updated_order = []
        // set the updated positions
        set_positions();

        // populate the updated_order array with the new task positions
        $('.list-item').each(function(i){
        	updated_order.push({ id: $(this).data("id"), position: i+1 });
        });

        // send the updated order via ajax
        $.ajax({
        	type: "PUT",
        	url: '/setlists/sort',
        	data: { order: updated_order }
        });
     });

     // Modal-Trigger
     $('.modal-trigger').leanModal();

     // Datepicker
     $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 5, // Creates a dropdown of 5 years to control year
        format: 'mmmm d, yyyy'
      });

     $('.timepicker').pickatime()

     $(".setlist-item").click(function() {
         $(this).toggleClass('stroked');
     });

};

$(document).ready(ready);


