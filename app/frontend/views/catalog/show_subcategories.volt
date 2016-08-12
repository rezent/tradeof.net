<section class="catalog">
                <div class="catalog__title">
                    <h2> {{ hTitle }} </h2>
                </div>

                {% for cat in subcatArray %}
                    <div class="catalog__item">
                        <div class="catalog__item-img">
                            {{ image(imgCatalog~cat['id']~'/'~cat['img'], 'alt':cat['name']) }}
                        </div>
                        <div class="catalog__item-title">
                            <h3>{{ link_to('catalog/'~parentUrl~'/'~cat['url'], cat['name']) }}</h3>
                        </div>
                        <div class="catalog__item-number">
                            <span>{{ tool.countCat(cat['id']) }} шт.</span>
                        </div>
                    </div>
                {% endfor %}
</section>


{{ this.partial('partial/main/production_small') }}