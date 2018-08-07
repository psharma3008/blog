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
//= require jquery3
//= require jquery_ujs
//= require popper
//= require tether
//= require react
//= require bootstrap
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	$('.destory').on('click', function(){
		var id =  $(this).parent().parent().parent().parent().attr('id');
		// var post_id = $(this).attr("post_id");
		$.ajax({
			url:  '/blogger/'+id+'/articles/'+this.parentElement.id,
			type: 'DELETE',
			success: function(r){
				alert("Successfully deleted plz reload page");

			} 
		});
	});

	$('.D_com').on('click', function(){
		var article_id =  $(this).parent().parent().parent().parent().attr('id');
		var blog_id = $(this).parent().parent().parent().parent().parent().attr('id');
		// var post_id = $(this).attr("post_id");
		$.ajax({
			url:  '/blogger/'+blog_id+'/articles/'+article_id+'/comments/'+this.parentElement.id,
			type: 'DELETE',
			success: function(r){
				alert("Successfully deleted plz reload page");

			} 
		});
	});
});