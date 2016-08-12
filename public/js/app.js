$(document).ready(function() {

	$("#sort_select").change(function () {
		$(".equipment__sort").submit();
  	});

	var getSort = $.getUrlVar('sort');

	$("#sort_select [value='"+getSort+"']").attr("selected", "selected");

	$(".articles__item").equalHeights();
	$(".articles__item-title").equalHeights();
	$(".articles__item-text").equalHeights();
    $(".equipment__item").equalHeights();
    $(".equipment__item-title").equalHeights();
    $(".equipment__item-text").equalHeights();
    $(".equipment__item-price").equalHeights();
    $(".production__item-price").equalHeights();
    $(".breadcrumbs").equalHeights();

      	$("a[rel=cerImg]").fancybox({
          helpers: {
              title : {
                  type : 'float'
              }
          }
      	});

	var owl = $(".prod_rand");
	owl.owlCarousel({
		loop: true,
		nav: true,
		navText: '<>',
		items: 20,
		autoplay: true,
		responsive:{
	        0:{
	            items:1,

	        },
	        480:{
	            items:2,
	        },
	        768:{
	            items:3,
	        },
	    }
	});


	$('.minus').click(function () {

		var $input = $(this).parent().find('input');

		var count = parseInt($input.val()) - 1;

		count = count < 1 ? 1 : count;

		$input.val(count);

		$input.change();

		return false;

	});

	$('.plus').click(function () {

		var $input = $(this).parent().find('input');

		$input.val(parseInt($input.val()) + 1);

		$input.change();

		return false;

	});

});

$(function() {
	$('ul.tabs').delegate('li:not(.current)', 'click', function() {
		$(this).addClass('current').siblings().removeClass('current')
			.parents('div.section').find('div.box').hide().eq($(this).index()).fadeIn(150);
	})
})

$.extend({
  getUrlVars: function(){
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
      hash = hashes[i].split('=');
      vars.push(hash[0]);
      vars[hash[0]] = hash[1];
    }
    return vars;
  },
  getUrlVar: function(name){
    return $.getUrlVars()[name];
  }
});