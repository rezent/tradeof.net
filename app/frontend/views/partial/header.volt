<!-- hd -->
	<header class="main-header page-header">
		<div class="main-header__wrapper">
			<div class="main-header__btn"><span></span></div>
			{{ link_to('/', image('img/logo.png', 'alt': 'Logo'), 'class':'main-header__logo page-header__logo') }}
			<div class="main-header__box page-header__box">
				{{ this.partial('partial/auth_bar') }}
				<div class="main-header__phone page-header__phone">
					<span>8 800 <b>700 85 73</b></span>
					<span>8 495 <b>797 13 37</b></span>
				</div>
				<div class="main-header__callback page-header__callback">
					<div class="main-header__callback-icon"></div>
					<div class="main-header__callback-link">
						<a href="#callback" class="popup-with-move-anim">{{ __('Request a call') }}</a>
					</div>
				</div>
			</div>

		</div>
		{{ this.partial('partial/nav') }}
	</header>