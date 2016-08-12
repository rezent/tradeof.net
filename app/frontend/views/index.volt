{{ tag.getDoctype() }}
<html class="no-js" lang="{{ substr(i18n.lang(), 0, 2) }}">
<head>
    <meta charset="utf-8" />

    {{ getTitle() }}
    <meta name="description" content="{{ siteDesc }}" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <meta property="og:image" content="path/to/image.jpg" />

    {{ stylesheetLink('css/main.min.css') }}
    <!--[if (lte IE 9)]>
        {{ javascriptInclude('js/es5-shim.min.js') }}
        {{ javascriptInclude('js/html5shiv.min.js') }}
        {{ javascriptInclude('js/html5shiv-printshiv.min.js') }}
        {{ javascriptInclude('js/respond.min.js') }}
        {{ stylesheetLink('css/ie9style.min.css') }}
    <![endif]-->
    {{ this.assets.outputCss() }}

    <link rel="icon" type="image/x-icon" href="{{ this.url.getStatic('img/favicon/favicon.ico') }}" />
    <link rel="apple-touch-icon" href="{{ this.url.getStatic('img/favicon/apple-touch-icon.png') }}" />
    <link rel="apple-touch-icon" sizes="72x72" href="{{ this.url.getStatic('img/favicon/apple-touch-icon-72x72.png') }}" />
    <link rel="apple-touch-icon" sizes="114x114" href="{{ this.url.getStatic('img/favicon/apple-touch-icon-114x114.png') }}" />

</head>
{% if this.request.getUri() == '/' OR this.request.getUri() == '/index' %}
    <body class="ishome">
{% else %}
    <body class="page">
{% endif %}

    {% if this.request.getUri() == '/' OR this.request.getUri() == '/index' %}
        {{ this.partial('partial/header_main') }}
    {% else %}
        {{ this.partial('partial/header') }}
    {% endif %}

    <div class="main">
        <div class="main__wrapper">
            <div class="breadcrumbs">
                {{ breadcrumbs.output() }}
            </div>
            {{ flashSession.output() }}
            <aside class="aside">
                <div class="basket">
                    <div class="basket__box">
                        <div class="basket__icon"></div>
                        <div class="basket__quantity">0</div>
                        <div class="basket__sum"> {{ __('Cart is empty') }}</div>
                    </div>
                </div>
                <div class="basket__list">
                    <div class="basket__item">
                        <div class="basket__item-img">
                            {{ image('img/busket-img.jpg', 'alt': '#') }}
                        </div>
                        <div class="basket__item-button">x</div>
                        <div class="basket__item-text">
                            <a href="#">Угольник 90 градусов с резьбой. 50мм</a>
                        </div>
                    </div>
                </div>

                {% if this.request.getUri() != '/contact' And this.request.getUri() != '/certificate' And this.request.getUri() != '/o-nas' And this.request.getUri() != '/dostavka-i-oplata' And (strpos(this.request.getUri(), '/article') === FALSE And isProd == false) %}
                    {{ this.partial('partial/filter') }}
                {% endif %}
                {% if isProd == true %}
                    {{ this.partial('partial/prod_filter') }}
                {% endif %}

            </aside>
            {{ content() }}

            {% if this.request.getUri() == '/' OR this.request.getUri() == '/index' %}
                {{ this.partial('partial/main/catalog') }}
            {% endif %}

            {% if this.request.getUri() == '/' OR this.request.getUri() == '/index' %}
                {{ this.partial('partial/main/certificate') }}
            {% endif %}

            {% if this.request.getUri() == '/' OR this.request.getUri() == '/index' %}
                {{ this.partial('partial/main/advantages') }}
            {% endif %}

            {% if this.request.getUri() == '/' OR this.request.getUri() == '/index' %}
                {{ this.partial('partial/main/production') }}
            {% endif %}

            {% if this.request.getUri() == '/' OR this.request.getUri() == '/index' %}
                {{ this.partial('partial/main/articles') }}
            {% endif %}

            {% if this.request.getUri() == '/' OR this.request.getUri() == '/index' %}
                {{ this.partial('partial/main/about') }}
            {% endif %}

            {% if this.request.getUri() == '/' OR this.request.getUri() == '/index' %}
                {{ this.partial('partial/main/map') }}
            {% endif %}

</div>

        {{ this.partial('partial/footer') }}
    </div>

    {{ this.partial('partial/modal') }}

    <script src="http://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
    {{ javascriptInclude('js/libs.js') }}
    {{ javascriptInclude('js/common.js') }}
    {{ this.assets.outputJs() }}
    {% if count(scripts) And isset(scripts) %}
        {% for script in scripts %}
            <script type="text/javascript">{{ script }}</script>
        {% endfor %}
    {% endif %}

</body>
</html>