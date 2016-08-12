$(function() {

	//stick menu

	$(document).ready(function() {

	var start_pos=$('#stick-menu').offset().top;

	 $(window).scroll(function(){

	  var w = $(window).width();

	  if (w > 1023) {

	  	if ($(window).scrollTop()>=start_pos) {

	      if ($('#stick-menu').hasClass()==false) $('#stick-menu').addClass('main-header__nav-top');

		  }

		  else $('#stick-menu').removeClass('main-header__nav-top');

		 } else $('#stick-menu').removeClass('main-header__nav-top');

	  

	 });

	});



	//mobile menu



	$(document).ready(function(){

		$(".main-header__btn").click(function(){

			$("#stick-menu").slideToggle();

		});

	});



	//удаляем display:none при изменении экрана

   	$(window).resize(function(){

    	var w = $(window).width();

    	if(w > 768 && $("#stick-menu").is(':hidden')) {

      		$("#stick-menu").removeAttr('style');

    	}

   	});



   	//корзина 

   	$(document).ready(function(){

		$(".basket").click(function(){

			$(".basket__list").slideToggle();

		});

	});



	//Адаптивный слайдер



	var owl = $(".production__slider");

	owl.owlCarousel({

		loop: true,

		nav: true,

		navText: '<>',

		items: 5,

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

	        1023:{

	            items:5,

	        }

	    }

	});

	// $(".slider__nav-next").click(function(){

	// 	owl.trigger("next.owl.carousel");

	// });

	// $(".slider__nav-prev").click(function(){

	// 	owl.trigger("prev.owl.carousel");

	// });



	

	//Выравнивание блоков по высоте



	$(".certificate__item-text").equalHeights();

	$(".advantages__item-title").equalHeights();

	$(".catalog__item").equalHeights();

	$(".catalog__item-title").equalHeights();

	$(".advantages__item").equalHeights();

	$(".production__item-title").equalHeights();

	$(".production__item-text").equalHeights();

	$(".articles__item-title").equalHeights();

	$(".articles__item-text").equalHeights();



	//fancybox

	$(document).ready(function() {

		$(".certificate__item-img").fancybox({

          helpers: {

              title : {

                  type : 'float'

              }

          }

      	});

      	$(".production__item-img").fancybox({

          helpers: {

              title : {

                  type : 'float'

              }

          }

      	});

      	$(".equipment__item-img").fancybox({

          helpers: {

              title : {

                  type : 'float'

              }

          }

      	});

	});



	//popup



	$('.popup-with-move-anim').magnificPopup({

		type: 'inline',



		fixedContentPos: false,

		fixedBgPos: true,



		overflowY: 'auto',



		closeBtnInside: true,

		preloader: false,


		midClick: true,

		removalDelay: 300,

		mainClass: 'my-mfp-slide-bottom'

	});



	//E-mail Ajax Send

	//Documentation & Example: https://github.com/agragregra/uniMail

	$("#callback").submit(function() { //Change

		var th = $(this);

		$.ajax({

			type: "POST",

			url: "mail.php", //Change

			data: th.serialize()

		}).done(function() {

			$(".success").addClass("visible");

			setTimeout(function() {

				// Done Functions

				th.trigger("reset");

				$(".success").removeClass("visible");

			}, 3000);

		});

		return false;

	});



	$('.callback').on('submit', function(){

		if ( $(this).find('input').val() ) {

			alert('Вашe cообщение отправлено, мы свяжемся с вами как можно скорее.');

		}

		return false;

	});

	//Chrome Smooth Scroll

	try {

		$.browserSelector();

		if($("html").hasClass("chrome")) {

			$.smoothScroll();

		}

	} catch(err) {



	};



	$("img, a").on("dragstart", function(event) { event.preventDefault(); });



});





//Yandex map

ymaps.ready(function () {

    var myMap = new ymaps.Map('map', {

            center: [55.121659, 36.592738],

            zoom: 17,

            controls: ['zoomControl']

        }, {

            searchControlProvider: 'yandex#search'

        }),

        myPlacemark = new ymaps.Placemark(myMap.getCenter(), {

            hintContent: '',

            balloonContent: ''

        }, {

            // Опции.

            // Необходимо указать данный тип макета.

            iconLayout: 'default#image',

            // Своё изображение иконки метки.

            iconImageHref: 'public/img/map.png',

            // Размеры метки.

            iconImageSize: [367, 69],

            // Смещение левого верхнего угла иконки относительно

            // её "ножки" (точки привязки).

            iconImageOffset: [-33, -82]

        });



    myMap.geoObjects.add(myPlacemark);

});





