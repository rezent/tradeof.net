<nav id="stick-menu">
    <div class="main-header__nav-wrapper">
        <form class="main-header__search">
            <div class="main-header__search-icon"></div>
            <input type="search" placeholder="{{ __('Search the catalog') }}">
        </form>
        <ul class="main-header__menu">
            <li>{{ link_to('o-nas', __('About us')) }}</li>
            <li class="main-header__menu-under-menu">
                {{ link_to('catalog', __('Catalog')) }}
                <ul>


                {% for cat in catalogArray %}
                    {% if cat['id_parent'] == 0 %}
                        <li>{{ link_to('catalog/'~cat['url'], cat['name']) }}</li>
                        {% if cat['children'] is defined %}
                            {% for g in cat['children'] %}
                            <li style="margin-left: 30px;">{{ link_to('catalog'~'/'~cat['url']~'/'~g['url'], g['name']) }}</li>
                            {% endfor %}
                        {% endif %}
                    {% endif %}
                {% endfor %}



                </ul>
            </li>
            <li>{{ link_to('dostavka-i-oplata', __('Shipping and payment')) }}</li>
            <li>{{ link_to('certificate', __('Certificate')) }}</li>
            <li>{{ link_to('contact', __('Contact')) }}</li>
            <li>{{ link_to('articles', __('Articles')) }}</li>
        </ul>
    </div>
</nav>