<!-- hdm -->
    <header class="main-header">
        <div class="main-header__wrapper">
            <div class="main-header__btn"><span></span></div>
            {{ link_to('/', image('img/logo.png', 'alt': 'Logo'), 'class':'main-header__logo page-header__logo') }}
            <div class="main-header__box">

                {{ this.partial('partial/auth_bar') }}

                <div class="main-header__phone">
                    <span>8 800 <b>700 85 73</b></span>
                    <span>8 495 <b>797 13 37</b></span>
                </div>
                <div class="main-header__callback">
                    <div class="main-header__callback-icon"></div>
                    <div class="main-header__callback-link">
                        <a href="#callback" class="popup-with-move-anim">{{ __('Request a call') }}</a>
                    </div>
                </div>
            </div>
            <div class="main-header__img-box">
                <div class="main-header__img-box-title">
                    <h1>{{ __('Equipment<br> microfiltration <small>online shop</small>') }}</h1>

                </div>
                <div class="main-header__img-box-item-1">
                    <span>{{ __('Filtration plant') }}</span>
                </div>
                <div class="main-header__img-box-item-2">
                    <span>{{ __('Filtering gases') }}</span>
                </div>
                <div class="main-header__img-box-item-3">
                    <div>
                        <span>{{ __('Filtration of liquids') }}</span>
                    </div>
                </div>
                <div class="main-header__img-box-pict">

                    {{ image('img/main-header-img.png', 'alt': '#') }}
                </div>
            </div>
        </div>
        {{ this.partial('partial/nav') }}
    </header>