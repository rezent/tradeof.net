<section class="catalog">
                <div class="catalog__title">
                    <h2>{{ __('Catalog') }}</h2>
                </div>

                {% for cat in catalogArray %}
                    {% if cat['id_parent'] == 0 %}
                    <div class="catalog__item">
                        <div class="catalog__item-img">
                            {{ image(imgCatalog~cat['id']~'/'~cat['img'], 'alt':'#') }}
                        </div>
                        <div class="catalog__item-title">
                            <h3>{{ link_to('catalog/'~cat['url'], cat['name']) }}</h3>
                        </div>
                        <div class="catalog__item-number">
                            <span>{{ tool.countCat(cat['id']) }} шт</span>
                        </div>
                        <ul class="catalog__item-list">
                        {% if cat['children'] is defined %}
                            {% for g in cat['children'] %}
                                    <li>{{ link_to('catalog'~'/'~cat['url']~'/'~g['url'], g['name']) }}</li>
                                    {% if g['children'] is defined %}
                                        {% for d in g['children'] %}
                                        <ul class="catalog__item-list" style="margin-left: 20px;">
                                                <li>{{ link_to('catalog'~'/'~cat['url']~'/'~g['url']~'/'~d['url'], d['name']) }}</li>
                                        </ul>
                                        {% endfor %}
                                    {% endif %}
                            {% endfor %}
                        {% endif %}
                        </ul>
                    </div>
                    {% endif %}
                {% endfor %}
</section>